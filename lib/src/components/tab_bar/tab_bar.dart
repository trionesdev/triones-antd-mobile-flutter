import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

/// @component AntTabBar
class AntTabBar extends StatefulWidget {
  const AntTabBar({
    super.key,
    this.padding,
    this.height = 54,
    this.children,
    this.color,
    this.activeColor,
    this.activeKey,
    this.defaultActiveKey,
    this.onChange,
    this.decoration,
    this.style,
  });

  /// @description 样式
  /// @default null
  final StateStyle? style;

  /// @description 装饰
  /// @default null
  final BoxDecoration? decoration;

  /// @description 边距
  /// @default null
  final EdgeInsetsGeometry? padding;

  /// @description 高度
  /// @default 54
  final double? height;

  /// @description 颜色
  /// @default null
  final Color? color;

  /// @description 激活颜色
  /// @default null
  final Color? activeColor;

  /// @description 当前激活的tabKey（受控）
  /// @default null
  final String? activeKey;

  /// @description 默认激活的tabKey（非受控）
  /// @default null
  final String? defaultActiveKey;

  /// @description 切换回调
  /// @default null
  final Function(String key, int index)? onChange;

  /// @description 子组件
  /// @default null
  final List<Widget>? children;

  static AntTabBarState? maybeOf(BuildContext context) {
    final _AntTabBarScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntTabBarScope>();
    return scope?._tabBarState;
  }

  static AntTabBarState of(BuildContext context) {
    final AntTabBarState? result = maybeOf(context);
    assert(result != null, 'AntTabBar.of() called with a context that does not contain an AntTabBar.');
    return result!;
  }

  @override
  State<StatefulWidget> createState() => AntTabBarState();
}

class AntTabBarState extends State<AntTabBar> with MaterialStateMixin {
  int _generation = 0;
  final Set<AntTabBarItemState> _items = <AntTabBarItemState>{};
  String? _currentActiveKey;

  /// 是否为受控模式（由外部 activeKey 驱动）
  bool get _isControlled => widget.activeKey != null;

  List<AntTabBarItem> get _tabItems =>
      widget.children?.whereType<AntTabBarItem>().toList() ?? const [];

  Color? get color => widget.color;

  Color? get activeColor {
    return widget.activeColor ?? AntTheme.of(context).colorPrimary;
  }

  String? get currentActiveKey => _currentActiveKey;

  void _register(AntTabBarItemState item) {
    _items.add(item);
  }

  void _unregister(AntTabBarItemState item) {
    _items.remove(item);
  }

  bool isActive(String tabKey) => _currentActiveKey == tabKey;

  int _indexOfKey(String key) {
    return _tabItems.indexWhere((item) => item.antKey == key);
  }

  void _setCurrentActiveKey(String key) {
    if (key == _currentActiveKey) {
      return;
    }
    if (!_isControlled) {
      setState(() {
        _currentActiveKey = key;
        ++_generation;
      });
    }
    widget.onChange?.call(key, _indexOfKey(key));
  }

  @override
  void initState() {
    super.initState();
    final items = _tabItems;
    _currentActiveKey =
        widget.activeKey ??
        widget.defaultActiveKey ??
        (items.isNotEmpty ? items.first.antKey : null);
  }

  @override
  void didUpdateWidget(AntTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.activeKey != oldWidget.activeKey) {
      _currentActiveKey = widget.activeKey ?? _currentActiveKey;
      ++_generation;
    } else if (!_isControlled &&
        widget.defaultActiveKey != oldWidget.defaultActiveKey &&
        widget.defaultActiveKey != null &&
        _currentActiveKey == oldWidget.defaultActiveKey) {
      // 仅当仍停留在旧默认值时，跟随 defaultActiveKey 变化
      _currentActiveKey = widget.defaultActiveKey;
      ++_generation;
    }
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntTabBarStyle();
    stateStyle = stateStyle.merge(widget.style);
    final resolvedStyle = stateStyle.resolve(materialStates);

    return _AntTabBarScope(
      tabBarState: this,
      generation: _generation,
      child: Container(
        decoration: widget.decoration ?? resolvedStyle?.decoration,
        child: BottomAppBar(
          color: Colors.transparent,
          height: widget.height ?? 54,
          padding: widget.padding ?? resolvedStyle?.computedPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.children ?? const [],
          ),
        ),
      ),
    );
  }
}

class _AntTabBarStyle extends StateStyle {
  @override
  Style get style {
    return Style(padding: StylePadding.symmetric(vertical: 4));
  }
}

class _AntTabBarScope extends InheritedWidget {
  const _AntTabBarScope({
    required super.child,
    required int generation,
    required AntTabBarState tabBarState,
  }) : _generation = generation,
       _tabBarState = tabBarState;

  final int _generation;
  final AntTabBarState _tabBarState;

  @override
  bool updateShouldNotify(_AntTabBarScope old) =>
      _generation != old._generation;
}

class AntTabBarItem extends StatefulWidget {
  const AntTabBarItem({
    super.key,
    required this.antKey,
    this.child,
    this.icon,
    this.activeIcon,
    this.label,
    this.labelText,
    this.labelTextStyle,
    this.onPressed,
    this.color,
    this.activeColor,
    this.stopPropagation = true,
  });

  final String antKey;
  final Widget? child;
  final Widget? icon;
  final Widget? activeIcon;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final Function(String key)? onPressed;
  final Color? color;
  final Color? activeColor;

  /// 保留字段，与历史 API 兼容
  final bool stopPropagation;

  @override
  State<StatefulWidget> createState() => AntTabBarItemState();
}

class AntTabBarItemState extends State<AntTabBarItem> {
  _AntTabBarScope? _ancestor;
  bool _registered = false;

  AntTabBarState? get _tabBar => _ancestor?._tabBarState;

  Color? get color => widget.color ?? _tabBar?.color;

  Color? get activeColor {
    return widget.activeColor ??
        _tabBar?.activeColor ??
        AntTheme.of(context).colorPrimaryText;
  }

  bool get isActive => _tabBar?.currentActiveKey == widget.antKey;

  Widget _buildIcon() {
    final displayIcon =
        (isActive && widget.activeIcon != null)
            ? widget.activeIcon!
            : widget.icon;
    if (displayIcon == null) {
      return const SizedBox.shrink();
    }
    if (displayIcon is Icon) {
      return WidgetUtils.iconMerge(
        Icon(displayIcon.icon, color: isActive ? activeColor : color),
        displayIcon,
      );
    }
    return displayIcon;
  }

  Widget? _buildLabel() {
    if (widget.label != null) {
      if (widget.label is Text) {
        final Text labelText = widget.label as Text;
        return WidgetUtils.textMerge(
          Text(
            labelText.data ?? '',
            style: TextStyle(
              fontSize: 12,
              color: isActive ? activeColor : color,
            ).merge(widget.labelTextStyle),
          ),
          labelText,
        );
      }
      return widget.label;
    }
    if (widget.labelText != null) {
      return Text(
        widget.labelText!,
        style: TextStyle(
          fontSize: 12,
          color: isActive ? activeColor : color,
        ).merge(widget.labelTextStyle),
      );
    }
    return null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scope =
        context.dependOnInheritedWidgetOfExactType<_AntTabBarScope>();
    if (_registered && _ancestor != null && scope != _ancestor) {
      _ancestor!._tabBarState._unregister(this);
      _registered = false;
    }
    _ancestor = scope;
    if (!_registered && _ancestor != null) {
      _ancestor!._tabBarState._register(this);
      _registered = true;
    }
  }

  @override
  void dispose() {
    if (_registered) {
      _ancestor?._tabBarState._unregister(this);
      _registered = false;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    if (widget.icon != null || widget.activeIcon != null) {
      children.add(_buildIcon());
    }
    final label = _buildLabel();
    if (label != null) {
      children.add(label);
    }

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _tabBar?._setCurrentActiveKey(widget.antKey);
          widget.onPressed?.call(widget.antKey);
        },
        child:
            widget.child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 2,
              children: children,
            ),
      ),
    );
  }
}

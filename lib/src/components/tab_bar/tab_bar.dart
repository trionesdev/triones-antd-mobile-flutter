import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';


class AntTabBar extends StatefulWidget {
  const AntTabBar(
      {super.key,
      this.padding,
      this.height = 54,
      this.children,
      this.color,
      this.activeColor,
      this.activeKey,
      this.defaultActiveKey,
      this.onChange,
      this.decoration,
      this.style});

  final StateStyle? style;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Color? color;
  final Color? activeColor;
  final String? activeKey;
  final String? defaultActiveKey;
  final Function(String key)? onChange;
  final List<AntTabBarItem>? children;

  static AntTabBarState? maybeOf(BuildContext context) {
    _AntTabBarScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntTabBarScope>();
    return scope?._tabBarState;
  }

  static AntTabBarState of(BuildContext context) {
    AntTabBarState? result = maybeOf(context);
    return result!;
  }

  @override
  State<StatefulWidget> createState() => AntTabBarState();
}

class AntTabBarState extends State<AntTabBar> with MaterialStateMixin {
  int _generation = 0;
  final Set<AntTabBarItemState> _items = <AntTabBarItemState>{};
  String? _currentActiveKey;

  Color? get color {
    return widget.color;
  }

  Color? get activeColor {
    AntThemeData themeData = AntTheme.of(context);
    return widget.activeColor ?? themeData.colorPrimary;
  }

  void _itemDidChange() {
    _forceRebuild();
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  void _register(AntTabBarItemState item) {
    _items.add(item);
  }

  void _unregister(AntTabBarItemState item) {
    _items.remove(item);
  }

  bool isActive(String tabKey) {
    return _currentActiveKey == tabKey;
  }

  void _setCurrentActiveKey(String key) {
    if (key == _currentActiveKey) {
      return;
    }
    setState(() {
      _currentActiveKey = key;
    });
    _itemDidChange();
    widget.onChange?.call(key);
  }

  @override
  void initState() {
    super.initState();
    _currentActiveKey =
        (widget.activeKey ?? widget.defaultActiveKey) ?? widget.children?.first.tabKey;
  }

  @override
  void didUpdateWidget(AntTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeKey != widget.activeKey) {
      setState(() {
        _currentActiveKey = widget.activeKey;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntTabBarStyle();
    stateStyle = stateStyle.merge(widget.style);

    return PopScope(
        child: _AntTabBarScope(
            tabBarState: this,
            generation: _generation,
            child: Container(
              decoration: widget.decoration ??
                  stateStyle.resolve(materialStates)?.decoration,
              child: SafeArea(
                  child: BottomAppBar(
                color: Colors.transparent,
                height: widget.height!,
                padding: widget.padding ??
                    stateStyle.resolve(materialStates)?.computedPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.children ?? [],
                ),
              )),
            )));
  }
}

class _AntTabBarStyle extends StateStyle {
  @override
  Style get style {
    return Style(padding: StylePadding.symmetric(vertical: 4));
  }
}

class _AntTabBarScope extends InheritedWidget {
  const _AntTabBarScope(
      {required super.child,
      required int generation,
      required AntTabBarState tabBarState})
      : _generation = generation,
        _tabBarState = tabBarState;
  final int _generation;
  final AntTabBarState _tabBarState;

  @override
  bool updateShouldNotify(_AntTabBarScope old) =>
      _generation != old._generation;
}

class AntTabBarItem extends StatefulWidget {
  const AntTabBarItem(
      {super.key,
      required this.tabKey,
      this.child,
      this.icon,
      this.label,
      this.onPressed,
      this.color,
      this.activeColor,
      this.stopPropagation=true});

  final String tabKey;
  final Widget? child;
  final Widget? icon;
  final Widget? label;
  final Function(String key)? onPressed;
  final Color? color;
  final Color? activeColor;
  final bool stopPropagation;

  @override
  State<StatefulWidget> createState() => AntTabBarItemState();
}

class AntTabBarItemState extends State<AntTabBarItem> {
  Color? get color {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    if (widget.color != null) {
      return widget.color!;
    }
    if (tabBar?.color != null) {
      return tabBar?.color;
    }
    return null;
  }

  Color? get activeColor {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    if (widget.activeColor != null) {
      return widget.activeColor!;
    }
    if (tabBar?.activeColor != null) {
      return tabBar?.activeColor;
    }
    return null;
  }

  bool get isActive {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    return tabBar?._currentActiveKey == widget.tabKey;
  }

  void didChange() {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    tabBar?._itemDidChange();
  }

  Widget icon() {
    if (widget.icon is Icon) {
      Icon iconIcon = widget.icon as Icon;
      return WidgetUtils.iconMerge(
          Icon(
            iconIcon.icon,
            color: isActive ? activeColor : color,
          ),
          iconIcon);
    }
    return widget.icon!;
  }

  Widget label(){
    if(widget.label is Text){
      Text text = widget.label as Text;
      return WidgetUtils.textMerge(
          Text(
            text.data ?? '',
            style: TextStyle(fontSize: 12, color: isActive ? activeColor : color),
          ),
          text);
    }
    return widget.label!;
  }

  @override
  void dispose() {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    tabBar?._unregister(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    tabBar?._register(this);

    List<Widget> children = [];
    if (widget.icon != null) {
      children.add(icon());
    }
    if (widget.label != null) {
      children.add(label());
    }

    return Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            tabBar?._setCurrentActiveKey(widget.tabKey);
            widget.onPressed?.call(widget.tabKey);
          },
          child: widget.child ??
              Column(
                children: children,
              ),
        ));
  }
}

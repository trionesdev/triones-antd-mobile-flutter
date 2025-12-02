import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntCheckboxBaseGroup extends StatefulWidget {
  const AntCheckboxBaseGroup({
    super.key,
    this.children,
    this.child,
    this.defaultValue,
    this.disabled = false,
    this.onChange,
    this.value,
    this.iconSize,
  });

  final List<dynamic>? defaultValue;
  final List<dynamic>? value;
  final bool disabled;
  final double? iconSize;
  final ValueChanged<List<dynamic>?>? onChange;
  final List<AntCheckbox>? children;
  final Widget? child;

  static AntCheckboxBaseGroupState? maybeOf(BuildContext context) {
    final _AntCheckboxGroupScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntCheckboxGroupScope>();
    return scope?._checkboxGroupState;
  }

  @override
  State<StatefulWidget> createState() => AntCheckboxBaseGroupState();
}

class AntCheckboxBaseGroupState extends State<AntCheckboxBaseGroup> {
  int _generation = 0;
  List<dynamic> _value = [];

  final Set<_AntCheckboxState> _checkboxStates = <_AntCheckboxState>{};

  double? get _iconSize {
    return widget.iconSize;
  }

  bool get _disabled {
    return widget.disabled;
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  void _register(_AntCheckboxState checkbox) {
    _checkboxStates.add(checkbox);
    checkbox._groupValueChange(_value);
  }

  void _unregister(_AntCheckboxState checkbox) {
    _checkboxStates.remove(checkbox);
  }

  void _didGroupValueInit(List<dynamic>? val) {
    _value = val ?? [];
    if (_checkboxStates.isNotEmpty) {
      for (var checkboxState in _checkboxStates) {
        checkboxState._groupValueChange(_value);
      }
    }
  }

  void _didItemValueChange(dynamic val, bool checked) {
    if (checked) {
      if (!_value.contains(val)) {
        _value.add(val);
      }
    } else {
      _value.remove(val);
    }
    widget.onChange?.call(_value);
    _forceRebuild();
  }

  @override
  void initState() {
    _value = widget.value ?? widget.defaultValue ?? [];
    // _didGroupValueInit(_value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AntCheckboxBaseGroup oldWidget) {
    if (widget.value != oldWidget.value) {
      _value = widget.value ?? widget.defaultValue ?? [];
      // _didGroupValueInit(_value);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: _AntCheckboxGroupScope(
        checkboxGroupState: this,
        generation: _generation,
        child: widget.child ?? Container(),
      ),
    );
  }
}

class _AntCheckboxGroupScope extends InheritedWidget {
  const _AntCheckboxGroupScope({
    required super.child,
    required AntCheckboxBaseGroupState checkboxGroupState,
    required int generation,
  }) : _checkboxGroupState = checkboxGroupState,
       _generation = generation;
  final AntCheckboxBaseGroupState _checkboxGroupState;
  final int _generation;

  AntCheckboxBaseGroup get radioGroup => _checkboxGroupState.widget;

  @override
  bool updateShouldNotify(covariant _AntCheckboxGroupScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}

class AntCheckbox extends StatefulWidget {
  const AntCheckbox({
    super.key,
    this.label,
    this.labelText,
    this.block = false,
    this.checked,
    this.defaultChecked = false,
    this.disabled,
    this.checkedIcon,
    this.uncheckedIcon,
    this.onChange,
    this.onTap,
    this.value,
    this.iconSize,
    this.spacing = 4,
  });

  /// @description 标签
  /// @default null
  final Widget? label;

  /// @description 标签文本
  /// @default null
  final String? labelText;

  /// @description 是否块级
  /// @default false
  final bool block;

  /// @description 是否选中
  /// @default null
  final bool? checked;

  /// @description 是否选中(默认)
  /// @default false
  final bool defaultChecked;

  /// @description 是否禁用
  /// @default false
  final bool? disabled;

  /// @description 选中图标
  /// @default null
  final Widget? checkedIcon;

  /// @description 未选中图标
  /// @default null
  final Widget? uncheckedIcon;

  /// @description 选中状态变化回调
  /// @default null
  final ValueChanged<bool>? onChange;

  /// @description 点击回调
  /// @default null
  final ValueChanged<void>? onTap;

  /// @description 值
  /// @default null
  final dynamic value;

  /// @description 图标大小
  /// @default null
  final double? iconSize;

  /// @description 间距
  /// @default 4
  final double? spacing;

  @override
  State<StatefulWidget> createState() => _AntCheckboxState();
}

class _AntCheckboxState extends State<AntCheckbox> {
  late bool _checked = false;

  double get _iconSize {
    return widget.iconSize ??
        AntCheckboxBaseGroup.maybeOf(context)?._iconSize ??
        22;
  }

  void _groupValueChange(List<dynamic> val) {
    if (val.contains(widget.value)) {
      if (!_checked) {
        setState(() {
          _checked = true;
        });
      }
    } else {
      if (_checked) {
        setState(() {
          _checked = false;
        });
      }
    }
  }

  Widget icon() {
    if (_checked) {
      return widget.checkedIcon ?? _DefaultCheckedIcon(iconSize: _iconSize);
    } else {
      return widget.uncheckedIcon ?? _DefaultUnCheckedIcon(iconSize: _iconSize);
    }
  }

  Widget? get innerLabel {
    if (widget.label != null) {
      return widget.label!;
    }
    if (widget.labelText != null) {
      return Text(widget.labelText!);
    }
    return null;
  }

  Widget label() {
    var labelWidget = Container(
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(minHeight: 32),
      child: innerLabel,
    );
    if (widget.block) {
      return Expanded(child: labelWidget);
    } else {
      return labelWidget;
    }
  }

  bool get _disabled {
    return widget.disabled ??
        AntCheckboxBaseGroup.maybeOf(context)?._disabled ??
        false;
  }

  void changeChecked(bool val) {
    setState(() {
      _checked = val;
    });
    widget.onChange?.call(val);
  }

  void handleInit() {
    _checked = widget.checked ?? widget.defaultChecked;
    widget.onChange?.call(_checked);
  }

  @override
  void initState() {
    handleInit();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AntCheckbox oldWidget) {
    if (widget.checked != oldWidget.checked) {
      handleInit();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    AntCheckboxBaseGroup.maybeOf(context)?._unregister(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    AntCheckboxBaseGroupState? checkboxGroupState =
        AntCheckboxBaseGroup.maybeOf(context);
    checkboxGroupState?._register(this);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (_disabled) {
          return;
        }
        _checked = !_checked;
        if (checkboxGroupState != null) {
          checkboxGroupState._didItemValueChange(widget.value, _checked);
          return;
        }
        changeChecked(_checked);
      },
      child: Container(
        child: Row(
          mainAxisSize: widget.block ? MainAxisSize.max : MainAxisSize.min,
          spacing: widget.spacing ?? 0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 32),
              alignment: Alignment.center,
              child: UnconstrainedBox(child: Container(child: icon())),
            ),
            if (widget.label != null) label(),
          ],
        ),
      ),
    );
  }
}

class _DefaultCheckedIcon extends StatelessWidget {
  const _DefaultCheckedIcon({this.iconSize = 22});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return Container(
      width: iconSize,
      height: iconSize,
      child: Icon(
        Icons.check_circle,
        color: themeData.colorPrimary,
        size: iconSize + 2,
      ),
    );
  }
}

@immutable
class _DefaultUnCheckedIcon extends StatelessWidget {
  const _DefaultUnCheckedIcon({this.iconSize = 22});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(90)),
        border: Border.all(color: themeData.colorBorder, width: 1),
      ),
    );
  }
}

/// @component AntCheckboxGroup 多选框组
class AntCheckboxGroup extends StatelessWidget {
  const AntCheckboxGroup({
    super.key,
    this.layout = AntLayout.vertical,
    this.defaultValue,
    this.value,
    this.disabled = false,
    this.iconSize,
    this.onChange,
    this.children,
  });

  /// @description 布局方向
  /// @default AntLayout.vertical
  final AntLayout layout;

  /// @description 默认值
  final List<dynamic>? defaultValue;

  /// @description 当前值
  /// @default null
  final List<dynamic>? value;

  /// @description 是否禁用
  /// @default false
  final bool disabled;

  /// @description 图标大小
  /// @default null
  final double? iconSize;

  /// @description 选中状态变化回调
  /// @default null
  final ValueChanged<List<dynamic>?>? onChange;

  /// @description 子组件
  /// @default null
  final List<AntCheckbox>? children;

  @override
  Widget build(BuildContext context) {
    return AntCheckboxBaseGroup(
      defaultValue: defaultValue,
      value: value,
      disabled: disabled,
      iconSize: iconSize,
      onChange: onChange,
      child:
          (() {
            if (layout == AntLayout.vertical) {
              return Column(spacing: 8, children: children ?? []);
            } else {
              return Wrap(
                spacing: 8,
                direction: Axis.horizontal,
                children: children ?? [],
              );
            }
          })(),
    );
  }
}

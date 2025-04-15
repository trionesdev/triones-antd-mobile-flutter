import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AntCheckboxGroup extends StatefulWidget {
  const AntCheckboxGroup({super.key,
    this.children,
    this.child,
    this.defaultValue,
    this.disabled = false,
    this.onChange,
    this.value,
    this.iconSize});

  final List<dynamic>? defaultValue;
  final List<dynamic>? value;
  final bool disabled;
  final double? iconSize;
  final Function(List<dynamic>? val)? onChange;
  final List<AntCheckbox>? children;
  final Widget? child;

  static AntCheckboxGroupState? maybeOf(BuildContext context) {
    final _AntCheckboxGroupScope? scope =
    context.dependOnInheritedWidgetOfExactType<_AntCheckboxGroupScope>();
    return scope?._checkboxGroupState;
  }

  @override
  State<StatefulWidget> createState() => AntCheckboxGroupState();
}

class AntCheckboxGroupState extends State<AntCheckboxGroup> {
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
    _didGroupValueInit(widget.value ?? widget.defaultValue ?? []);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AntCheckboxGroup oldWidget) {
    if (widget.value != oldWidget.value) {
      _didGroupValueInit(widget.value ?? widget.defaultValue ?? []);
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
        ));
  }
}

class _AntCheckboxGroupScope extends InheritedWidget {
  const _AntCheckboxGroupScope({required super.child,
    required AntCheckboxGroupState checkboxGroupState,
    required int generation})
      : _checkboxGroupState = checkboxGroupState,
        _generation = generation;
  final AntCheckboxGroupState _checkboxGroupState;
  final int _generation;

  AntCheckboxGroup get radioGroup => _checkboxGroupState.widget;

  @override
  bool updateShouldNotify(covariant _AntCheckboxGroupScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}

class AntCheckbox extends StatefulWidget {
  const AntCheckbox({super.key,
    this.label,
    this.block = false,
    this.checked,
    this.defaultChecked = false,
    this.disabled,
    this.checkedIcon,
    this.uncheckedIcon,
    this.onChange,
    this.onTap,
    this.value,
    this.iconSize, this.spacing = 4});

  final Widget? label;
  final bool block;
  final bool? checked;
  final bool defaultChecked;
  final bool? disabled;
  final Widget? checkedIcon;
  final Widget? uncheckedIcon;
  final Function(bool val)? onChange;
  final Function? onTap;
  final dynamic value;
  final double? iconSize;
  final double? spacing;

  @override
  State<StatefulWidget> createState() => _AntCheckboxState();
}

class _AntCheckboxState extends State<AntCheckbox> {
  late bool _checked = false;

  double get _iconSize {
    return widget.iconSize ??
        AntCheckboxGroup
            .maybeOf(context)
            ?._iconSize ??
        22;
  }

  void _groupValueChange(List<dynamic> val) {
    if (val.contains(widget.value)) {
      _checked = true;
    } else {
      _checked = false;
    }
  }

  Widget icon() {
    if (_checked) {
      return widget.checkedIcon ??
          _DefaultCheckedIcon(
            iconSize: _iconSize,
          );
    } else {
      return widget.uncheckedIcon ??
          _DefaultUnCheckedIcon(
            iconSize: _iconSize,
          );
    }
  }

  Widget label() {
    var labelWidget = Container(
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(minHeight: 32,), child: widget.label,);
    if (widget.block) {
      return Expanded(child: labelWidget);
    } else {
      return labelWidget;
    }
  }

  bool get _disabled {
    return widget.disabled ??
        AntCheckboxGroup
            .maybeOf(context)
            ?._disabled ??
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
    AntCheckboxGroup.maybeOf(context)?._unregister(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    AntCheckboxGroupState? checkboxGroupState =
    AntCheckboxGroup.maybeOf(context);
    checkboxGroupState?._register(this);
    return GestureDetector(
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
          spacing: widget.spacing ?? 0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Container(
              constraints: BoxConstraints(
                  minHeight: 32
              ),
              alignment: Alignment.center,
              child: UnconstrainedBox(child: Container(child: icon(),),)),
            if(widget.label != null ) label()
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
          border: Border.all(color: themeData.colorBorder, width: 1)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AntRadioGroup extends StatefulWidget {
  const AntRadioGroup(
      {super.key,
      this.children,
      this.defaultValue,
      this.disabled = false,
      this.onChange,
      this.value,
      this.iconSize});

  final dynamic defaultValue;
  final dynamic value;
  final bool disabled;
  final double? iconSize;
  final Function(dynamic val)? onChange;
  final List<AntRadio>? children;

  static AntRadioGroupState? maybeOf(BuildContext context) {
    final _AntRadioGroupScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntRadioGroupScope>();
    return scope?._radioGroupState;
  }

  @override
  State<StatefulWidget> createState() => AntRadioGroupState();
}

class AntRadioGroupState extends State<AntRadioGroup> {
  int _generation = 0;
  dynamic _value;

  final Set<_AntRadioState> _radioStates = <_AntRadioState>{};

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

  void _register(_AntRadioState radio) {
    _radioStates.add(radio);
    if (radio.widget.value == _value) {
      radio._groupValueChange(_value);
    }
  }

  void _unregister(_AntRadioState radio) {
    _radioStates.remove(radio);
  }

  void _didValueChange(dynamic val) {
    setState(() {
      _value = val;
    });
    widget.onChange?.call(val);
    if (_radioStates.isNotEmpty) {
      for (var radioState in _radioStates) {
        radioState._groupValueChange(val);
      }
    }

    _forceRebuild();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.value ?? widget.defaultValue;
    });
  }

  @override
  void didUpdateWidget(covariant AntRadioGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _didValueChange(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: _AntRadioGroupScope(
      radioGroupState: this,
      generation: _generation,
      child: Column(
        children: widget.children ?? [],
      ),
    ));
  }
}

class _AntRadioGroupScope extends InheritedWidget {
  const _AntRadioGroupScope(
      {required super.child,
      required AntRadioGroupState radioGroupState,
      required int generation})
      : _radioGroupState = radioGroupState,
        _generation = generation;
  final AntRadioGroupState _radioGroupState;
  final int _generation;

  AntRadioGroup get radioGroup => _radioGroupState.widget;

  @override
  bool updateShouldNotify(covariant _AntRadioGroupScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}

class AntRadio extends StatefulWidget {
  const AntRadio(
      {super.key,
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
      this.iconSize});

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

  @override
  State<StatefulWidget> createState() => _AntRadioState();
}

class _AntRadioState extends State<AntRadio> {
  late bool _checked = false;

  double get _iconSize {
    return widget.iconSize ?? AntRadioGroup.maybeOf(context)?._iconSize ?? 22;
  }

  void _groupValueChange(dynamic val) {
    if (val == widget.value) {
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
    if (widget.block) {
      return Expanded(child: widget.label ?? Text(""));
    } else {
      return widget.label ?? Text("");
    }
  }

  bool get _disabled {
    return widget.disabled ??
        AntRadioGroup.maybeOf(context)?._disabled ??
        false;
  }

  void changeChecked(bool val) {
    setState(() {
      _checked = val;
    });
    widget.onChange?.call(val);
  }

  @override
  void initState() {
    super.initState();
    if (widget.checked != null) {
      changeChecked(widget.checked!);
    } else {
      changeChecked(widget.defaultChecked);
    }
  }

  @override
  void deactivate() {
    AntRadioGroup.maybeOf(context)?._unregister(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    AntRadioGroupState? radioGroupState = AntRadioGroup.maybeOf(context);
    radioGroupState?._register(this);
    return GestureDetector(
      onTap: () {
        if (_disabled) {
          return;
        }
        if (radioGroupState != null) {
          if (!_checked) {
            radioGroupState._didValueChange(widget.value);
          }
          return;
        }
        setState(() {
          _checked = !_checked;
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(4),
        child: Row(
          spacing: 4,
          children: [icon(), label()],
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

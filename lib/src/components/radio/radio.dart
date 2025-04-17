import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

enum AntRadioLayout{
  horizontal,
  vertical
}

class AntRadioBaseGroup extends StatefulWidget {
  const AntRadioBaseGroup({super.key,
    // this.children,
    this.defaultValue,
    this.disabled = false,
    this.onChange,
    this.value,
    this.iconSize,
    this.child,
    this.size});

  final dynamic defaultValue;
  final dynamic value;
  final bool disabled;
  final double? iconSize;
  final Function(dynamic val)? onChange;

  // final List<AntRadioBase>? children;
  final Widget? child;
  final AntRadioSize? size;

  static AntRadioBaseGroupState? maybeOf(BuildContext context) {
    final _AntRadioGroupScope? scope =
    context.dependOnInheritedWidgetOfExactType<_AntRadioGroupScope>();
    return scope?._radioGroupState;
  }

  @override
  State<StatefulWidget> createState() => AntRadioBaseGroupState();
}

class AntRadioBaseGroupState extends State<AntRadioBaseGroup> {
  int _generation = 0;
  dynamic _value;

  final Set<RadioStateMixin> _radioStates = <RadioStateMixin>{};

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

  void _register(RadioStateMixin radio) {
    _radioStates.add(radio);
    radio._groupValueChange(_value);
  }

  void _unregister(RadioStateMixin radio) {
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

  int index(RadioStateMixin state) {
    for (int i = 0; i < _radioStates.length; i++) {
      if (_radioStates.elementAtOrNull(i) == state) {
        return i;
      }
    }
    return -1;
  }

  int get activeIndex {
    for (int i = 0; i < _radioStates.length; i++) {
      if (_radioStates
          .elementAtOrNull(i)
          ?._checked == true) {
        return i;
      }
    }
    return -1;
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? widget.defaultValue;

    /// 在父级组件渲染完成后，更新状态，避免构建冲突，对于注册之后的子组件更新状态
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _forceRebuild();
    });
  }

  @override
  void didUpdateWidget(covariant AntRadioBaseGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _value = widget.value ?? widget.defaultValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: _AntRadioGroupScope(
          radioGroupState: this,
          generation: _generation,
          child: widget.child!,
        ));
  }
}

class _AntRadioGroupScope extends InheritedWidget {
  const _AntRadioGroupScope({required super.child,
    required AntRadioBaseGroupState radioGroupState,
    required int generation})
      : _radioGroupState = radioGroupState,
        _generation = generation;
  final AntRadioBaseGroupState _radioGroupState;
  final int _generation;

  AntRadioBaseGroup get radioGroup => _radioGroupState.widget;

  @override
  bool updateShouldNotify(covariant _AntRadioGroupScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}

abstract class AntRadioBase extends StatefulWidget {
  const AntRadioBase(
      {super.key, this.value, this.label, this.disabled = false});

  final dynamic value;
  final Widget? label;
  final bool disabled;
}

mixin RadioStateMixin<T extends AntRadioBase> on State<T> {
  bool _checked = false;

  int get childrenCount {
    return AntRadioBaseGroup
        .maybeOf(context)
        ?._radioStates
        .length ?? 0;
  }

  int get index {
    return AntRadioBaseGroup.maybeOf(context)?.index(this) ?? -1;
  }

  int get activeIndex {
    return AntRadioBaseGroup
        .maybeOf(context)
        ?.activeIndex ?? -1;
  }

  bool get _disabled {
    return widget.disabled ??
        AntRadioBaseGroup
            .maybeOf(context)
            ?._disabled ??
        false;
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

  @override
  void deactivate() {
    AntRadioBaseGroup.maybeOf(context)?._unregister(this);
    super.deactivate();
  }
}

class AntRadio extends AntRadioBase {
  const AntRadio({super.key,
    super.label,
    this.block = false,
    this.checked,
    this.defaultChecked = false,
    super.disabled,
    this.checkedIcon,
    this.uncheckedIcon,
    this.onChange,
    this.onTap,
    super.value,
    this.iconSize});

  final bool block;
  final bool? checked;
  final bool defaultChecked;
  final Widget? checkedIcon;
  final Widget? uncheckedIcon;
  final Function(bool val)? onChange;
  final Function? onTap;
  final double? iconSize;

  @override
  State<StatefulWidget> createState() => _AntRadioState();
}

class _AntRadioState extends State<AntRadio> with RadioStateMixin {
  double get _iconSize {
    return widget.iconSize ??
        AntRadioBaseGroup
            .maybeOf(context)
            ?._iconSize ??
        22;
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
  Widget build(BuildContext context) {
    AntRadioBaseGroupState? radioGroupState =
    AntRadioBaseGroup.maybeOf(context);
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

class AntRadioGroup extends StatelessWidget {
  const AntRadioGroup({
    super.key,
    this.children = const [],
    this.defaultValue,
    this.value,
    this.disabled = false,
    this.onChange,
    this.layout = AntRadioLayout.vertical,
    this.spacing=4,
  });

  final AntRadioLayout layout;
  final List<AntRadio> children;
  final dynamic defaultValue;
  final dynamic value;
  final bool disabled;
  final Function(dynamic val)? onChange;
  final double spacing;

  Widget _children(){
    if (layout == AntRadioLayout.horizontal) {
      return Row(
        spacing: spacing,
        children: children,
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        spacing: spacing,
        children: children,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AntRadioBaseGroup(
      defaultValue: defaultValue,
      value: value,
      disabled: disabled,
      onChange: onChange,
      child: _children(),
    );
  }
}

class AntRadioButton extends AntRadioBase {
  const AntRadioButton({super.key, super.label, super.value});

  @override
  State<StatefulWidget> createState() => _AntRadioButtonState();
}

class _AntRadioButtonState extends State<AntRadioButton>
    with RadioStateMixin, MaterialStateMixin {
  Widget? get labelWidget {
    AntThemeData themeData = AntTheme.of(context);
    if (widget.label is Text) {
      Text text = widget.label as Text;
      if (_checked) {
        return WidgetUtils.textMerge(
            Text(
              text.data ?? "",
              style: TextStyle(color: themeData.colorPrimary),
            ),
            text);
      }
      return text;
    }
    return widget.label;
  }

  double? get height {
    AntRadioBaseGroupState? radioGroupState = AntRadioBaseGroup.maybeOf(
        context);
    switch (radioGroupState?.widget.size) {
      case AntRadioSize.large:
        return 40;
      case AntRadioSize.middle:
        return 32;
      case AntRadioSize.small:
        return 24;
      default:
        return 32;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AntRadioBaseGroupState? radioGroupState =
    AntRadioBaseGroup.maybeOf(context);
    radioGroupState?._register(this);

    StateStyle stateStyle = AntRadioButtonStyle(
        context, _checked, index, activeIndex, childrenCount);

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
        decoration: stateStyle
            .resolve(materialStates)
            ?.decoration,
        padding: stateStyle
            .resolve(materialStates)
            ?.computedPadding,
        height: height,
        alignment: Alignment.center,
        child: labelWidget,
      ),
    );
  }
}

class AntRadioButtonStyle extends StateStyle {
  AntRadioButtonStyle(this.context, this.checked, this.index, this.activeIndex,
      this.childrenCount)
      : super();
  final BuildContext context;

  final bool checked;
  final int index;
  final int activeIndex;
  final int childrenCount;

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    bool isFirst = index == 0;
    bool isLast = index == childrenCount - 1;

    Color borderColor =
    checked ? themeData.colorPrimary : themeData.colorBorder;
    bool showLeft = isFirst || activeIndex == index;
    bool showRight = (isFirst && activeIndex != index + 1) ||
        isLast ||
        activeIndex == index ||
        (!isFirst && activeIndex != index + 1);
    return Style(
        padding: StylePadding.symmetric(horizontal: 8),
        borderTop:
        StyleBorder(color: borderColor, width: 1, style: BorderStyle.solid),
        borderBottom:
        StyleBorder(color: borderColor, width: 1, style: BorderStyle.solid),
        borderLeft: showLeft
            ? StyleBorder(
            color: borderColor, width: 1, style: BorderStyle.solid)
            : null,
        borderRight: showRight
            ? StyleBorder(
            color: borderColor, width: 1, style: BorderStyle.solid)
            : null,
        borderTopLeftRadius: isFirst ? themeData.borderRadius : null,
        borderBottomLeftRadius: isFirst ? themeData.borderRadius : null,
        borderTopRightRadius: isLast ? themeData.borderRadius : null,
        borderBottomRightRadius: isLast ? themeData.borderRadius : null);
  }
}

enum AntRadioSize {
  small,
  middle,
  large,
}

class AntRadioButtonGroup extends StatelessWidget {
  const AntRadioButtonGroup({super.key,
    required this.children,
    this.defaultValue,
    this.value,
    this.disabled = false,
    this.onChange,
    this.size = AntRadioSize.middle});

  final List<AntRadioButton> children;
  final dynamic defaultValue;
  final dynamic value;
  final bool disabled;
  final Function(dynamic val)? onChange;
  final AntRadioSize? size;

  @override
  Widget build(BuildContext context) {
    return AntRadioBaseGroup(
      defaultValue: defaultValue,
      value: value,
      disabled: disabled,
      onChange: onChange,
      size: size,
      child: Row(
        children: children.map((item) {
          return Expanded(child: item);
        }).toList(),
      ),
    );
  }
}

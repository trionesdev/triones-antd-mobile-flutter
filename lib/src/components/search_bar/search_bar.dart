import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AntSearchBarStyles {
  const AntSearchBarStyles({
    this.input,
  });

  final StateStyle? input;
}

class AntSearchBar extends StatefulWidget {
  const AntSearchBar(
      {super.key,
      this.style,
      this.decoration,
      this.searchIcon,
      this.showCancelButton = false,
      this.placeholder,
      this.value,
      this.onChange,
      this.styles,
      this.height = 32,
      this.allowClear = true,
      this.onlyShowClearWhenFocus = true,
      this.clearOnCancel = true,
      this.onCancel,
      this.cancelText});

  final StateStyle? style;
  final BoxDecoration? decoration;
  final Widget? searchIcon;
  final bool? allowClear;
  final bool? showCancelButton;
  final String? placeholder;
  final String? value;
  final Function? onChange;
  final Function? onCancel;
  final AntSearchBarStyles? styles;
  final double? height;
  final bool? onlyShowClearWhenFocus;
  final bool? clearOnCancel;
  final String? cancelText;

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<AntSearchBar> with MaterialStateMixin {
  String? _value;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    _focused = false;
  }

  @override
  void dispose() {
    super.dispose();
    _value = null;
  }

  @override
  Widget build(BuildContext context) {
    StateStyle style = _SearchBarStyle();
    style = style.merge(widget.style);

    Widget? cancelIcon;
    if (_value != null && _value != '' && widget.allowClear == true) {
      cancelIcon = GestureDetector(
        child: Icon(Icons.cancel_rounded, color: Color(0xffCCCCCC), size: 20),
        onTap: () {
          setState(() {
            _value = null;
          });
          widget.onChange?.call(null);
        },
      );
    }

    List<Widget> children = [
      Expanded(
          child: Container(
        decoration:
            widget.decoration ?? style.resolve(materialStates)?.decoration,
        padding: style.resolve(materialStates)?.computedPadding,
        height: widget.height,
        child: ClipRRect(
          borderRadius: style.resolve(materialStates)!.computedBorderRadius,
          child: AntInput(
            value: _value,
            onChange: (value) {
              setState(() {
                _value = value;
              });
              widget.onChange?.call(value);
            },
            placeholder: widget.placeholder,
            prefix: widget.searchIcon ??
                Icon(Icons.search, color: Color(0xffD5D5D5), size: 20),
            suffix: cancelIcon,
            onFocus: () {
              setState(() {
                _focused = true;
              });
            },
            onBlur: () {
              setState(() {
                _focused = false;
              });
            },
            style: _SearchBarStyle().inputStyle.merge(widget.styles?.input),
          ),
        ),
      ))
    ];
    if (widget.showCancelButton == true &&
        ((widget.onlyShowClearWhenFocus == true && _focused == true) ||
            (widget.onlyShowClearWhenFocus == false))) {
      children.add(AntButton(
        text: widget.cancelText ?? '取消',
        type: ButtonType.text,
        onPressed: () {
          if (widget.clearOnCancel == true) {
            setState(() {
              _value = null;
            });
            widget.onChange?.call(null);
          }
          widget.onCancel?.call();
        },
      ));
    }

    return Row(
      spacing: 8,
      children: children,
    );
  }
}

class _SearchBarStyle extends StateStyle {
  const _SearchBarStyle();

  @override
  Style get style {
    return Style(
      borderRadius: 6,
    );
  }

  @override
  Style get focused {
    return Style();
  }

  StateStyle get inputStyle {
    return StateStyle(
      style: Style(
        backgroundColor: Color(0xffF5F5F5),
        padding: StylePadding(left: 0, right: 0, top: 0, bottom: 0),
        // borderRadius: 6
      ),
      focused: Style(
        backgroundColor: Color(0xffFfffff),
        // borderRadius: 6
      ),
    );
  }
}

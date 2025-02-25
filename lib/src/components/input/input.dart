import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

enum InputType {
  text,
  password,
}

typedef OnFocus = void Function();
typedef OnBlur = void Function();

class AntInput extends StatefulWidget {
  const AntInput({
    super.key,
    this.placeholder,
    this.type = InputType.text,
    this.prefix,
    this.suffix,
    this.value,
    this.onChange,
    this.decoration,
    this.height = 32,
    this.style,
    this.onBlur,
    this.onFocus,
  });

  final double? height;
  final String? placeholder;
  final InputType? type;
  final Widget? prefix;
  final Widget? suffix;
  final String? value;
  final Function? onChange;
  final BoxDecoration? decoration;
  final StateStyle? style;
  final OnBlur? onBlur;
  final OnFocus? onFocus;

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<AntInput> with MaterialStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool passwordVisible = true;

  @override
  void didUpdateWidget(AntInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value != _controller.text) {
        _controller.text = widget.value ?? '';
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value ?? "";
    _focusNode.addListener(() {
      setMaterialState(WidgetState.focused, _focusNode.hasFocus);
      if (_focusNode.hasFocus) {
        widget.onFocus?.call();
      } else {
        widget.onBlur?.call();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StateStyle style = _AntInputStyle();
    style = style.merge(widget.style);

    double? iconSize() {
      if (widget.height != null) {
        double size = widget.height! * 7 / 10;
        if (size <= 40) {
          return size;
        }
      }
      return null;
    }

    Widget? suffixIcon;
    if (widget.type == InputType.password || widget.suffix != null) {
      suffixIcon = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.type == InputType.password)
            GestureDetector(
              onTap: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              child: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
                size: iconSize(),
              ),
            ),
          if (widget.suffix != null) widget.suffix!,
        ],
      );
    }

    return Container(
      decoration:
          widget.decoration ?? style.resolve(materialStates)?.decoration,
      height: widget.height,
      padding: style.resolve(materialStates)?.computedPadding,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        obscureText: widget.type == InputType.password && passwordVisible,
        cursorColor: Colors.black,
        style: TextStyle(fontSize: style.resolve(materialStates)?.fontSize),
        decoration: InputDecoration(
          prefixIcon: widget.prefix,

          // 前缀图标
          suffixIcon: suffixIcon,
          hintText: widget.placeholder,
          hintStyle: TextStyle(color: Colors.grey),
          // 提示文本
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          print("input changed:" + value);
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        onEditingComplete: () {
          print("input c:" + _controller.text);
        },
      ),
    );
  }
}

class _AntInputStyle extends StateStyle {
  const _AntInputStyle();

  @override
  Style get style {
    return Style(
      fontSize: 14,
      borderRadius: 6,
      padding: StylePadding(left: 8, right: 8, top: 0, bottom: 0),
    );
  }
}

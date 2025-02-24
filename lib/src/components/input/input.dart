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
    this.height,
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

class _InputState extends State<AntInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool passwordVisible = true;

  @override
  void didUpdateWidget(AntInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value != null && widget.value != _controller.text) {
        _controller.text = widget.value!;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value ?? "";
    _focusNode.addListener(() {
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

    Widget? suffixIcon;
    if (widget.type == InputType.password || widget.suffix != null) {
      suffixIcon = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.type == InputType.password)
            GestureDetector(
              onTap: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              child: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility),
            ),
          if (widget.suffix != null) widget.suffix!,
        ],
      );
    }

    return Container(
      decoration:
          widget.decoration ?? style.resolve(const <WidgetState>{})?.decoration,
      height: widget.height,
      padding: style.resolve(const <WidgetState>{})?.computedPadding,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        obscureText: widget.type == InputType.password && passwordVisible,
        cursorColor: Colors.black,
        style: TextStyle(fontSize: style.resolve(const <WidgetState>{})?.fontSize),
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
      padding: StylePadding(left: 8, right: 8, top: 0, bottom: 0),
    );
  }
}

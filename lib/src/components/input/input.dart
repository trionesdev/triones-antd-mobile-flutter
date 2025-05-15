import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

enum AntInputType { text, password, number }

class AntInput extends StatefulWidget {
  const AntInput({
    super.key,
    this.placeholder,
    this.type = AntInputType.text,
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

  final StateStyle? style;
  final double? height;
  final String? placeholder;
  final AntInputType? type;
  final Widget? prefix;
  final Widget? suffix;
  final String? value;
  final Function? onChange;
  final BoxDecoration? decoration;

  final VoidCallback? onBlur;
  final VoidCallback? onFocus;

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

  double? iconSize() {
    if (widget.height != null) {
      double size = widget.height! * 7 / 10;
      if (size <= 40) {
        return size;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    StateStyle style = _AntInputStyle();
    style = style.merge(widget.style);

    Widget? suffixIcon;
    if (widget.type == AntInputType.password || widget.suffix != null) {
      suffixIcon = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.type == AntInputType.password)
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
        obscureText: widget.type == AntInputType.password && passwordVisible,
        cursorColor: Colors.grey,
        style: TextStyle(fontSize: style.resolve(materialStates)?.fontSize),
        keyboardType: (() {
          if (widget.type == AntInputType.number) {
            return TextInputType.number;
          } else {
            return TextInputType.text;
          }
        })(),
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
        inputFormatters: [
          if (widget.type == AntInputType.number)
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
        ],
        onChanged: (value) {
          print("input changed:" + value);
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        onTapOutside: (event) {
          _focusNode.unfocus();
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
      padding: StylePadding(left: 0, right: 0, top: 0, bottom: 0),
    );
  }
}

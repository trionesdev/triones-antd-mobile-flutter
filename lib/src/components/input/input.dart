import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

enum AntInputType { text, password, number }

/// @component AntInput 输入框
class AntInput extends StatefulWidget {
  const AntInput({
    super.key,
    this.size = AntSize.middle,
    this.placeholder,
    this.type = AntInputType.text,
    this.prefix,
    this.suffix,
    this.value,
    this.defaultValue,
    this.disabled = false,
    this.onChange,
    this.decoration,
    this.height,
    this.style,
    this.onBlur,
    this.onFocus,
  });

  final StateStyle? style;

  /// @description 组件大小
  /// @default middle
  final AntSize size;

  /// @description 输入框高度
  final double? height;

  /// @description 提示文本
  /// @default null
  final String? placeholder;

  /// @description 输入框类型
  /// @default text
  final AntInputType? type;

  /// @description 前缀
  /// @default null
  final Widget? prefix;

  /// @description 后缀
  /// @default null
  final Widget? suffix;

  /// @description 当前值
  /// @default null
  final String? value;

  /// @description 默认值
  /// @default null
  final String? defaultValue;

  /// @description 是否禁用
  /// @default false
  final bool disabled;

  /// @description 值改变回调
  /// @default null
  final ValueChanged<String>? onChange;

  /// @description 输入框装饰
  /// @default null
  final BoxDecoration? decoration;

  /// @description 失去焦点回调
  /// @default null
  final ValueGetter<void>? onBlur;

  /// @description 获得焦点回调
  /// @default null
  final ValueGetter<void>? onFocus;

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<AntInput> with MaterialStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool passwordVisible = true;

  double? get height {
    if (widget.height != null) {
      return widget.height;
    }
    switch (widget.size) {
      case AntSize.large:
        return 48;
      case AntSize.middle:
        return 32;
      case AntSize.small:
        return 24;
    }
  }

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
    _controller.text = widget.value ?? widget.defaultValue ?? "";
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.type == AntInputType.password)
            GestureDetector(
              onTap: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              child: Icon(
                passwordVisible
                    ? AntIcons.eyeInvisibleOutline
                    : AntIcons.eyeOutline,
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
      height: height,
      padding: style.resolve(materialStates)?.computedPadding,
      child: TextField(
        enabled: !widget.disabled,
        controller: _controller,
        focusNode: _focusNode,
        obscureText: widget.type == AntInputType.password && passwordVisible,
        cursorColor: Colors.grey,
        style: TextStyle(fontSize: style.resolve(materialStates)?.fontSize),
        keyboardType:
            (() {
              if (widget.type == AntInputType.number) {
                return TextInputType.number;
              } else {
                return TextInputType.text;
              }
            })(),
        decoration: InputDecoration(
          prefixIcon:
              widget.prefix != null
                  ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [widget.prefix ?? SizedBox.shrink()],
                  )
                  : null,
          suffixIcon: suffixIcon,
          hintText: widget.placeholder,
          hintStyle: TextStyle(color: Colors.grey),
          // 提示文本
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.zero,
        ),
        inputFormatters: [
          if (widget.type == AntInputType.number)
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        ],
        onChanged: (value) {
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        onEditingComplete: () {},
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

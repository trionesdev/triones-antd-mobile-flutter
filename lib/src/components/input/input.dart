import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trionesdev_antd_mobile/src/components/constants.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

enum AntInputType { text, password, number }

enum AntInputAlign { left, right }

enum AntInputVariant { outlined, borderless, filled, underlined }

/// @component AntInput 输入框
class AntInput extends StatefulWidget {
  const AntInput({
    super.key,
    this.size = AntSize.middle,
    this.readOnly = false,
    this.placeholder,
    this.placeholderTextStyle,
    this.type = AntInputType.text,
    this.prefix,
    this.suffix,
    this.value,
    this.defaultValue,
    this.disabled = false,
    this.onChange,
    this.decoration,
    this.padding,
    this.height,
    this.style,
    this.onBlur,
    this.onFocus,
    this.align,
    this.variant = AntInputVariant.borderless,
    this.borderRadius,
    this.border,
    this.focusedBorder,
    this.gapPadding,
  });

  final StateStyle? style;

  /// @description 是否只读
  /// @default false
  final bool readOnly;

  /// @description 组件大小
  /// @default middle
  final AntSize size;

  /// @description 输入框高度
  final double? height;

  /// @description 提示文本
  /// @default null
  final String? placeholder;
  final TextStyle? placeholderTextStyle;

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
  final EdgeInsetsGeometry? padding;

  /// @description 失去焦点回调
  /// @default null
  final ValueGetter<void>? onBlur;

  /// @description 获得焦点回调
  /// @default null
  final ValueGetter<void>? onFocus;

  /// @description 对齐方式
  /// @default start
  final AntInputAlign? align;

  /// @description 输入框样式
  /// @default borderless
  final AntInputVariant? variant;

  /// @description 边框圆角
  /// @default null
  final BorderRadius? borderRadius;

  /// @description 边框
  /// @default null
  final BorderSide? border;

  /// @description 选中时的边框
  /// @default null
  final BorderSide? focusedBorder;
  /// @description 边框与内容之间的间距
  /// @default null
  final double? gapPadding;

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
        return sizeLg;
      case AntSize.middle:
        return sizeMd;
      case AntSize.small:
        return sizeSm;
    }
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

  TextAlign get textAlign {
    switch (widget.align) {
      case AntInputAlign.left:
        return TextAlign.start;
      case AntInputAlign.right:
        return TextAlign.end;
      default:
        return TextAlign.start;
    }
  }

  InputBorder? get border {
    AntThemeData theme = AntTheme.of(context);
    BorderSide borderSide = widget.border ?? BorderSide(color: Colors.black);
    BorderRadius borderRadius =
        widget.borderRadius ?? BorderRadius.circular(theme.borderRadius);
    double gapPadding = widget.gapPadding ?? 4;
    switch (widget.variant) {
      case AntInputVariant.outlined:
        return OutlineInputBorder(
          borderSide: borderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      case AntInputVariant.borderless:
        return OutlineInputBorder(borderSide: BorderSide.none, gapPadding: gapPadding);
      case AntInputVariant.filled:
        return OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      case AntInputVariant.underlined:
        return UnderlineInputBorder(borderSide: borderSide);
      default:
        return OutlineInputBorder(borderSide: BorderSide.none, gapPadding: gapPadding);
    }
  }

  InputBorder? get focusedBorder {
    AntThemeData theme = AntTheme.of(context);
    BorderRadius borderRadius =
        widget.borderRadius ?? BorderRadius.circular(theme.borderRadius);
    BorderSide focusedBorderSide =
        widget.focusedBorder ?? BorderSide(color: theme.colorPrimary);
    double gapPadding = widget.gapPadding ?? 4;
    switch (widget.variant) {
      case AntInputVariant.outlined:
        return OutlineInputBorder(
          borderSide: focusedBorderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      case AntInputVariant.borderless:
        return OutlineInputBorder(borderSide: BorderSide.none, gapPadding: gapPadding);
      case AntInputVariant.filled:
        return OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      case AntInputVariant.underlined:
        return UnderlineInputBorder(borderSide: focusedBorderSide);
      default:
        return OutlineInputBorder(borderSide: BorderSide.none, gapPadding: gapPadding);
    }
  }

  EdgeInsetsGeometry? contentPadding(StateStyle style) {
    double minVertical = (height! <= 13) ? 0 : (height! - 13) / 2;

    EdgeInsetsGeometry? padding =
        widget.padding ?? style.resolve(materialStates)?.computedPadding;

    if (padding != null) {
      EdgeInsets edgeInsets = padding.resolve(Directionality.of(context));
      double top = edgeInsets.top;
      double bottom = edgeInsets.bottom;
      if (edgeInsets.top < minVertical) {
        top = minVertical;
      }
      if (edgeInsets.bottom < minVertical) {
        bottom = minVertical;
      }
      return EdgeInsets.fromLTRB(
        edgeInsets.left,
        top,
        edgeInsets.right,
        bottom,
      );
    }
    return EdgeInsets.symmetric(vertical: minVertical);
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

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
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
      // height: height,
      // padding: widget.padding ?? style.resolve(materialStates)?.computedPadding,
      child: TextField(
        textAlign: textAlign,
        readOnly: widget.readOnly,
        enabled: !widget.disabled,
        controller: _controller,
        focusNode: _focusNode,
        obscureText: widget.type == AntInputType.password && passwordVisible,
        cursorColor: Colors.black,
        cursorWidth: 1,
        textAlignVertical: TextAlignVertical.center,
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
          isDense: true,
          prefixIcon: widget.prefix,
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(
            maxHeight: height!,
            minWidth: height!,
          ),
          hintText: widget.placeholder,
          hintStyle: TextStyle(color: Colors.grey).merge(
              widget.placeholderTextStyle),
          // 提示文本
          border: border,
          focusColor: theme.colorPrimary,
          focusedBorder: focusedBorder,
          filled: widget.variant == AntInputVariant.filled,
          fillColor: theme.colorFillTertiary,
          contentPadding: contentPadding(style),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trionesdev_antd_mobile/src/components/constants.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

enum AntInputType { text, password, number }

enum AntInputAlign { left, right }

enum AntInputVariant { outlined, borderless, filled, underlined }

/// 允许数字，且至多一个小数点
class _DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String text = newValue.text;
    if (text.isEmpty) {
      return newValue;
    }
    if (!RegExp(r'^\d*\.?\d*$').hasMatch(text)) {
      return oldValue;
    }
    return newValue;
  }
}

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
    this.gapPadding = 4,
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
  final VoidCallback? onBlur;

  /// @description 获得焦点回调
  /// @default null
  final VoidCallback? onFocus;

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

  /// true = 密文（obscure）
  bool _obscureText = true;

  double get _height {
    if (widget.height != null) {
      return widget.height!;
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

  double? get _iconSize {
    if (widget.height != null) {
      final double size = widget.height! * 7 / 10;
      if (size <= 40) {
        return size;
      }
    }
    return null;
  }

  TextAlign get _textAlign {
    switch (widget.align) {
      case AntInputAlign.right:
        return TextAlign.end;
      case AntInputAlign.left:
      case null:
        return TextAlign.start;
    }
  }

  InputBorder _border(AntThemeData theme) {
    final BorderSide borderSide =
        widget.border ?? BorderSide(color: theme.colorBorder);
    final BorderRadius borderRadius =
        widget.borderRadius ?? BorderRadius.circular(theme.borderRadius);
    final double gapPadding = widget.gapPadding ?? 4;
    switch (widget.variant) {
      case AntInputVariant.outlined:
        return OutlineInputBorder(
          borderSide: borderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      case AntInputVariant.filled:
        return OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      case AntInputVariant.underlined:
        return UnderlineInputBorder(borderSide: borderSide);
      case AntInputVariant.borderless:
      case null:
        return OutlineInputBorder(
          borderSide: BorderSide.none,
          gapPadding: gapPadding,
        );
    }
  }

  InputBorder _focusedBorder(AntThemeData theme) {
    final BorderRadius borderRadius =
        widget.borderRadius ?? BorderRadius.circular(theme.borderRadius);
    final BorderSide focusedBorderSide =
        widget.focusedBorder ?? BorderSide(color: theme.colorPrimary);
    final double gapPadding = widget.gapPadding ?? 4;
    switch (widget.variant) {
      case AntInputVariant.outlined:
        return OutlineInputBorder(
          borderSide: focusedBorderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      case AntInputVariant.filled:
        return OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      case AntInputVariant.underlined:
        return UnderlineInputBorder(borderSide: focusedBorderSide);
      case AntInputVariant.borderless:
      case null:
        return OutlineInputBorder(
          borderSide: BorderSide.none,
          gapPadding: gapPadding,
        );
    }
  }

  EdgeInsetsGeometry _contentPadding(Style? resolved) {
    final double minVertical = (_height <= 13) ? 0 : (_height - 13) / 2;
    final EdgeInsetsGeometry? padding =
        widget.padding ?? resolved?.computedPadding;

    if (padding != null) {
      final EdgeInsets edgeInsets = padding.resolve(Directionality.of(context));
      return EdgeInsets.fromLTRB(
        edgeInsets.left,
        edgeInsets.top < minVertical ? minVertical : edgeInsets.top,
        edgeInsets.right,
        edgeInsets.bottom < minVertical ? minVertical : edgeInsets.bottom,
      );
    }
    return EdgeInsets.symmetric(vertical: minVertical);
  }

  Widget? _suffixIcon() {
    if (widget.type != AntInputType.password && widget.suffix == null) {
      return null;
    }
    double rightPadding = widget.gapPadding ?? 4;
    if (widget.variant == AntInputVariant.underlined) {
      rightPadding = 0;
    }
    final bool interactionDisabled = widget.disabled || widget.readOnly;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.type == AntInputType.password)
          GestureDetector(
            onTap: interactionDisabled
                ? null
                : () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
            child: Icon(
              _obscureText
                  ? AntIcons.eyeInvisibleOutline
                  : AntIcons.eyeOutline,
              size: _iconSize,
            ),
          ),
        if (widget.suffix != null)
          Padding(
            padding: EdgeInsets.only(right: rightPadding),
            child: widget.suffix!,
          ),
      ],
    );
  }

  void _syncControllerText(String text) {
    if (_controller.text == text) {
      return;
    }
    final TextSelection oldSelection = _controller.selection;
    final int maxOffset = text.length;
    final int base = oldSelection.baseOffset.clamp(0, maxOffset);
    final int extent = oldSelection.extentOffset.clamp(0, maxOffset);
    _controller.value = TextEditingValue(
      text: text,
      selection: TextSelection(baseOffset: base, extentOffset: extent),
    );
  }

  void _handleFocusChange() {
    setMaterialState(WidgetState.focused, _focusNode.hasFocus);
    if (_focusNode.hasFocus) {
      widget.onFocus?.call();
    } else {
      widget.onBlur?.call();
    }
  }

  void _syncDisabledState() {
    setMaterialState(WidgetState.disabled, widget.disabled);
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value ?? widget.defaultValue ?? '';
    _focusNode.addListener(_handleFocusChange);
    _syncDisabledState();
  }

  @override
  void didUpdateWidget(AntInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.disabled != oldWidget.disabled) {
      _syncDisabledState();
    }
    if (widget.value != oldWidget.value &&
        widget.value != _controller.text) {
      _syncControllerText(widget.value ?? '');
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AntThemeData theme = AntTheme.of(context);
    final StateStyle stateStyle = const _AntInputStyle().merge(widget.style);
    final Style? resolved = stateStyle.resolve(materialStates);

    Widget field = TextField(
      textAlign: _textAlign,
      readOnly: widget.readOnly,
      enabled: !widget.disabled,
      controller: _controller,
      focusNode: _focusNode,
      obscureText: widget.type == AntInputType.password && _obscureText,
      cursorColor: theme.colorPrimary,
      cursorWidth: 1,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontSize: resolved?.fontSize,
        color: theme.colorText,
      ),
      keyboardType: widget.type == AntInputType.number
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: widget.prefix,
        suffixIcon: _suffixIcon(),
        suffixIconConstraints: BoxConstraints(
          maxHeight: _height,
          minWidth: _height,
        ),
        hintText: widget.placeholder,
        hintStyle: TextStyle(
          color: theme.colorTextPlaceholder,
        ).merge(widget.placeholderTextStyle),
        border: _border(theme),
        enabledBorder: _border(theme),
        focusColor: theme.colorPrimary,
        focusedBorder: _focusedBorder(theme),
        disabledBorder: _border(theme),
        filled: widget.variant == AntInputVariant.filled,
        fillColor: theme.colorFillTertiary,
        contentPadding: _contentPadding(resolved),
      ),
      inputFormatters: [
        if (widget.type == AntInputType.number) _DecimalTextInputFormatter(),
      ],
      onChanged: widget.onChange,
      onTapOutside: (_) {
        _focusNode.unfocus();
      },
    );

    if (widget.disabled) {
      field = Opacity(opacity: 0.4, child: field);
    }

    return SizedBox(
      height: _height,
      child: Container(
        decoration: widget.decoration ?? resolved?.decoration,
        alignment: Alignment.center,
        child: field,
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

library;

import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/src/components/constants.dart';
import '../../../trionesdev_antd_mobile.dart';

enum AntButtonType { primary, text, link }

enum AntButtonVariant { outlined, solid, filled, text, link }

enum AntButtonShape { circle, round }

/// @component Button 按钮
class AntButton extends StatefulWidget {
  const AntButton({
    super.key,
    this.type,
    this.block,
    this.color,
    this.danger,
    this.disabled,
    this.text,
    this.textStyle,
    this.icon,
    this.onPressed,
    this.variant,
    this.shape = AntButtonShape.round,
    this.size = AntSize.medium,
    this.style,
    this.child,
  });

  /// @description 按钮类型
  /// @default null
  final AntButtonType? type;

  /// @description 是否块级元素
  /// @default false
  final bool? block;

  /// @description 按钮颜色
  /// @default null
  final Color? color;

  /// @description 是否危险按钮
  /// @default false
  final bool? danger;

  /// @description 是否禁用
  /// @default false
  final bool? disabled;

  /// @description 按钮文字
  /// @default null
  final String? text;

  /// @description 按钮文字样式
  /// @default null
  final TextStyle? textStyle;

  /// @description 按钮图标
  /// @default null
  final Widget? icon;

  /// @description 点击事件
  /// @default null
  final VoidCallback? onPressed;

  /// @description 按钮变体
  /// @default null
  final AntButtonVariant? variant;

  /// @description 按钮形状
  /// @default round
  final AntButtonShape shape;

  /// @description 按钮大小
  /// @default middle
  final AntSize size;

  /// @description 按钮样式
  /// @default null
  final StateStyle? style;

  /// @description 子组件
  /// @default null
  final Widget? child;

  @override
  State<AntButton> createState() => _ButtonState();
}

class _ButtonState extends State<AntButton> with MaterialStateMixin {
  bool get _isDisabled =>
      widget.disabled == true || widget.onPressed == null;

  double get _height {
    switch (widget.size) {
      case AntSize.large:
        return sizeLg;
      case AntSize.medium:
        return sizeMd;
      case AntSize.small:
        return sizeSm;
    }
  }

  double? get _width {
    if (widget.shape != AntButtonShape.circle && widget.block == true) {
      return double.infinity;
    }
    if (widget.text == null && widget.child == null) {
      return _height;
    }
    return null;
  }

  BorderSide? _borderSide(Style? style, AntThemeData theme) {
    if (widget.variant == AntButtonVariant.outlined ||
        (widget.variant == null && widget.type == null)) {
      return BorderSide(
        color: style?.borderColor ?? theme.colorBorder,
        width: style?.borderWidth ?? 1,
      );
    }
    return null;
  }

  ShapeBorder _shapeBorder(Style? style, AntThemeData theme) {
    final BorderSide side = _borderSide(style, theme) ?? BorderSide.none;
    if (widget.shape == AntButtonShape.circle && widget.text == null) {
      return CircleBorder(side: side);
    }
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        style?.borderRadius ?? theme.borderRadius,
      ),
      side: side,
    );
  }

  Widget _content(Style? style) {
    if (widget.child != null) {
      return widget.child!;
    }
    if (widget.text != null) {
      return Text(
        widget.text!,
        style: TextStyle(
          color: style?.color,
          fontSize: style?.fontSize,
        ).merge(widget.textStyle),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final AntThemeData theme = AntTheme.of(context);
    final StateStyle stateStyle =
        _AntButtonStyle(widget, context).merge(widget.style);
    final Style? style = stateStyle.resolve(materialStates);

    Widget button = MaterialButton(
      onPressed: _isDisabled ? null : widget.onPressed,
      shape: _shapeBorder(style, theme),
      minWidth: 0,
      height: _height,
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      padding: style?.computedPadding,
      color: style?.backgroundColor,
      disabledColor: style?.backgroundColor,
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.icon != null) widget.icon!,
          if (widget.child != null || widget.text != null) _content(style),
        ],
      ),
    );

    if (_isDisabled) {
      button = Opacity(opacity: 0.4, child: button);
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _isDisabled
          ? null
          : (_) {
              setMaterialState(WidgetState.pressed, true);
            },
      onPointerUp: _isDisabled
          ? null
          : (_) {
              setMaterialState(WidgetState.pressed, false);
            },
      onPointerCancel: _isDisabled
          ? null
          : (_) {
              setMaterialState(WidgetState.pressed, false);
            },
      child: SizedBox(
        width: _width,
        height: _height,
        child: button,
      ),
    );
  }
}

class _AntButtonStyle extends StateStyle {
  const _AntButtonStyle(this.button, this.context);

  final BuildContext context;
  final AntButton button;

  AntThemeData get _theme => AntTheme.of(context);

  bool get isIconButton =>
      button.icon != null && button.text == null && button.child == null;

  /// 显式 color > danger 错误色 > null
  Color? get effectiveColor {
    if (button.color != null) {
      return button.color;
    }
    if (button.danger == true) {
      return _theme.colorError;
    }
    return null;
  }

  Color? get buttonTextColor {
    if (button.type == AntButtonType.primary ||
        button.variant == AntButtonVariant.solid) {
      return Colors.white;
    }
    if (effectiveColor != null) {
      return effectiveColor;
    }
    return Colors.black;
  }

  StylePadding? get padding {
    if (isIconButton) {
      return StylePadding();
    }
    switch (button.size) {
      case AntSize.small:
        return StylePadding(left: 12, right: 12);
      case AntSize.medium:
        return StylePadding(left: 18, right: 18);
      case AntSize.large:
        return StylePadding(left: 24, right: 24);
    }
  }

  Color? get buttonBackgroundColor {
    Color? result = Colors.transparent;
    final Color? tint = effectiveColor;

    if (button.type == AntButtonType.primary) {
      result = tint ?? _theme.colorPrimary;
    }
    if (button.variant == AntButtonVariant.solid) {
      result = tint ?? _theme.colorPrimary;
    }
    if (button.variant == AntButtonVariant.filled) {
      result = tint ?? _theme.colorPrimary;
    }
    return result;
  }

  Color? get buttonBorderColor {
    if (button.variant == AntButtonVariant.outlined || button.type == null) {
      return effectiveColor ?? _theme.colorBorder;
    }
    return null;
  }

  @override
  Style? get style {
    Color backgroundColor() {
      final Color finalColor = buttonBackgroundColor ?? Colors.white;
      if (button.variant == AntButtonVariant.filled) {
        return finalColor.withAlpha((255.0 * 0.08).round());
      }
      return finalColor;
    }

    return Style(
      color: buttonTextColor ?? Colors.black,
      backgroundColor: backgroundColor(),
      padding: padding,
      borderColor: buttonBorderColor,
      borderRadius:
          button.shape == AntButtonShape.circle ? 180 : _theme.borderRadius,
    );
  }

  @override
  Style? get hovered {
    Color? backgroundColor() {
      if ([
            AntButtonVariant.filled,
            AntButtonVariant.outlined,
            AntButtonVariant.text,
          ].contains(button.variant) ||
          button.type == AntButtonType.text) {
        return Colors.white;
      }
      return buttonBackgroundColor;
    }

    return Style(backgroundColor: backgroundColor());
  }

  @override
  Style? get pressed {
    Color? backgroundColor() {
      if ([
        AntButtonVariant.filled,
        AntButtonVariant.outlined,
        AntButtonVariant.text,
      ].contains(button.variant)) {
        return Colors.white.withAlpha((255.0 * 0.1).round());
      }
      return buttonBackgroundColor;
    }

    return Style(backgroundColor: backgroundColor());
  }
}

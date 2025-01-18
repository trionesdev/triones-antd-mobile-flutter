library;

import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';
import '../theme/theme.dart';
import 'antd_button_style.dart';

enum ButtonType { primary, text, link }

enum ButtonSize { large, middle, small }

enum ButtonVariant {
  outlined,
  solid,
  filled,
  text,
  link,
}

enum ButtonColor { primary, danger }

enum ButtonShape { circle, round }

class Button extends StatefulWidget {
  const Button(
      {super.key,
      this.type,
      this.block,
      this.color,
      this.danger,
      this.disabled,
      this.text,
      this.icon,
      this.onPressed,
      this.variant,
      this.shape = ButtonShape.round,
      this.size = ButtonSize.middle,
      this.style});

  final ButtonType? type;
  final bool? block;
  final Color? color;
  final bool? danger;
  final bool? disabled;
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final ButtonVariant? variant;
  final ButtonShape shape;
  final ButtonSize size;
  final AntdButtonStyle? style;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with MaterialStateMixin {
  static AntdButtonStyle styleFrom() {
    return AntdButtonStyle();
  }

  @override
  Widget build(BuildContext context) {
    final AntdThemeData theme = AntdTheme.of(context);

    AntdButtonStyle style = styleFrom();

    style = style.merge(_AntdButtonStyle(context: context, button: widget));
    style = style.merge(widget.style);

    if (widget.icon != null && widget.text == null) {
      return IconButton(
          onPressed: widget.onPressed,
          icon: widget.icon!,
          style: style.toButtonStyle());
    }

    return TextButton.icon(
      onPressed: widget.onPressed,
      icon: widget.icon,
      label: Text(
        widget.text != null ? widget.text! : '',
        style: style.textStyle?.resolve(const <WidgetState>{}),
      ),
      style: style.toButtonStyle(),
    );
  }
}

class _AntdButtonStyle extends AntdButtonStyle {
  const _AntdButtonStyle({required this.context, required this.button});

  final BuildContext context;
  final Button button;

  Color? get buttonBackgroundColor {
    Color? result = Colors.white;
    if (button.type == ButtonType.primary) {
      result = Color(0xFF1777ff);
      if (button.color != null) {
        result = button.color;
      }
    }
    if (button.variant == ButtonVariant.solid) {
      if (button.color != null) {
        result = button.color;
      }
    }
    if (button.variant == ButtonVariant.filled) {
      result = button.color!.withOpacity(0.1);
    }

    return result;
  }

  Color? get buttonBorderColor {
    Color? result;
    if (button.variant == ButtonVariant.outlined) {
      result = Color(0xFFd9d9d9);
      if (button.color != null) {
        return button.color;
      }
    }
    if (button.type == null) {
      result = Color(0xFFd9d9d9);
      if (button.color != null) {
        return button.color;
      }
    }
    return result;
  }

  Color? get buttonTextColor {
    if (button.type == ButtonType.primary) {
      return Colors.white;
    }
    if (button.variant == ButtonVariant.solid) {
      return Colors.white;
    }
    if (button.color != null) {
      return button.color;
    }
    return Colors.black;
  }

  BorderRadius? get buttonBorderRadius {
    if (button.shape == ButtonShape.circle) {
      return BorderRadius.circular(180);
    } else if (button.shape == ButtonShape.round) {
      return BorderRadius.circular(6.0);
    }
    return null;
  }

  BorderSide? get buttonBorderSide {
    if (button.variant != null) {
      if (button.variant == ButtonVariant.outlined) {
        return BorderSide(
            color: buttonBorderColor ?? Color(0xFFd9d9d9), width: 1);
      }
    } else {
      if (button.type == null) {
        return BorderSide(
            color: buttonBorderColor ?? Color(0xFFd9d9d9), width: 1);
      }
    }
    // return BorderSide.none;
  }

  @override
  WidgetStateProperty<TextStyle>? get textStyle =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return TextStyle(color: buttonTextColor ?? Colors.black);
      });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        Color finalColor = buttonBackgroundColor ?? Colors.white;
        if (button.variant == ButtonVariant.filled) {
          return finalColor.withOpacity(0.08);
        }
        if (states.contains(WidgetState.hovered)) {
          return finalColor.withOpacity(0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return finalColor.withOpacity(0.1);
        }
        return finalColor;
      });

  @override
  WidgetStateProperty<EdgeInsets?>? get padding =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (button.size == ButtonSize.large) {
          if(button.icon != null && button.text==null){
            return EdgeInsets.symmetric(horizontal: 16, vertical: 16);
          }
          return EdgeInsets.symmetric(horizontal: 20, vertical: 20);
        }else if (button.size == ButtonSize.small) {
          return EdgeInsets.symmetric(horizontal: 2, vertical: 2);
        }
      });

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return RoundedRectangleBorder(
            borderRadius: buttonBorderRadius ?? BorderRadius.circular(6.0),
            side: buttonBorderSide ?? BorderSide.none);
      });
}

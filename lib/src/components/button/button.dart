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
    final isIconButton = widget.icon != null && widget.text == null;
    final AntdThemeData theme = AntdTheme.of(context);

    AntdButtonStyle style = styleFrom();

    style = style.merge(_AntdButtonStyle(context: context, button: widget));
    style = style.merge(widget.style);

    double? width;
    double? height;
    switch (widget.size) {
      case ButtonSize.large:
        width = isIconButton ? 40 : null;
        height = isIconButton ? 40 : 40;
        break;
      case ButtonSize.middle:
        width = isIconButton ? 32 : null;
        height = isIconButton ? 32 : 32;
        break;
      case ButtonSize.small:
        width = isIconButton ? 24 : null;
        height = isIconButton ? 24 : 24;
        break;
    }

    // if (isIconButton) {
    //   return SizedBox(
    //     height: height,
    //     width: width,
    //     child: IconButton(
    //         onPressed: widget.onPressed,
    //         icon: widget.icon!,
    //         iconSize: 18,
    //         style: style.toButtonStyle()),
    //   );
    // }
    //
    // return SizedBox(
    //   height: height,
    //   width: width,
    //   child: TextButton.icon(
    //     onPressed: widget.onPressed,
    //     icon: widget.icon,
    //     label: Text(
    //       widget.text != null ? widget.text! : '',
    //       style: style.textStyle?.resolve(const <WidgetState>{}),
    //     ),
    //     style: style.toButtonStyle(),
    //   ),
    // );

    return MaterialButton(
      onPressed: widget.onPressed,
      shape: style.shape?.resolve(const <WidgetState>{}),
      minWidth: 0,
      height: 0,
      padding: style.padding?.resolve(const <WidgetState>{}),
      color: style.backgroundColor?.resolve(const <WidgetState>{}),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconButton)
              Icon(
                Icons.add,
                color: style.iconColor?.resolve(const <WidgetState>{}),
              )
            else
              Icon(Icons.add,
                  color: style.iconColor?.resolve(const <WidgetState>{})),
            Text(
              widget.text != null ? widget.text! : '',
              style: style.textStyle?.resolve(const <WidgetState>{}),
            ),
          ]),
    );
  }
}

class _AntdButtonStyle extends AntdButtonStyle {
  const _AntdButtonStyle({required this.context, required this.button});

  final BuildContext context;
  final Button button;

  bool get isIconButton => button.icon != null && button.text == null;

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
    return null;
    // return BorderSide.none;
  }

  @override
  WidgetStateProperty<TextStyle>? get textStyle =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return TextStyle(color: buttonTextColor ?? Colors.black);
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if ([ButtonType.primary].contains(button.type) ||
            [ButtonVariant.solid].contains(button.variant)) {
          return Colors.white;
        }
      });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        Color finalColor = buttonBackgroundColor ?? Colors.white;
        if (states.contains(WidgetState.hovered)) {
          if ([ButtonVariant.filled, ButtonVariant.outlined, ButtonVariant.text]
                  .contains(button.variant) ||
              [ButtonType.text].contains(button.type)) {
            return finalColor.withOpacity(0.08);
          }
          return finalColor;
        }
        if (states.contains(WidgetState.pressed)) {
          if ([ButtonVariant.filled, ButtonVariant.outlined, ButtonVariant.text]
              .contains(button.variant)) {
            return finalColor.withOpacity(0.1);
          }
          return finalColor;
        }
        if (button.variant == ButtonVariant.filled) {
          return finalColor.withOpacity(0.08);
        }
        return finalColor;
      });

  @override
  WidgetStateProperty<EdgeInsets?>? get padding =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (isIconButton) {
          if (button.size == ButtonSize.small) {
            return EdgeInsets.symmetric(horizontal: 0, vertical: 0);
          } else if (button.size == ButtonSize.large) {
            return EdgeInsets.symmetric(horizontal: 16, vertical: 16);
          }
          return EdgeInsets.symmetric(horizontal: 12, vertical: 12);
        } else {
          if (button.size == ButtonSize.small) {
            return EdgeInsets.symmetric(horizontal: 12, vertical: 0);
          } else if (button.size == ButtonSize.large) {
            return EdgeInsets.symmetric(horizontal: 20, vertical: 16);
          }
          return EdgeInsets.symmetric(horizontal: 16, vertical: 12);
        }
      });

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (button.shape == ButtonShape.circle) {
          return RoundedRectangleBorder(
              borderRadius: buttonBorderRadius ?? BorderRadius.circular(90.0),
              side: buttonBorderSide ?? BorderSide.none);
        }
        return RoundedRectangleBorder(
            borderRadius: buttonBorderRadius ?? BorderRadius.circular(6.0),
            side: buttonBorderSide ?? BorderSide.none);
      });
}

library;

import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
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

class AntButton extends StatefulWidget {
  const AntButton(
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
  State<AntButton> createState() => _ButtonState();
}

class _ButtonState extends State<AntButton> with material.MaterialStateMixin {
  static AntdButtonStyle styleFrom() {
    return AntdButtonStyle();
  }

  double? get height{
    switch(widget.size){
      case ButtonSize.large:
        return 48;
      case ButtonSize.middle:
        return 32;
      case ButtonSize.small:
        return 24;
    }
  }

  double? get width{
    if((widget.shape != ButtonShape.circle && widget.block == true)){
      return double.infinity;
    }
    if( widget.text==null ){
      switch(widget.size){
        case ButtonSize.large:
          return 48;
        case ButtonSize.middle:
          return 32;
        case ButtonSize.small:
          return 24;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final AntThemeData theme = AntTheme.of(context);

    AntdButtonStyle style = styleFrom();

    style = style.merge(_AntdButtonStyle(context: context, button: widget));
    style = style.merge(widget.style);


    return SizedBox(
      width: width,
      height: height,
      child: material.MaterialButton(
        onPressed: widget.onPressed,
        shape: style.shape?.resolve(const <WidgetState>{}),
        minWidth: 0,
        height: 0,
        padding: style.padding?.resolve(const <WidgetState>{}),
        //   padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        color: style.backgroundColor?.resolve(const <WidgetState>{}),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) widget.icon!,
              if (widget.text != null)
                Text(
                  widget.text != null ? widget.text! : '',
                  style: style.textStyle?.resolve(const <WidgetState>{}),
                )
            ])
      ),
    );
  }
}

class _AntdButtonStyle extends AntdButtonStyle {
  const _AntdButtonStyle({required this.context, required this.button});

  final BuildContext context;
  final AntButton button;

  bool get isIconButton => button.icon != null && button.text == null;

  Color? get buttonBackgroundColor {
    Color? result = material.Colors.white;
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
      result = button.color!.withValues();
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
      return material.Colors.white;
    }
    if (button.variant == ButtonVariant.solid) {
      return material.Colors.white;
    }
    if (button.color != null) {
      return button.color;
    }
    return material.Colors.black;
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
        return TextStyle(color: buttonTextColor ?? material.Colors.black);
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if ([ButtonType.primary].contains(button.type) ||
            [ButtonVariant.solid].contains(button.variant)) {
          return material.Colors.white;
        }
        return null;
      });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        Color finalColor = buttonBackgroundColor ?? material.Colors.white;
        if (states.contains(WidgetState.hovered)) {
          if ([ButtonVariant.filled, ButtonVariant.outlined, ButtonVariant.text]
                  .contains(button.variant) ||
              [ButtonType.text].contains(button.type)) {
            return material.Colors.white;
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
          // return finalColor.withOpacity(0.08);
          return finalColor.withAlpha((255.0 * 0.08).round());
          // return Color(0xffbae0ff);
        }
        return finalColor;
      });

  @override
  WidgetStateProperty<EdgeInsets?>? get padding =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (isIconButton) {
          return EdgeInsets.symmetric(horizontal: 0, vertical: 0);
        } else {
          if (button.size == ButtonSize.small) {
            return EdgeInsets.symmetric(horizontal: 12);
          }else if (button.size == ButtonSize.middle){
            return EdgeInsets.symmetric(horizontal: 18);
          }
          else if (button.size == ButtonSize.large) {
            return EdgeInsets.symmetric(horizontal: 24);
          }
        }
        return null;
      });

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (button.shape == ButtonShape.circle && button.text == null) {
          return CircleBorder(
              side: buttonBorderSide ?? BorderSide.none);
        }
        return RoundedRectangleBorder(
            borderRadius: buttonBorderRadius ?? BorderRadius.circular(6.0),
            side: buttonBorderSide ?? BorderSide.none);
      });
}

library;

import 'package:flutter/material.dart';
import '../../../trionesdev_antd_mobile.dart';
import '../types.dart';

enum AntButtonType { primary, text, link }


enum AntButtonVariant {
  outlined,
  solid,
  filled,
  text,
  link,
}

enum AntButtonColor { primary, danger }

enum AntButtonShape { circle, round }

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
      this.shape = AntButtonShape.round,
      this.size = AntSize.middle,
      this.style,
        this.child
      });

  final AntButtonType? type;
  final bool? block;
  final Color? color;
  final bool? danger;
  final bool? disabled;
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final AntButtonVariant? variant;
  final AntButtonShape shape;
  final AntSize size;
  final StateStyle? style;
  final Widget? child;

  @override
  State<AntButton> createState() => _ButtonState();
}

class _ButtonState extends State<AntButton> with MaterialStateMixin {
  double? get height {
    switch (widget.size) {
      case AntSize.large:
        return 48;
      case AntSize.middle:
        return 32;
      case AntSize.small:
        return 24;
    }
  }

  double? get width {
    if ((widget.shape != AntButtonShape.circle && widget.block == true)) {
      return double.infinity;
    }
    if (widget.text == null && widget.child == null) {
      switch (widget.size) {
        case AntSize.large:
          return 48;
        case AntSize.middle:
          return 32;
        case AntSize.small:
          return 24;
      }
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    final AntThemeData theme = AntTheme.of(context);

    StateStyle stateStyle = _AntButtonStyle(widget,context);
    stateStyle = stateStyle.merge(widget.style);
    Style? style = stateStyle.resolve(materialStates);

    BorderSide? buttonBorderSide() {
      if (widget.variant != null) {
        if (widget.variant == AntButtonVariant.outlined) {
          return BorderSide(
              color: style?.borderColor ?? theme.colorBorder,
              width: style?.borderWidth ?? 1);
        }
      } else {
        if (widget.type == null) {
          return BorderSide(
              color: style?.borderColor ?? theme.colorBorder,
              width: style?.borderWidth ?? 1);
        }
      }
      return null;
      // return BorderSide.none;
    }

    ShapeBorder? shapeBorder() {
      if (widget.shape == AntButtonShape.circle && widget.text == null) {
        return CircleBorder(side: buttonBorderSide() ?? BorderSide.none);
      }
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              stateStyle.resolve(materialStates)?.borderRadius ?? 6.0),
          side: buttonBorderSide() ?? BorderSide.none);
    }

    Widget child(){
      if(widget.child!=null){
        return widget.child!;
      }
      if (widget.text != null){
        return Text(
          widget.text ?? '',
          style: TextStyle(
              color: style?.color, fontSize: style?.fontSize),
        );
      }
      return Container();
    }

    return Container(
      width: width,
      height: height,
      child: MaterialButton(
          onPressed: () {
            widget.onPressed?.call();
          },
          shape: shapeBorder(),
          minWidth: 0,
          height: height,
          padding: stateStyle.resolve(materialStates)?.computedPadding,
          color: stateStyle.resolve(materialStates)?.backgroundColor,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) widget.icon!,
                child()
              ])),
    );
  }
}

class _AntButtonStyle extends StateStyle {
  const _AntButtonStyle(this.button, this.context);
  final BuildContext context;
  final AntButton button;

  bool get isIconButton => button.icon != null && button.text == null;

  Color? get iconColor {
    if ([AntButtonType.primary].contains(button.type) ||
        [AntButtonVariant.solid].contains(button.variant)) {
      return Colors.white;
    }
    return null;
  }

  Color? get buttonTextColor {
    if (button.type == AntButtonType.primary) {
      return Colors.white;
    }
    if (button.variant == AntButtonVariant.solid) {
      return Colors.white;
    }
    if (button.color != null) {
      return button.color;
    }
    return Colors.black;
  }

  StylePadding? get padding {
    if (isIconButton) {
      return StylePadding();
    } else {
      if (button.size == AntSize.small) {
        return StylePadding(left: 12, right: 12);
      } else if (button.size == AntSize.middle) {
        return StylePadding(left: 18, right: 18);
      } else if (button.size == AntSize.large) {
        return StylePadding(left: 24, right: 24);
      }
    }
    return null;
  }

  Color? get buttonBackgroundColor {
    AntThemeData themeData = AntTheme.of(context);
    Color? result = Colors.transparent;
    if (button.type == AntButtonType.primary) {
      result = themeData.colorPrimary;
      if (button.color != null) {
        result = button.color;
      }
    }
    if (button.variant == AntButtonVariant.solid) {
      if (button.color != null) {
        result = button.color;
      }
    }
    if (button.variant == AntButtonVariant.filled) {
      result = button.color!.withValues();
    }
    return result;
  }

  Color? get buttonBorderColor {
    AntThemeData themeData = AntTheme.of(context);
    Color? result;
    if (button.variant == AntButtonVariant.outlined) {
      result = themeData.colorBorder;
      if (button.color != null) {
        return button.color;
      }
    }
    if (button.type == null) {
      result = themeData.colorBorder;
      if (button.color != null) {
        return button.color;
      }
    }
    return result;
  }

  @override
  Style? get style {
    Color? backgroundColor() {
      Color finalColor = buttonBackgroundColor ?? Colors.white;
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
        borderRadius: button.shape == AntButtonShape.circle ? 180 : 6);
  }

  @override
  Style? get hovered {
    Color? backgroundColor() {
      if ([AntButtonVariant.filled, AntButtonVariant.outlined, AntButtonVariant.text]
              .contains(button.variant) ||
          [AntButtonType.text].contains(button.type)) {
        return Colors.white;
      }
      return buttonBackgroundColor;
    }


    return Style(
      backgroundColor: backgroundColor(),
    );
  }

  @override
  Style? get pressed {
    Color? backgroundColor() {
      if ([AntButtonVariant.filled, AntButtonVariant.outlined, AntButtonVariant.text]
          .contains(button.variant)) {
        return Colors.white.withAlpha((255.0 * 0.1).round());
        // return finalColor.withOpacity(0.1);
      }
      return buttonBackgroundColor;
    }

    return Style(
      backgroundColor: backgroundColor(),
    );
  }
}

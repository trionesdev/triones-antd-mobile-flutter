library;

import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';
import 'package:widgets_easier/widgets_easier.dart';
import '../theme/theme.dart';

import 'antd_button_style.dart';

enum ButtonType { primary, text, dashed, link }

enum ButtonVariant {
  outlined,
  dashed,
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
  final AntdButtonStyle? style;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  static AntdButtonStyle styleFrom() {
    return AntdButtonStyle();
  }

  static AntdButtonStyle? typeStyle(
      BuildContext context, ButtonType? type, Color? color) {
    switch (type) {
      case ButtonType.primary:
        return _PrimaryTypeButtonStyle(context: context, color: color);
      case ButtonType.dashed:
        return _DashedTypeButtonStyle(context: context,color: color);
      case ButtonType.text:
        return _TextTypeButtonStyle(context: context,);
      case ButtonType.link:
        return _LinkTypeButtonStyle(context: context);
      default:
        return _DefaultTypeButtonStyle(context: context);
    }
  }

  static AntdButtonStyle? variantStyle(
      BuildContext context, ButtonVariant? variant, Color? color) {
    switch (variant) {
      case ButtonVariant.solid:
        return _SolidVariantButtonStyle(context: context, color: color);
      case ButtonVariant.outlined:
        return _OutlinedVariantButtonStyle(context: context, color: color);
      case ButtonVariant.dashed:
        return _DashedVariantButtonStyle(context: context,color: color);
      case ButtonVariant.filled:
        return _FilledVariantButtonStyle(context: context, color: color);
      case ButtonVariant.text:
        return _TextVariantButtonStyle(context: context, color: color);
      case ButtonVariant.link:
        return _LinkVariantButtonStyle(context: context, color: color);
      default:
        return _DefaultVariantButtonStyle(context: context, color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AntdThemeData theme = AntdTheme.of(context);

    AntdButtonStyle style = styleFrom();

    if (widget.variant == null) {
      style = style.merge(typeStyle(context, widget.type, widget.color));
    }
    if (widget.variant != null) {
      style = style.merge(variantStyle(context, widget.variant, widget.color));
    }
    style = style.merge(widget.style);

    if (widget.icon != null) {
      // return Container();
      return IconButton(
          onPressed: widget.onPressed,
          icon: widget.icon!,
          style: style.toButtonStyle());
    }

    if (widget.type == ButtonType.dashed ||
        widget.variant == ButtonVariant.dashed) {
      return Container(
        decoration: ShapeDecoration(
            shape: DashedBorder(
              dashSize: 5,
                borderRadius: BorderRadius.circular(6.0), width: 0.5)),
        child: TextButton.icon(
          onPressed: widget.onPressed,
          icon: widget.icon,
          label: Text(
            widget.text != null ? widget.text! : '',
            style: style.textStyle?.resolve(const <WidgetState>{}),
          ),
          style: style.toButtonStyle(),
        ),
      );
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

//region type
class _DefaultTypeButtonStyle extends AntdButtonStyle {
  const _DefaultTypeButtonStyle({required this.context});

  final BuildContext context;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: Colors.black));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.all(Colors.white);
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(color: Color(0xFFd9d9d9), width: 0.5)));
  }
}

class _PrimaryTypeButtonStyle extends AntdButtonStyle {
  const _PrimaryTypeButtonStyle({required this.context, this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: Colors.white));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.all(Color(0xFF1777ff));
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), side: BorderSide.none));
  }
}

class _DashedTypeButtonStyle extends AntdButtonStyle {
  const _DashedTypeButtonStyle({required this.context,this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: color??Colors.black));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.all(Colors.white);
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), side: BorderSide.none));
  }
}

class _TextTypeButtonStyle extends AntdButtonStyle {
  const _TextTypeButtonStyle({required this.context});

  final BuildContext context;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: Colors.black));
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), side: BorderSide.none));
  }
}

class _LinkTypeButtonStyle extends AntdButtonStyle {
  const _LinkTypeButtonStyle({required this.context});

  final BuildContext context;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: Color(0xFF1777ff)));
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), side: BorderSide.none));
  }
}

//endregion

//region variant

class _DefaultVariantButtonStyle extends AntdButtonStyle {
  const _DefaultVariantButtonStyle({required this.context, this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), side: BorderSide.none));
  }
}

class _SolidVariantButtonStyle extends AntdButtonStyle {
  const _SolidVariantButtonStyle({required this.context, this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: Colors.white));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.all(color ?? Color(0xFF1777ff));
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), side: BorderSide.none));
  }
}

class _OutlinedVariantButtonStyle extends AntdButtonStyle {
  const _OutlinedVariantButtonStyle({required this.context, this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: color ?? Colors.black));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.all(Colors.white);
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(color: color ?? Color(0xFFd9d9d9), width: 0.5)));
  }
}

class _DashedVariantButtonStyle extends AntdButtonStyle {
  const _DashedVariantButtonStyle({required this.context,this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: color??Colors.black));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.all(Colors.white);
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), side: BorderSide.none));
  }
}

class _FilledVariantButtonStyle extends AntdButtonStyle {
  const _FilledVariantButtonStyle({required this.context, this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: color ?? Colors.black));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        Color finalColor = color ?? Colors.white;
        if (states.contains(WidgetState.hovered)) {
          return finalColor.withOpacity(0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return finalColor.withOpacity(0.1);
        }
        return finalColor.withOpacity(0.1);
      });

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), side: BorderSide.none));
  }
}

class _TextVariantButtonStyle extends AntdButtonStyle {
  const _TextVariantButtonStyle({required this.context, this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: color ?? Colors.black));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        Color finalColor = color ?? Colors.white;
        if (states.contains(WidgetState.hovered)) {
          return finalColor.withOpacity(0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return finalColor.withOpacity(0.1);
        }
        return Colors.white;
      });

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), side: BorderSide.none));
  }
}

class _LinkVariantButtonStyle extends AntdButtonStyle {
  const _LinkVariantButtonStyle({required this.context, this.color});

  final BuildContext context;
  final Color? color;

  @override
  WidgetStateProperty<TextStyle>? get textStyle {
    return WidgetStateProperty.all(TextStyle(color: color ?? Colors.black));
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.all(Colors.white);
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0), side: BorderSide.none));
  }
}
//endregion

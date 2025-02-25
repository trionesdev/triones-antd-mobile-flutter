import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

enum AntTagType { success, processing, error, warning }

Color defaultColor = Color(0xffD9D9D9);

class AntTag extends StatefulWidget {
  const AntTag({
    super.key,
    this.color,
    this.icon,
    this.bordered = true,
    this.closeable,
    this.closeIcon,
    this.style,
    this.child,
    this.decoration,
    this.type,
    this.onClose,
  });

  final Widget? child;
  final Color? color;
  final Widget? icon;
  final bool? bordered;
  final bool? closeable;
  final Icon? closeIcon;
  final AntTagType? type;
  final StateStyle? style;
  final BoxDecoration? decoration;
  final Function? onClose;

  @override
  State<StatefulWidget> createState() => _AntTagState();
}

class _AntTagState extends State<AntTag> with MaterialStateMixin {
  @override
  Widget build(BuildContext context) {
    StateStyle style = _AntTagStyle(tag: widget);
    style = style.merge(widget.style);

    Widget? child = widget.child;
    if (child != null && child is Text) {
      child = Text(
        child.data!,
        style: TextStyle(
          color: style.resolve(materialStates)?.color,
          fontSize: style.resolve(materialStates)?.fontSize,
        ).merge(child.style),
      );
    }

    return Container(
      decoration:
          widget.decoration ?? style.resolve(materialStates)?.decoration,
      padding: style.resolve(materialStates)?.computedPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 2,
        children: [
          if (widget.icon != null) widget.icon!,
          if (widget.child != null) child!,
          if (widget.closeable == true)
            GestureDetector(
              onTap: () {
                widget.onClose?.call();
              },
              child: widget.closeIcon != null
                  ? Icon(
                      widget.closeIcon!.icon,
                      size: widget.closeIcon!.size ?? 12,
                      color: widget.closeIcon!.color ?? defaultColor,
                    )
                  : Icon(
                      Icons.close,
                      size: 12,
                      color: defaultColor,
                    ),
            )
        ],
      ),
    );
  }
}

class _AntTagStyle extends StateStyle {
  const _AntTagStyle({required this.tag});

  final AntTag tag;

  Color? computedColor() {
    if (tag.color != null) {
      return tag.color;
    }
    if (tag.type != null) {
      switch (tag.type) {
        case AntTagType.success:
          return Colors.green;
        case AntTagType.processing:
          return Colors.blue;
        case AntTagType.error:
          return Colors.red;
        case AntTagType.warning:
          return Colors.yellow;
        default:
          return null;
      }
    }
    return null;
  }

  Color? textColor() {
    if (tag.type == null && tag.color != null) {
      return Colors.white;
    }
    Color? color = computedColor();
    if (color != null) {
      return color;
    }
    return null;
  }

  Color? backgroundColor() {
    Color? color = computedColor();
    if (tag.type != null) {
      return color?.withOpacity(0.25);
    }
    if (color != null) {
      return color;
    }
    return defaultColor.withOpacity(0.25);
  }

  StyleBorder? computedBorder() {
    if (tag.bordered != true) {
      return null;
    }
    Color? color = computedColor();
    if (tag.color != null) {
      return StyleBorder(color: tag.color, width: 1, style: BorderStyle.solid);
    }
    if (tag.type != null) {
      return StyleBorder(color: color, width: 1, style: BorderStyle.solid);
    }
    return StyleBorder(color: defaultColor, width: 1, style: BorderStyle.solid);
  }

  @override
  Style get style {
    return Style(
      color: textColor(),
      backgroundColor: backgroundColor(),
      padding: StylePadding(top: 1, bottom: 1, left: 8, right: 8),
      borderRadius: 6,
      border: computedBorder(),
    );
  }
}

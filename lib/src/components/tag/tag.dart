import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../theme/theme.dart';

enum AntTagType { success, processing, error, warning }

class AntTag extends StatefulWidget {
  const AntTag({
    super.key,
    this.color,
    this.backgroundColor,
    this.icon,
    this.bordered = true,
    this.closeable,
    this.closeIcon,
    this.style,
    this.child,
    this.label,
    this.decoration,
    this.type,
    this.onClose,
  });

  final Widget? child;
  final String? label;
  final Color? color;
  final Color? backgroundColor;
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
  Widget child(StateStyle style) {
    if (widget.label != null) {
      return Text(
        widget.label!,
        style: TextStyle(
          color: style.resolve(materialStates)?.color,
          fontSize: style.resolve(materialStates)?.fontSize,
        ),
      );
    }
    if (widget.child != null) {
      if (widget.child is Text) {
        Text textChild = widget.child as Text;
        return WidgetUtils.textMerge(
            Text(textChild.data!,
                style: TextStyle(
                  color: style.resolve(materialStates)?.color,
                  fontSize: style.resolve(materialStates)?.fontSize,
                )),
            textChild);
      }
      return widget.child!;
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    StateStyle style = _AntTagStyle(tag: widget, context: context);
    style = style.merge(widget.style);


    return Container(
      decoration:
          widget.decoration ?? style.resolve(materialStates)?.decoration,
      padding: style.resolve(materialStates)?.computedPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 2,
        children: [
          if (widget.icon != null) widget.icon!,
          child(style),
          if (widget.closeable == true)
            GestureDetector(
              onTap: () {
                widget.onClose?.call();
              },
              child: widget.closeIcon != null
                  ? Icon(
                      widget.closeIcon!.icon,
                      size: widget.closeIcon!.size ?? 12,
                      color: widget.closeIcon!.color ?? themeData.colorBorder,
                    )
                  : Icon(
                      Icons.close,
                      size: 12,
                      color: themeData.colorBorder,
                    ),
            )
        ],
      ),
    );
  }
}

class _AntTagStyle extends StateStyle {
  const _AntTagStyle({required this.context, required this.tag});

  final BuildContext context;
  final AntTag tag;

  Color? computedColor() {
    AntThemeData themeData = AntTheme.of(context);
    if (tag.color != null) {
      return tag.color;
    }
    if (tag.type != null) {
      switch (tag.type) {
        case AntTagType.success:
          return themeData.colorSuccess;
        case AntTagType.processing:
          return themeData.colorPrimary;
        case AntTagType.error:
          return themeData.colorError;
        case AntTagType.warning:
          return themeData.colorWarning;
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
    if(tag.backgroundColor!=null){
      return tag.backgroundColor;
    }
    AntThemeData themeData = AntTheme.of(context);
    Color? color = computedColor();
    if (tag.type != null) {
      return color?.withOpacity(0.25);
    }
    if (color != null) {
      return color;
    }
    return themeData.colorBorder.withOpacity(0.25);
  }

  StyleBorder? computedBorder() {
    AntThemeData themeData = AntTheme.of(context);
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
    return StyleBorder(
        color: themeData.colorBorder, width: 1, style: BorderStyle.solid);
  }

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    return Style(
      color: textColor(),
      backgroundColor: backgroundColor(),
      padding: StylePadding(top: 1, bottom: 1, left: 8, right: 8),
      borderRadius: themeData.borderRadius,
      border: computedBorder(),
    );
  }
}

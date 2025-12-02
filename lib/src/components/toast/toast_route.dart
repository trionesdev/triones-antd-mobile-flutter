import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

enum AntToastPosition { top, bottom, center }

class AntToastRoute<T> extends PopupRoute<T> {
  AntToastRoute({
    this.style,
    this.content,
    this.icon,
    this.position = AntToastPosition.center,
  });

  final StateStyle? style;
  final Icon? icon;
  final Widget? content;
  final AntToastPosition? position;

  Widget? contentRender() {
    if (content is Text) {
      Text contentText = content as Text;
      return Text(
        contentText.data!,
        style: TextStyle(color: Colors.white).merge(contentText.style),
      );
    } else {
      return content;
    }
  }

  EdgeInsetsGeometry? padding() {
    if (icon != null) {
      return EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 32);
    }
    return null;
  }

  Alignment alignment() {
    if (position == AntToastPosition.top) {
      return Alignment(0.0, -0.8);
    } else if (position == AntToastPosition.bottom) {
      return Alignment(0.0, 0.8);
    } else {
      return Alignment.center;
    }
  }

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    StateStyle stateStyle = _AntToastStyle(context: context);
    stateStyle = stateStyle.merge(style);
    return Ant(
      color: Colors.transparent,
      child: Align(
        alignment: alignment(),
        child: Container(
          decoration: stateStyle.resolve(<WidgetState>{})?.decoration,
          padding:
              padding() ?? stateStyle.resolve(<WidgetState>{})?.computedPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(
                  icon!.icon,
                  color: icon!.color ?? Colors.white,
                  size: icon!.size ?? 36,
                ),
              if (content != null) contentRender()!,
            ],
          ),
        ),
      ),
    );
  }
}

class _AntToastStyle extends StateStyle {
  const _AntToastStyle({required this.context});

  final BuildContext context;

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    return Style(
      borderRadius: themeData.borderRadius,
      backgroundColor: Colors.black54,
      padding: StylePadding.all(16),
    );
  }
}

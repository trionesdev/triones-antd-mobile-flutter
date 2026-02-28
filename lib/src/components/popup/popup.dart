import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../theme/theme.dart';

enum AntPopupPosition { top, bottom, left, right, center }

class AntPopup {
  static Future<T?> show<T>({
    required BuildContext context,

    /// @description 背景颜色
    /// @default Colors.white
    Color? color = Colors.white,

    /// @description 弹出位置
    /// @default AntPopupPosition.bottom
    AntPopupPosition position = AntPopupPosition.bottom,

    /// @description 宽度, 仅在position为AntPopupPosition.left,AntPopupPosition.right时有效
    /// @default null
    double? width,

    /// @description 高度, 仅在position为AntPopupPosition.top,AntPopupPosition.bottom时有效
    /// @default null
    double? height,

    /// @description 是否圆角
    /// @default true
    bool round = true,

    /// @description 弹窗内容
    /// @default null
    Widget? child,
  }) {
    return showAntPopup<T>(
      context: context,
      color: color,
      position: position,
      width: width,
      height: height,
      round: round,
      child: child,
    );
  }
}

Future<T?> showAntPopup<T>({
  required BuildContext context,
  Color? color = Colors.white,
  AntPopupPosition position = AntPopupPosition.bottom,
  double? width,
  double? height,
  bool round = true,
  Widget? child,
}) {
  Alignment computeAlignment() {
    return switch (position) {
      AntPopupPosition.top => Alignment.topCenter,
      AntPopupPosition.bottom => Alignment.bottomCenter,
      AntPopupPosition.left => Alignment.centerLeft,
      AntPopupPosition.right => Alignment.centerRight,
      AntPopupPosition.center => Alignment.center,
    };
  }

  double? computeWidth() {
    return switch (position) {
      AntPopupPosition.top => MediaQuery.of(context).size.width,
      AntPopupPosition.bottom => MediaQuery.of(context).size.width,
      AntPopupPosition.left => width,
      AntPopupPosition.right => width,
      AntPopupPosition.center => null,
    };
  }

  double? computeHeight() {
    return switch (position) {
      AntPopupPosition.top => height,
      AntPopupPosition.bottom => height,
      AntPopupPosition.left => MediaQuery.of(context).size.height,
      AntPopupPosition.right => MediaQuery.of(context).size.height,
      AntPopupPosition.center => null,
    };
  }

  BorderRadius? computeBorderRadius(AntThemeData themeData) {
    if (!round) {
      return null;
    }

    return switch (position) {
      AntPopupPosition.top => BorderRadius.only(
        bottomLeft: Radius.circular(themeData.borderRadius),
        bottomRight: Radius.circular(themeData.borderRadius),
      ),
      AntPopupPosition.bottom => BorderRadius.only(
        topLeft: Radius.circular(themeData.borderRadius),
        topRight: Radius.circular(themeData.borderRadius),
      ),
      AntPopupPosition.left => BorderRadius.only(
        bottomRight: Radius.circular(themeData.borderRadius),
        topRight: Radius.circular(themeData.borderRadius),
      ),
      AntPopupPosition.right => BorderRadius.only(
        bottomLeft: Radius.circular(themeData.borderRadius),
        topLeft: Radius.circular(themeData.borderRadius),
      ),
      AntPopupPosition.center => BorderRadius.circular(themeData.borderRadius),
    };
  }

  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, animation1, animation2) {
      AntThemeData themeData = AntTheme.of(context);
      return Align(
        alignment: computeAlignment(),
        child: Ant(
          color: Colors.transparent,
          child: Container(
            width: computeWidth(),
            height: computeHeight(),
            decoration: BoxDecoration(
              color: color ?? Colors.white,
              borderRadius: computeBorderRadius(themeData),
            ),
            clipBehavior: Clip.antiAlias,
            child: child,
          ),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      switch (position) {
        case AntPopupPosition.top:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation1, curve: Curves.easeInOut),
            ),
            child: child,
          );
        case AntPopupPosition.bottom:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation1, curve: Curves.easeInOut),
            ),
            child: child,
          );
        case AntPopupPosition.left:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation1, curve: Curves.easeInOut),
            ),
            child: child,
          );
        case AntPopupPosition.right:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation1, curve: Curves.easeInOut),
            ),
            child: child,
          );
        case AntPopupPosition.center:
          return ScaleTransition(
            scale: CurvedAnimation(
              parent: animation1,
              curve: Curves.easeOutBack,
            ),
            child: FadeTransition(opacity: animation1, child: child),
          );
      }
    },
  );
}

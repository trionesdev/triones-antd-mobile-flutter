import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../theme/theme.dart';

class AntPopup {
  static Future<T?> show<T>({
    required BuildContext context,
    Color? color = Colors.white,
    double? minHeight = 300,
    double? maxHeight,
    bool? isScrollControlled = true,
    Widget? child,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled ?? true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(),
      builder: (context) {
        AntThemeData themeData = AntTheme.of(context);
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(themeData.borderRadius),
              topRight: Radius.circular(themeData.borderRadius),
            ),
          ),
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: minHeight ?? MediaQuery.of(context).size.height * 0.3,
            maxHeight: maxHeight ?? MediaQuery.of(context).size.height,
          ),
          child: child,
        );
      },
    );
  }
}

Future<T?> showAntPopup<T>({
  required BuildContext context,
  Color? color = Colors.white,
  double? minHeight = 300,
  double? maxHeight,
  bool? isScrollControlled = true,
  bool? enableDrag = false,
  Widget? child,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled ?? true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(),
    enableDrag: enableDrag ?? true,
    builder: (context) {
      AntThemeData themeData = AntTheme.of(context);
      return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(themeData.borderRadius),
            topRight: Radius.circular(themeData.borderRadius),
          ),
        ),
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: minHeight ?? MediaQuery.of(context).size.height * 0.3,
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height,
        ),
        child: child,
      );
    },
  );
}

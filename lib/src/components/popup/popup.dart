import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import '../theme/theme.dart';

class AntPopup {
  static void show(
      {required BuildContext context,
      Color? color = Colors.white,
      double? minHeight,
      double? maxHeight,
      Widget? child}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
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
                minHeight:
                    minHeight ?? MediaQuery.of(context).size.height * 0.3,
                maxHeight: maxHeight ?? MediaQuery.of(context).size.height,
              ),
              child: child);
        });
  }
}

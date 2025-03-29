import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/toast/toast_route.dart';

class AntToast {
  static void show({
    required BuildContext context,
    Widget? content,
    Icon? icon,
    AntToastPosition? position,
    int? duration = 2000,
    Function? afterClose,
  }) {
    Navigator.push(
        context,
        AntToastRoute(
          icon: icon,
          content: content,
          position: position,
        ));
    Future.delayed(Duration(milliseconds: duration ?? 2000)).then((_) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      afterClose?.call();
    });
  }
}

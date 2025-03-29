import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/mask/mask_route.dart';

class AntMask {
  static void show({
    required BuildContext context,
    Widget? child,
    Function? onMaskClick,
    bool? clickMaskClose = false,
  }) {
    Navigator.push(context, AntMaskRoute(child: child, onMaskClick: onMaskClick,clickMaskClose: clickMaskClose));
  }
}

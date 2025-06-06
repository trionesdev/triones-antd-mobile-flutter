import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/mask/mask_route.dart';

class AntMask {
  static Future<T?> show<T>({
    required BuildContext context,

    /// 遮罩层内容
    Widget? child,

    /// 点击遮罩层回调
    Function? onMaskClick,

    /// 点击遮罩层是否关闭,默认为false
    bool? clickMaskClose = false,
  }) {
    return Navigator.push(
        context,
        AntMaskRoute<T>(
            child: child,
            onMaskClick: onMaskClick,
            clickMaskClose: clickMaskClose));
  }
}

Future<T?> showAntMask<T>({
  required BuildContext context,
  /// 遮罩层内容
  Widget? child,
  /// 点击遮罩层回调
  Function? onMaskClick,
  /// 点击遮罩层是否关闭,默认为false
  bool? clickMaskClose = false,
}) {
  return Navigator.push(
      context,
      AntMaskRoute<T>(
          child: child,
          onMaskClick: onMaskClick,
          clickMaskClose: clickMaskClose));
}

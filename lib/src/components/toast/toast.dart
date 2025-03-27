import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/toast/toast_route.dart';

class AntToast {
  static void show({
    required BuildContext context,
    Widget? content,
    Icon? icon,
    ToastPosition? position,
    int? duration = 2000,
    Function? afterClose,
  }) {
    // final overlay = Overlay.of(context);
    // final overlayEntry = OverlayEntry(builder: (context) {
    //   // return Material(color: Colors.transparent,child: Align(child: Text("sss"),),);
    //   return AntToastView(
    //     icon: icon,
    //     content: content,
    //     position: position,
    //   );
    // });
    // overlay.insert(overlayEntry);
    // // automatic remove Toast
    // Future.delayed(Duration(milliseconds: duration ?? 2000)).then((_) {
    //   overlayEntry.remove();
    //   afterClose?.call();
    // });

    Navigator.push(context, AntToastRoute(
      icon: icon,
      content: content,
      position: position,
    ));
    Future.delayed(Duration(milliseconds: duration ?? 2000)).then((_) {
      Navigator.of(context).pop();
      afterClose?.call();
    });
  }
}

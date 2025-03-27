import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AntMaskRoute extends PopupRoute {
  AntMaskRoute({
    this.child,
    this.onMaskClick,
    this.clickMaskClose,
  });

  final Widget? child;
  final Function? onMaskClick;
  final bool? clickMaskClose;

  @override
  Color? get barrierColor => Colors.black38;

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Ant(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          onMaskClick?.call();
          print("mask clicked");
          if (clickMaskClose == true) {
            // Navigator.of(context).pop();
          }
        },
        child: Container(
            color: Colors.black54,
            height: double.infinity,
            width: double.infinity,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                child: child,
              ),
            )),
      ),
    );
  }
}

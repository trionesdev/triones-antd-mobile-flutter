import 'package:flutter/cupertino.dart';

enum AntStepsDirection { horizontal, vertical }

enum AntStepStatus { wait, process, finish, error }

class AntStepItemStruct {
  AntStepItemStruct({
    this.icon,
    this.iconSize,
    this.status = AntStepStatus.process,
    this.title,
    this.subTitle,
    this.child,
    this.disabled = false,
  });

  final bool disabled;
  Widget? icon;
  final double? iconSize;
  final AntStepStatus status;
  final Widget? title;
  final Widget? subTitle;
  final Widget? child;
}

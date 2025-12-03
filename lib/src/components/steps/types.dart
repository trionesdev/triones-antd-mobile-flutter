import 'package:flutter/cupertino.dart';

enum AntStepsDirection { horizontal, vertical }

enum AntStepStatus { wait, process, finish, error }

class AntStepItemStruct {
  AntStepItemStruct({this.icon});

  Widget? icon;
}

import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntStepCirclePoint extends StatelessWidget {
  const AntStepCirclePoint({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color ?? theme.colorBorder,
        shape: BoxShape.circle,
      ),
    );
  }
}
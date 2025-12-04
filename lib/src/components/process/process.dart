import 'package:flutter/cupertino.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import 'circle_process.dart';
import 'line_process.dart';
import 'types.dart';

class AntProcess extends StatelessWidget {
  const AntProcess({
    super.key,
    this.format,
    this.type = AntProcessType.line,
    this.percent = 0,
    this.railColor,
    this.showInfo = true,
    this.status,
    this.strokeColor,
    this.size = AntSize.middle,
    this.height,
    this.diameter,
    this.positionAlign = AntPercentPositionAlign.end,
    this.positionType = AntPercentPositionType.outer,
    this.strokeWidth = 6,
  });

  /// @description 格式化进度百分比
  /// @default (percent) => percent + %
  final Format? format;
  /// @description 进度百分比
  /// @default null
  final double percent;

  /// @description 未完成的分段的颜色
  /// @default null
  final Color? railColor;

  /// @description 是否显示进度数值或状态图标
  /// @default true
  final bool showInfo;

  /// @description 进度条的状态
  /// @default null
  final AntProcessStatus? status;

  /// @description 进度条的色彩
  /// @default null
  final Color? strokeColor;
  final AntProcessType type;

  /// @description 进度条的大小
  /// @default null
  final AntSize size;

  /// @description 进度条的高度,只对type="line"有效,将覆盖size效果
  /// @default null
  final double? height;

  /// @description 进度条的直径,只对type="circle"有效,将覆盖size效果
  /// @default null
  final double? diameter;
  /// @description 进度百分比的位置对齐方式，只对type="line"有效
  /// @default end
  final AntPercentPositionAlign positionAlign;
  /// @description 进度百分比的位置类型，只对type="line"有效
  /// @default outer
  final AntPercentPositionType positionType;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AntProcessType.line:
        return LineProcess(
          format: format,
          percent: percent,
          railColor: railColor,
          showInfo: showInfo,
          status: status,
          strokeColor: strokeColor,
          size: size,
          height: height,
          positionAlign: positionAlign,
          positionType: positionType,
        );
      case AntProcessType.circle:
        return CircleProcess(
          format: format,
          percent: percent,
          railColor: railColor,
          showInfo: showInfo,
          status: status,
          strokeColor: strokeColor,
          size: size,
          diameter: diameter,
          strokeWidth: strokeWidth,
        );
    }
    return Container();
  }
}

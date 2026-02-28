import 'package:flutter/cupertino.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
import 'progress_circle.dart';
import 'progress_line.dart';

class AntProgress extends StatelessWidget {
  const AntProgress({
    super.key,
    this.format,
    this.type = AntProgressType.line,
    this.percent = 0,
    this.railColor,
    this.showInfo = true,
    this.status,
    this.strokeColor,
    this.size = AntSize.middle,
    this.height,
    this.diameter,
    this.percentPositionAlign = AntPercentPositionAlign.end,
    this.percentPositionType = AntPercentPositionType.outer,
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
  final AntProgressStatus? status;

  /// @description 进度条的色彩
  /// @default null
  final Color? strokeColor;
  final AntProgressType type;

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
  final AntPercentPositionAlign percentPositionAlign;
  /// @description 进度百分比的位置类型，只对type="line"有效
  /// @default outer
  final AntPercentPositionType percentPositionType;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AntProgressType.line:
        return ProgressLine(
          format: format,
          percent: percent,
          railColor: railColor,
          showInfo: showInfo,
          status: status,
          strokeColor: strokeColor,
          size: size,
          height: height,
          percentPositionAlign: percentPositionAlign,
          percentPositionType: percentPositionType,
        );
      case AntProgressType.circle:
        return ProgressCircle(
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

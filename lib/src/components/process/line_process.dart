import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

class LineProcessPainter extends CustomPainter {
  LineProcessPainter({
    this.format,
    this.percent = 0,
    this.railColor,
    this.showInfo = true,
    required this.strokeColor,
    this.strokeLineCap = AntStrokeLineCap.round,
    this.height,
    this.positionAlign = AntPercentPositionAlign.end,
    this.positionType = AntPercentPositionType.outer,
  });

  final Format? format;

  /// @description 进度百分比
  /// @default null
  final double percent;

  /// @description 未完成的分段的颜色
  /// @default null
  final Color? railColor;

  /// @description 是否显示进度数值或状态图标
  /// @default null
  final bool showInfo;

  /// @description 进度条的色彩
  /// @default null
  final Color strokeColor;
  final AntStrokeLineCap strokeLineCap;
  final double? height;
  final AntPercentPositionAlign positionAlign;
  final AntPercentPositionType positionType;

  double get finalHeight {
    return 20;
  }

  StrokeCap get finalStrokeLineCap {
    switch (strokeLineCap) {
      case AntStrokeLineCap.butt:
        return StrokeCap.butt;
      case AntStrokeLineCap.round:
        return StrokeCap.round;
      case AntStrokeLineCap.square:
        return StrokeCap.square;
    }
  }

  Color get textColor {
    final double luminance = strokeColor.computeLuminance();
    if (luminance < 0.4) {
      // 亮度低于阈值，背景偏暗，使用白色文本
      return Colors.white;
    } else {
      // 亮度高于或等于阈值，背景偏亮，使用黑色文本
      return Colors.black;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint =
        Paint()
          ..color = railColor ?? Colors.grey.shade200
          ..style = PaintingStyle.fill;

    final backgroundRect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRRect(
      RRect.fromRectAndRadius(backgroundRect, Radius.circular(size.height / 2)),
      backgroundPaint,
    );
    final progressWidth = size.width * (percent / 100).clamp(0.0, 1.0);
    if (percent > 0) {
      final progressPaint =
          Paint()
            ..color = strokeColor
            ..style = PaintingStyle.fill
            ..strokeCap = finalStrokeLineCap;

      final progressRect = Rect.fromLTWH(0, 0, progressWidth, size.height);
      canvas.drawRRect(
        RRect.fromRectAndRadius(progressRect, Radius.circular(size.height / 2)),
        progressPaint,
      );
    }
    if (showInfo && positionType == AntPercentPositionType.inner) {
      final textPainter = TextPainter(
        text: TextSpan(
          text:
              (format != null)
                  ? format!(percent)
                  : "${percent.toStringAsFixed(0)}%",
          style: TextStyle(color: textColor),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        // Constrain the text to the width of the progress bar area
        maxWidth: size.width,
      );
      var xCenter = (progressWidth - textPainter.width) / 2;
      if (positionAlign == AntPercentPositionAlign.start) {
        xCenter = 4;
      }
      if (positionAlign == AntPercentPositionAlign.end) {
        xCenter = progressWidth - textPainter.width - 4;
      }
      if (xCenter < 0) {
        xCenter = 4;
      }
      final yCenter = (size.height - textPainter.height) / 2;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant LineProcessPainter oldDelegate) {
    return oldDelegate.percent != percent;
  }
}

class LineProcess extends StatelessWidget {
  const LineProcess({
    super.key,
    this.format,
    this.percent = 0,
    this.railColor,
    this.showInfo = true,
    this.status,
    this.size = AntSize.middle,
    this.strokeColor,
    this.strokeLineCap = AntStrokeLineCap.round,
    this.height,
    this.positionAlign = AntPercentPositionAlign.end,
    this.positionType = AntPercentPositionType.outer,
  });

  final Format? format;

  /// @description 进度百分比
  /// @default null
  final double percent;

  /// @description 未完成的分段的颜色
  /// @default null
  final Color? railColor;
  final bool showInfo;
  final AntProcessStatus? status;

  /// @description 进度条的大小
  /// @default null
  final AntSize size;

  /// @description 进度条的色彩
  /// @default null
  final Color? strokeColor;
  final AntStrokeLineCap strokeLineCap;
  final double? height;
  final AntPercentPositionAlign positionAlign;
  final AntPercentPositionType positionType;

  double get computedHeight {
    if (height != null) {
      return height!;
    }
    switch (size) {
      case AntSize.small:
        return 6;
      case AntSize.middle:
        return 8;
      case AntSize.large:
        return 12;
    }
  }

  double get computedIconSize {
    double height = computedHeight;
    if (height <= 8) {
      return 12;
    } else if (height < 12) {
      return 14;
    } else {
      return 16;
    }
  }

  Color? completedRailColor(BuildContext context) {
    if (railColor != null) {
      return railColor!;
    }
    AntThemeData theme = AntTheme.of(context);
    return theme.colorBorderSecondary;
  }

  Color completedStrokeColor(BuildContext context) {
    if (strokeColor != null) {
      return strokeColor!;
    } else {
      AntThemeData theme = AntTheme.of(context);
      if (percent == 100) {
        return theme.colorSuccess;
      } else if (status == AntProcessStatus.exception) {
        return theme.colorError;
      }
      return theme.colorPrimary;
    }
  }

  Widget process(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: computedHeight,
          child: CustomPaint(
            painter: LineProcessPainter(
              format: format,
              percent: percent,
              railColor: completedRailColor(context),
              showInfo: showInfo,
              strokeColor: completedStrokeColor(context),
              positionAlign: positionAlign,
              positionType: positionType,
            ),
          ),
        );
      },
    );
  }

  Widget statusIcon(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    Color color = theme.colorTextBase;

    if (percent >= 100) {
      color = theme.colorSuccess;
    }
    switch (status) {
      case AntProcessStatus.success:
        color = theme.colorSuccess;
        break;
      case AntProcessStatus.exception:
        color = theme.colorError;
        break;
      default:
    }

    if (format != null) {
      return Text(
        format!(percent),
        style: TextStyle(fontSize: computedIconSize, color: color),
      );
    }
    if (percent >= 100) {
      return Icon(
        AntIcons.checkCircleFill,
        size: computedIconSize,
        color: color,
      );
    }
    switch (status) {
      case AntProcessStatus.success:
        return Icon(
          AntIcons.checkCircleFill,
          size: computedIconSize,
          color: color,
        );
      case AntProcessStatus.exception:
        return Icon(
          AntIcons.closeCircleFill,
          size: computedIconSize,
          color: color,
        );
      default:
        return Text(
          "${percent.toStringAsFixed(0)}%",
          style: TextStyle(fontSize: computedIconSize),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showInfo) {
      if (positionType == AntPercentPositionType.outer) {
        if (positionAlign == AntPercentPositionAlign.center) {
          return Column(
            spacing: 4,
            children: [process(context), statusIcon(context)],
          );
        } else {
          return Row(
            spacing: 8,
            children: [
              if (positionAlign == AntPercentPositionAlign.start)
                statusIcon(context),
              Expanded(child: process(context)),
              if (positionAlign == AntPercentPositionAlign.end)
                statusIcon(context),
            ],
          );
        }
      }
    }
    return process(context);
  }
}

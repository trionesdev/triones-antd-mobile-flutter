import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';
import 'types.dart';

class CircleProcessPainter extends CustomPainter {
  CircleProcessPainter({
    this.format,
    this.percent = 0,
    this.railColor,
    this.showInfo = true,
    this.status,
    this.strokeColor,
    this.strokeLineCap = AntStrokeLineCap.round,
    this.strokeWidth = 6,
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

  /// @description 进度条的色彩
  /// @default null
  final Color? strokeColor;
  final AntStrokeLineCap strokeLineCap;
  final double strokeWidth;

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

  double computedIconSize(Size size) {
    double iconSize = (size.width / 2 - strokeWidth / 2) / 3;
    if (iconSize < 36) {
      return 10;
    }

    if (iconSize >= 48) {
      return 24;
    }
    return iconSize;
  }

  TextSpan textSpan(Size size) {
    Color? innerStrokeColor = Colors.black;
    if (percent >= 100) {
      innerStrokeColor = strokeColor;
    }
    if (status == AntProcessStatus.exception) {
      innerStrokeColor = strokeColor;
    }
    if (format != null) {
      return TextSpan(
        text: format!(percent),
        style: TextStyle(
          fontSize: computedIconSize(size),
          color: innerStrokeColor,
        ),
      );
    }
    if (status == AntProcessStatus.exception) {
      IconData iconData = AntIcons.closeOutline;
      return TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
          color: innerStrokeColor,
          fontSize: computedIconSize(size),
          fontFamily: iconData.fontFamily,
          package: iconData.fontPackage,
        ),
      );
    }
    if (percent >= 100) {
      IconData iconData = AntIcons.checkOutline;
      return TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
          color: innerStrokeColor,
          fontSize: computedIconSize(size),
          fontFamily: iconData.fontFamily,
          package: iconData.fontPackage,
        ),
      );
    }
    return TextSpan(
      text: "${percent.toStringAsFixed(0)}%",
      style: TextStyle(
        fontSize: computedIconSize(size),
        color: innerStrokeColor,
      ),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - strokeWidth / 2;
    final backgroundPaint =
    Paint()
      ..color = railColor ?? Colors.grey
      ..style =
          PaintingStyle
              .stroke // 描边
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint =
    Paint()
      ..color = strokeColor ?? Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = finalStrokeLineCap;

    // 计算进度的弧度
    // 完整的圆是 2 * math.pi
    final sweepAngle = 2 * math.pi * (percent / 100).clamp(0.0, 1.0);

    // 定义圆弧的边界矩形
    final rect = Rect.fromCircle(center: center, radius: radius);

    // 使用 drawArc 绘制圆弧进度
    // 参数: 边界矩形, 起始角度, 扫描角度, 是否连接中心点, 画笔
    canvas.drawArc(
      rect,
      (3 * math.pi) / 2, // 从顶部开始
      sweepAngle,
      false, // 不连接中心点
      progressPaint,
    );

    if (showInfo && size.width > 20) {
      final textPainter = TextPainter(
        text: textSpan(size),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width);
      final xCenter = (size.width - textPainter.width) / 2;
      final yCenter = (size.height - textPainter.height) / 2;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CircleProcessPainter oldDelegate) {
    return oldDelegate.percent != percent || oldDelegate.status != status ||
        oldDelegate.strokeColor != strokeColor ||
        oldDelegate.railColor != railColor
        || oldDelegate.strokeLineCap != strokeLineCap;
  }
}

class CircleProcess extends StatelessWidget {
  const CircleProcess({
    super.key,
    this.format,
    this.percent = 0,
    this.railColor,
    this.showInfo = true,
    this.status,
    this.strokeColor,
    this.size = AntSize.middle,
    this.diameter,
    this.strokeLineCap = AntStrokeLineCap.round,
    this.strokeWidth = 6,
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

  /// @description 进度条的直径
  /// @default null
  final double? diameter;

  /// @description 进度条的色彩
  /// @default null
  final Color? strokeColor;
  final AntStrokeLineCap strokeLineCap;

  /// @description 进度条的宽度
  /// @default 6
  final double strokeWidth;

  double get computedWidth {
    if (diameter != null) {
      return diameter!;
    }
    switch (size) {
      case AntSize.small:
        return 60;
      case AntSize.middle:
        return 120;
      case AntSize.large:
        return 160;
    }
  }

  double get computedHeight {
    if (diameter != null) {
      return diameter!;
    }
    switch (size) {
      case AntSize.small:
        return 60;
      case AntSize.middle:
        return 120;
      case AntSize.large:
        return 160;
    }
  }

  Color? completedRailColor(BuildContext context) {
    if (railColor != null) {
      return railColor!;
    }
    AntThemeData theme = AntTheme.of(context);
    return theme.colorBorderSecondary;
  }

  Color? completedStrokeColor(BuildContext context) {
    if (strokeColor != null) {
      return strokeColor!;
    } else {
      AntThemeData theme = AntTheme.of(context);
      if (percent >= 100) {
        return theme.colorSuccess;
      } else if (status == AntProcessStatus.exception) {
        return theme.colorError;
      }
      return theme.colorPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: computedWidth,
      height: computedHeight,
      child: CustomPaint(
        painter: CircleProcessPainter(
          format: format,
          percent: percent,
          railColor: completedRailColor(context),
          strokeColor: completedStrokeColor(context),
          showInfo: showInfo,
          status: status,
          strokeLineCap: strokeLineCap,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

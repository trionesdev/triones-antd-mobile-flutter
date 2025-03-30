import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/theme/theme.dart';

class AntTimelineItemType {
  AntTimelineItemType({this.icon, this.content, this.latest, this.lineType});

  final Widget? icon;
  final Widget? content;
  final bool? latest;
  final AntTimelineItemLineType? lineType;
}

enum AntTimelineItemLineType {
  solid,
  dashed,
  none,
}

class AntTimeline extends StatefulWidget {
  const AntTimeline({super.key, this.items, this.lineColumnWidth = 40});

  final List<AntTimelineItemType>? items;
  final double lineColumnWidth;

  @override
  State<StatefulWidget> createState() => _AntTimelineState();
}

class _AntTimelineState extends State<AntTimeline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...(widget.items ?? []).map((item) {
            return AntTimelineItem(
              icon: item.icon,
              content: item.content,
              latest: item.latest,
              lineColumnWidth: widget.lineColumnWidth,
              lineType: item.lineType ?? AntTimelineItemLineType.solid,
            );
          })
        ],
      ),
    );
  }
}

class AntTimelineItem extends StatelessWidget {
  const AntTimelineItem(
      {super.key,
      this.icon,
      this.content,
      this.latest = false,
      this.lineColumnWidth,
      this.lineType = AntTimelineItemLineType.solid});

  final Widget? icon;
  final Widget? content;
  final double? lineColumnWidth;
  final bool? latest;
  final AntTimelineItemLineType? lineType;

  Widget? get lineIcon {
    if (icon != null) {
      return icon!;
    }
    if (lineType == AntTimelineItemLineType.dashed) {
      return CustomPaint(
        size: Size(1, double.infinity),
        painter: AntTimelineDashLinePainter(),
      );
    } else if (lineType == AntTimelineItemLineType.solid) {
      return CustomPaint(
          size: Size(1, double.infinity),
          painter: AntTimelineSolidLinePainter());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: lineColumnWidth,
            height: double.infinity,
            alignment: Alignment.topCenter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: latest! ? null : lineIcon,
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.topCenter,
                      child: AntTimelineCirclePoint(),
                    ))
              ],
            ),
          ),
          Expanded(child: content ?? Container())
        ],
      ),
    );
  }
}

class AntTimelineCirclePoint extends StatelessWidget {
  const AntTimelineCirclePoint({super.key});

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return CustomPaint(
      size: Size(10, 10),
      painter: AntTimelineCirclePainter(color: themeData.colorPrimary),
    );
  }
}

class AntTimelineCirclePainter extends CustomPainter {
  AntTimelineCirclePainter({this.color = Colors.blue});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.strokeWidth = 4;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 5.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class AntTimelineDashLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xffF0F0F0);
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    final path = Path();
    double dx = 0;
    while (dx < size.height) {
      path.moveTo(0, dx);
      path.lineTo(0, dx + 5);
      dx += 10;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class AntTimelineSolidLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xffF0F0F0);
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

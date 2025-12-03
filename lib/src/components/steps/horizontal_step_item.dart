import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';
import 'circle_point.dart';

class HorizontalStepItem extends StatefulWidget {
  const HorizontalStepItem({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.index = 0,
    this.current,
    this.steps,
    this.iconSize,
    this.disabled = false,
    this.icon,
    this.status = AntStepStatus.wait,
    this.subTitle,
    this.title,
    this.child,
  });

  final bool isFirst;
  final bool isLast;
  final int? index;
  final int? current;
  final List<Widget>? steps;
  final double? iconSize;
  final bool disabled;
  final Widget? icon;
  final AntStepStatus status;
  final Widget? subTitle;
  final Widget? title;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _HorizontalStepItemState();
}

class _HorizontalStepItemState extends State<HorizontalStepItem> {
  Color beforeLineColor(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    if (widget.current != null && widget.current! >= widget.index!) {
      return theme.colorPrimary;
    }
    return theme.colorBorder;
  }

  Color afterLineColor(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    if (widget.current != null && widget.current! > widget.index!) {
      return theme.colorPrimary;
    }
    return theme.colorBorder;
  }

  Color pointColor(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    if (widget.current != null && widget.current! >= widget.index!) {
      if (widget.status == AntStepStatus.error) {
        return theme.colorError;
      }
      return theme.colorPrimary;
    }
    return theme.colorBorder;
  }

  Widget horizontalStepIcon(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Visibility(
            visible: !widget.isFirst,
            child: CustomPaint(
              painter: _HorizontalLinePainter(color: beforeLineColor(context)),
            ),
          ),
        ),
        widget.icon != null
            ? SizedBox(
              width: widget.iconSize ?? 16,
              height: widget.iconSize ?? 16,
              child: widget.icon,
            )
            : AntStepCirclePoint(color: pointColor(context)),
        Expanded(
          child: Visibility(
            visible: !widget.isLast,
            child: CustomPaint(
              painter: _HorizontalLinePainter(color: afterLineColor(context)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        horizontalStepIcon(context),
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              if (widget.title != null) widget.title!,
              if (widget.subTitle != null) widget.subTitle!,
            ],
          ),
        ),
      ],
    );
  }
}

class _HorizontalLinePainter extends CustomPainter {
  const _HorizontalLinePainter({this.color});

  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color ?? Colors.black87;
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(0, (size.height - 1) / 2),
      Offset(size.width, (size.height - 1) / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

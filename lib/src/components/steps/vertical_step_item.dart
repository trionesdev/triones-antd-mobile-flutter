import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';
import 'circle_point.dart';

class VerticalStepItem extends StatefulWidget {
  const VerticalStepItem({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.index,
    this.current,
    this.iconSize,
    this.defaultIconSize = 24,
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
  final double? iconSize;
  final double? defaultIconSize;
  final bool disabled;
  final Widget? icon;
  final AntStepStatus status;
  final Widget? subTitle;
  final Widget? title;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _VerticalStepItemState();
}

class _VerticalStepItemState extends State<VerticalStepItem> {
  GlobalKey _myWidgetKey = GlobalKey();
  double _height = 24;

  double get _width {
    double width =
        (widget.icon != null ? widget.iconSize ?? widget.defaultIconSize! : 10);
    if (width < 24) {
      width = 24;
    }
    return width;
  }

  double get _iconSize {
    return widget.icon != null ? widget.iconSize ?? widget.defaultIconSize! : 10;
  }

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
      return theme.colorPrimary;
    }
    return theme.colorBorder;
  }

  Widget verticalStepIcon(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);

    return SizedBox(
      width: _width,
      height: _height,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 8 + (_iconSize >= 24 ? 0 : (20 - _iconSize).abs() / 2),
            child: Visibility(
              visible: !widget.isFirst,
              child: CustomPaint(
                painter: _VerticalLinePainter(color: beforeLineColor(context)),
              ),
            ),
          ),
          widget.icon != null
              ? SizedBox(
                // width: _iconSize,
                // height: _iconSize,
                child: widget.icon,
              )
              : AntStepCirclePoint(color: pointColor(context)),
          Expanded(
            child: Visibility(
              visible: !widget.isLast,
              child: CustomPaint(
                painter: _VerticalLinePainter(color: afterLineColor(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateHeight() {
    final RenderBox? renderBox =
        _myWidgetKey.currentContext?.findRenderObject() as RenderBox?;
    setState(() {
      _height = renderBox?.size.height ?? 0;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateHeight();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      key: _myWidgetKey,
      children: [
        verticalStepIcon(context),
        Expanded(
          flex: 1,
          child: NotificationListener<SizeChangedLayoutNotification>(
            onNotification: (notification) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                updateHeight();
              });
              return true;
            },
            child: SizeChangedLayoutNotifier(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(child: widget.title),
                    Container(child: widget.subTitle),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _VerticalLinePainter extends CustomPainter {
  const _VerticalLinePainter({this.color});

  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color ?? Colors.black87;
    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset((size.width - 1) / 2, 0),
      Offset((size.width - 1) / 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

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
    this.stretch = false,
    this.disabled = false,
    this.icon,
    this.status = AntStepStatus.wait,
    this.subTitle,
    this.title,
    this.child,
    this.minWidth,
  });

  final bool isFirst;
  final bool isLast;
  final int? index;
  final int? current;
  final List<Widget>? steps;
  final double? iconSize;
  final bool stretch;
  final bool disabled;
  final Widget? icon;
  final AntStepStatus status;
  final Widget? subTitle;
  final Widget? title;
  final Widget? child;
  final double? minWidth;

  @override
  State<StatefulWidget> createState() => _HorizontalStepItemState();
}

class _HorizontalStepItemState extends State<HorizontalStepItem> {
  final double _minLineWidth = 16.0;
  final GlobalKey _iconKey = GlobalKey();
  final GlobalKey _textRowKey = GlobalKey();
  double? _iconWidth;
  late double? _iconRowWidth = 42.0;
  late double? _iconLineWidth = _minLineWidth;

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
      // mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          fit: widget.stretch ? FlexFit.tight : FlexFit.loose,
          child: Opacity(
            opacity: widget.isFirst ? 0 : 1,
            child: Container(
              width: widget.stretch ? null : _iconLineWidth,
              constraints: BoxConstraints(minWidth: _minLineWidth),
              child: CustomPaint(
                painter: _HorizontalLinePainter(
                  color: beforeLineColor(context),
                ),
              ),
            ),
          ),
        ),
        NotificationListener<SizeChangedLayoutNotification>(
          onNotification: (notification) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              updateSize();
            });
            return true;
          },
          child: SizeChangedLayoutNotifier(
            child: Container(
              key: _iconKey,
              child:
                  widget.icon != null
                      ? SizedBox(
                        width: widget.iconSize,
                        height: widget.iconSize,
                        child: widget.icon,
                      )
                      : AntStepCirclePoint(color: pointColor(context)),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: widget.stretch ? FlexFit.tight : FlexFit.loose,
          child: Opacity(
            opacity: widget.isLast ? 0 : 1,
            child: Container(
              width: widget.stretch ? null : _iconLineWidth,
              constraints: BoxConstraints(minWidth: _minLineWidth),
              child: CustomPaint(
                painter: _HorizontalLinePainter(color: afterLineColor(context)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool get hasText {
    return widget.title != null || widget.subTitle != null;
  }

  void updateSize() {
    if (widget.stretch) {
      return;
    }
    setState(() {
      final RenderBox? iconRenderBox = _iconKey.currentContext?.findRenderObject() as RenderBox?;
      final RenderBox? textRowRenderBox = _textRowKey.currentContext?.findRenderObject() as RenderBox?;
      if ( iconRenderBox?.size != null && textRowRenderBox?.size != null) {
        if (textRowRenderBox!.size.width > (iconRenderBox!.size.width + _minLineWidth * 2)) {
          _iconRowWidth = textRowRenderBox.size.width;
        } else {
          _iconRowWidth = iconRenderBox.size.width + _minLineWidth * 2;
        }
      } else {
        _iconRowWidth = ((iconRenderBox?.size.width ?? 10) + _minLineWidth * 2);
      }
      _iconWidth = iconRenderBox?.size.width;
      if (_iconRowWidth != null && widget.minWidth != null && _iconRowWidth! < widget.minWidth!) {
        _iconRowWidth = widget.minWidth;
      }

      if (iconRenderBox?.size != null) {
        _iconLineWidth = (_iconRowWidth! - iconRenderBox!.size.width) / 2;
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateSize();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HorizontalStepItem oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateSize();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.stretch?null: _iconRowWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(),
            // clipBehavior: Clip.hardEdge,
            width: widget.stretch?null:_iconRowWidth,
            child: horizontalStepIcon(context),
          ),
          if (hasText)
            NotificationListener<SizeChangedLayoutNotification>(
              onNotification: (notification) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  updateSize();
                });
                return true;
              },
              child: SizeChangedLayoutNotifier(
                child: Container(
                  key: _textRowKey,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      if (widget.title != null) widget.title!,
                      if (widget.subTitle != null) widget.subTitle!,
                      if (widget.child != null) widget.child!,
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
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

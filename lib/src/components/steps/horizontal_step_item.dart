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

  @override
  State<StatefulWidget> createState() => _HorizontalStepItemState();
}

class _HorizontalStepItemState extends State<HorizontalStepItem> {
  final GlobalKey _iconKey = GlobalKey();
  final GlobalKey _textKey = GlobalKey();
    double? _iconWidth  ;

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          // fit: widget.stretch? FlexFit.tight: FlexFit.loose,
          fit:  FlexFit.tight ,
          child: Visibility(
            visible: !widget.isFirst,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 16),
              child: CustomPaint(
                painter: _HorizontalLinePainter(
                  color: beforeLineColor(context),
                ),
              ),
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
        Flexible(
          flex: 1,
          // fit: widget.stretch? FlexFit.tight: FlexFit.loose,
          fit:  FlexFit.tight ,
          child: Visibility(
            visible: !widget.isLast,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 16),
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
    final RenderBox? iconRenderBox =
        _iconKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? textRenderBox =
        _textKey.currentContext?.findRenderObject() as RenderBox?;
    if(textRenderBox!=null){

    }
    if(iconRenderBox != null && textRenderBox != null){
      if(textRenderBox.size.width > iconRenderBox.size.width){
        _iconWidth = textRenderBox.size.width;
      }else{
        _iconWidth = iconRenderBox.size.width;
      }
    }
    print(iconRenderBox?.size);
    print(textRenderBox?.size);
    print(_iconWidth);
  }

  @override
  void initState() {
    // _iconWidth = 90;
    updateSize();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HorizontalStepItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // _iconWidth = 90;
    updateSize();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NotificationListener<SizeChangedLayoutNotification>(
            onNotification: (notification) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  updateSize();
                });
              });
              return true;
            },
            child: SizeChangedLayoutNotifier(
              child: Container(
                key: _iconKey,
                width: _iconWidth  ,
                child: horizontalStepIcon(context),
              ),
            ),
          ),
          // Text("ss"),
          if (hasText)
            NotificationListener<SizeChangedLayoutNotification>(
              onNotification: (notification) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    updateSize();
                  });
                });
                return true;
              },
              child: SizeChangedLayoutNotifier(
                child: Container(
                  key: _textKey,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      if (widget.title != null) widget.title!,
                      if (widget.subTitle != null) widget.subTitle!,
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

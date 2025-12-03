import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/src/components/theme/index.dart';

enum AntStepsDirection { horizontal, vertical }

enum AntStepStatus { wait, process, finish, error }

class AntSteps extends StatefulWidget {
  const AntSteps({
    super.key,
    this.direction = AntStepsDirection.horizontal,
    this.children,
  });

  final AntStepsDirection direction;
  final List<AntStepItem>? children;

  static AntStepsState? maybeOf(BuildContext context) {
    final _AntStepsScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntStepsScope>();
    return scope?._stepsState;
  }

  @override
  State<StatefulWidget> createState() => AntStepsState();
}

class AntStepsState extends State<AntSteps> {
  int _generation = 0;
  List<AntStepItem> _children = [];

  Widget get child {
    switch (widget.direction) {
      case AntStepsDirection.horizontal:
        List<Widget> children = [];
        for (var element in _children) {
          children.add(Expanded(child: element));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children ?? [],
        );
      case AntStepsDirection.vertical:
        List<Widget> children = [];
        for (var element in _children) {
          children.add(element);
        }
        return Column(mainAxisSize: MainAxisSize.min, children: children ?? []);
    }
  }

  @override
  void initState() {
    _children = widget.children ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: _AntStepsScope(
        stepsState: this,
        generation: _generation,
        child: child,
      ),
    );
  }
}

class _AntStepsScope extends InheritedWidget {
  const _AntStepsScope({
    required super.child,
    required AntStepsState stepsState,
    required int generation,
  }) : _stepsState = stepsState,
       _generation = generation;
  final AntStepsState _stepsState;
  final int _generation;

  @override
  bool updateShouldNotify(covariant _AntStepsScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}

class AntStepItem extends StatefulWidget {
  const AntStepItem({
    super.key,
    this.index,
    this.disabled = false,
    this.icon,
    this.status = AntStepStatus.wait,
    this.subTitle,
    this.title,
  });

  final int? index;
  final bool disabled;
  final Widget? icon;
  final AntStepStatus status;
  final Widget? subTitle;
  final Widget? title;

  @override
  State<StatefulWidget> createState() => _StepItemState();
}

class _StepItemState extends State<AntStepItem> {
  _AntStepsScope? _stepsScope;

  bool get _isFirst {
    return _stepsScope?._stepsState.widget.children?.indexOf(widget) == 0;
  }

  bool get _isLast {
    return _stepsScope?._stepsState.widget.children!.indexOf(widget) ==
        (_stepsScope!._stepsState.widget.children!.length - 1);
  }

  @override
  void didChangeDependencies() {
    _stepsScope = context.dependOnInheritedWidgetOfExactType<_AntStepsScope>();
    super.didChangeDependencies();
  }

  AntStepsDirection get direction {
    return _stepsScope?._stepsState.widget.direction ??
        AntStepsDirection.horizontal;
  }

  Widget horizontalStepIcon(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    Widget beforeLine;
    Widget afterLine;
    if (_isFirst) {
      beforeLine = Container();
    } else {
      beforeLine = CustomPaint(
        painter: _HorizontalLinePainter(color: theme.colorPrimary),
      );
    }
    if (_isLast) {
      afterLine = Container();
    } else {
      afterLine = CustomPaint(
        painter: _HorizontalLinePainter(color: theme.colorPrimary),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: beforeLine),
        widget.icon ?? const _CirclePoint(),
        Expanded(child: afterLine),
      ],
    );
  }

  Widget verticalStepIcon(BuildContext context) {
    Widget beforeLine;
    Widget afterLine;
    if (_isFirst) {
      beforeLine = Container();
    } else {
      beforeLine = CustomPaint(painter: _VerticalLinePainter());
    }
    if (_isLast) {
      afterLine = Container();
    } else {
      afterLine = CustomPaint(painter: _VerticalLinePainter());
    }
    return SizedBox(
      width: 24,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 2, child: beforeLine),
          widget.icon ?? const _CirclePoint(),
          Expanded(child: afterLine),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case AntStepsDirection.horizontal:
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
      case AntStepsDirection.vertical:
        return IntrinsicHeight(
          child: Row(
            children: [
              verticalStepIcon(context),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(child: widget.title),
                      if (widget.subTitle != null) widget.subTitle!,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}

class _CirclePoint extends StatelessWidget {
  const _CirclePoint({super.key});

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: theme.colorPrimary,
        shape: BoxShape.circle,
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AntDividerDirection { horizontal, vertical }

enum AntContentPosition { left, right, center }

class AntDivider extends StatefulWidget {
  const AntDivider(
      {super.key,
      this.direction = AntDividerDirection.horizontal,
      this.child,
      this.contentPosition = AntContentPosition.center,
      this.height,
      this.color});

  final AntDividerDirection? direction;
  final AntContentPosition? contentPosition;
  final Widget? child;
  final double? height;
  final Color? color;

  @override
  State<StatefulWidget> createState() => _AntDividerState();
}

class _AntDividerState extends State<AntDivider> {
  int leftFlex() {
    switch (widget.contentPosition) {
      case AntContentPosition.left:
        return 1;
      case AntContentPosition.right:
        return 3;
      case AntContentPosition.center:
        return 2;
      default:
        return 1;
    }
  }

  int rightFlex() {
    switch (widget.contentPosition) {
      case AntContentPosition.left:
        return 3;
      case AntContentPosition.right:
        return 1;
      case AntContentPosition.center:
        return 2;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.direction == AntDividerDirection.horizontal
        ? (widget.child == null)
            ? Divider(color: widget.color)
            : Row(
                children: [
                  Expanded(
                      flex: leftFlex(),
                      child: Divider(endIndent: 16, color: widget.color)),
                  widget.child!,
                  Expanded(
                      flex: rightFlex(),
                      child: Divider(indent: 16, color: widget.color)),
                ],
              )
        : SizedBox(
            height: widget.height ?? 10,
            child: VerticalDivider(
              color: widget.color,
            ),
          );
  }
}

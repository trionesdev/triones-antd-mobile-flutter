import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../trionesdev_antd_mobile.dart';

enum AntDividerDirection { horizontal, vertical }

enum AntContentPosition { left, right, center }

/// @component AntDivider 分割线
class AntDivider extends StatefulWidget {
  const AntDivider({
    super.key,
    this.direction = AntDividerDirection.horizontal,
    this.child,
    this.contentPosition = AntContentPosition.center,
    this.height,
    this.color,
    this.thickness = 1,
  });

  /// @description 分割线方向
  /// @default horizontal
  final AntDividerDirection? direction;

  /// @description 分割线位置
  /// @default center
  final AntContentPosition? contentPosition;

  /// @description 分割线内容
  /// @default null
  final Widget? child;

  /// @description 分割线高度
  /// @default null
  final double? height;

  /// @description 分割线颜色
  /// @default null
  final Color? color;

  /// @description 分割线宽度
  /// @default 1
  final double thickness;

  @override
  State<StatefulWidget> createState() => _AntDividerState();
}

class _AntDividerState extends State<AntDivider> {
  Color get color {
    return widget.color ?? AntTheme.of(context).colorBorder;
  }

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
    return (() {
      if (widget.direction == AntDividerDirection.horizontal) {
        if (widget.child == null) {
          return Divider(color: color, thickness: widget.thickness);
        } else {
          return Row(
            children: [
              Expanded(
                flex: leftFlex(),
                child: Divider(endIndent: 16, color: color),
              ),
              widget.child!,
              Expanded(
                flex: rightFlex(),
                child: Divider(indent: 16, color: color),
              ),
            ],
          );
        }
      } else {
        return SizedBox(
          height: widget.height ?? 10,
          child: VerticalDivider(color: color),
        );
      }
    })();
  }
}

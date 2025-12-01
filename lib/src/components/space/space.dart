import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/state_style.dart';

enum AntSpaceDirection { vertical, horizontal }

/// @component AntSpace 间距
class AntSpace extends StatefulWidget {
  const AntSpace({
    super.key,
    this.style,
    this.decoration,
    this.direction = AntSpaceDirection.horizontal,
    this.children,
    this.spacing = 2,
    this.split,
  });

  /// @description 样式
  /// @default null
  final StateStyle? style;

  /// @description 装饰
  /// @default null
  final BoxDecoration? decoration;

  /// @description 排列方向
  /// @default horizontal
  final AntSpaceDirection? direction;

  /// @description 子项
  /// @default null
  final List<Widget>? children;

  /// @description 间隔
  /// @default 2
  final double? spacing;

  /// @description 分割线
  /// @default null
  final Widget? split;

  @override
  State<StatefulWidget> createState() => _AntSpaceState();
}

class _AntSpaceState extends State<AntSpace> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [];
    for (int i = 0; i < widget.children!.length; i++) {
      children.add(widget.children![i]);
      if (i < widget.children!.length - 1) {
        if (widget.split != null) {
          children.add(widget.split!);
        }
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    _AntSpaceStyle style = _AntSpaceStyle();
    // style.merge(widget.style);

    Widget child =
        widget.children != null
            ? widget.direction == AntSpaceDirection.vertical
                ? Column(
                  spacing: widget.spacing ?? 0,
                  children: _buildChildren(),
                )
                : Wrap(
                  runAlignment: WrapAlignment.center,
                  spacing: widget.spacing ?? 0,
                  runSpacing: widget.spacing ?? 0,
                  children: _buildChildren(),
                )
            : Container();
    return Container(
      decoration:
          widget.decoration ?? style.resolve(const <WidgetState>{})?.decoration,
      child: child,
    );
  }
}

class _AntSpaceStyle extends StateStyle {
  const _AntSpaceStyle();
}

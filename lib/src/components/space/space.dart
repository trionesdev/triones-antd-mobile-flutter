import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/state_style.dart';

enum AntSpaceDirection { vertical, horizontal }

class AntSpace extends StatefulWidget {
  const AntSpace(
      {super.key,
      this.style,
      this.decoration,
      this.direction = AntSpaceDirection.horizontal,
      this.children,
      this.spacing = 2,
      this.split});

  final StateStyle? style;
  final BoxDecoration? decoration;
  final AntSpaceDirection? direction;
  final List<Widget>? children;
  final double? spacing;
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

    Widget child = widget.children != null
        ? widget.direction == AntSpaceDirection.vertical
            ? Column(
                spacing: widget.spacing ?? 0,
                children: _buildChildren(),
              )
            : Wrap(
                spacing: widget.spacing ?? 0,
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

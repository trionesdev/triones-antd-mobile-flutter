import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/state_style.dart';

enum SpaceDirection { vertical, horizontal }

class AntSpace extends StatefulWidget {
  const AntSpace(
      {super.key,
      this.style,
      this.decoration,
      this.direction = SpaceDirection.horizontal,
      this.children,
      this.spacing=2});

  final StateStyle? style;
  final BoxDecoration? decoration;
  final SpaceDirection? direction;
  final List<Widget>? children;
  final double? spacing;

  @override
  State<StatefulWidget> createState() => _AntSpaceState();
}

class _AntSpaceState extends State<AntSpace> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _AntSpaceStyle style = _AntSpaceStyle();
    // style.merge(widget.style);

    Widget child = widget.children != null
        ? widget.direction == SpaceDirection.vertical
            ? Column(
                spacing: widget.spacing ?? 0,
                children: widget.children!,
              )
            : Wrap(
                spacing: widget.spacing ?? 0,
                children: widget.children!,
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

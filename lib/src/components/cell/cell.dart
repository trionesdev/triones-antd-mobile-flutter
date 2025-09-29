import 'package:flutter/material.dart';

class AntCell extends StatefulWidget {
  const AntCell({
    super.key,
    this.arrow = true,
    this.placeholder,
    this.icon,
    this.placeholderWidget,
    this.child,
    this.onTap,
  });

  final Text? placeholderWidget;
  final String? placeholder;
  final bool arrow;
  final Widget? icon;
  final Widget? child;
  final Function? onTap;

  @override
  State<StatefulWidget> createState() => _AntCellState();
}

class _AntCellState extends State<AntCell> {
  Widget get child {
    if (widget.child != null) {
      return widget.child!;
    } else {
      return Text(widget.placeholder ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Row(
        children: [
          Expanded(child: child),
          if (widget.arrow)
            widget.icon ??
                Icon(Icons.keyboard_arrow_right, size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}

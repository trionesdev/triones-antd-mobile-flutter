import 'package:flutter/material.dart';

class AntBadge extends StatefulWidget {
  const AntBadge(
      {super.key,
      this.child,
      this.label,
      this.count,
      this.visible,
      this.maxCount = 999,
      this.offset,
      this.alignment,
      this.backgroundColor,
      this.textStyle});

  final Color? backgroundColor;
  final Widget? label;
  final int? count;
  final int? maxCount;
  final Alignment? alignment;
  final Offset? offset;
  final TextStyle? textStyle;
  final bool? visible;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _AntBadgeState();
}

class _AntBadgeState extends State<AntBadge> {
  Widget? get label {
    if (widget.label != null) {
      return widget.label!;
    }
    if (widget.count != null) {
      if (widget.count! > widget.maxCount!) {
        return Text("${widget.maxCount}+");
      }
      return Text("${widget.count}");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: label,
      isLabelVisible: widget.visible ?? true,
      textStyle: widget.textStyle,
      backgroundColor: widget.backgroundColor,
      offset: widget.offset,
      alignment: widget.alignment,
      child: widget.child,
    );
  }
}

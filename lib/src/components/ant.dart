import 'package:flutter/material.dart';

class Ant extends StatefulWidget {
  const Ant({super.key, this.child, this.color});
  final Color? color;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _AntState();
}

class _AntState extends State<Ant> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color ?? Colors.white,
      child: widget.child,
    );
  }
}

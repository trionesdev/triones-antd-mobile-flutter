import 'package:flutter/material.dart';

class AntSpinLoading extends StatefulWidget {
  const AntSpinLoading(
      {super.key, this.backgroundColor, this.color = Colors.grey});

  final Color? backgroundColor;
  final Color? color;

  @override
  State<StatefulWidget> createState() => _AntSpinLoadingState();
}

class _AntSpinLoadingState extends State<AntSpinLoading> {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: CircularProgressIndicator(
        color: widget.color,
        backgroundColor: widget.backgroundColor,
      ),
    );
  }
}

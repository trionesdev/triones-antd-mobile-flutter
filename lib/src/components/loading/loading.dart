import 'package:flutter/material.dart';

/// @component AntSpinLoading
class AntSpinLoading extends StatefulWidget {
  const AntSpinLoading({
    super.key,
    this.backgroundColor,
    this.color = Colors.grey,
  });

  /// @description 背景颜色
  /// @default null
  final Color? backgroundColor;

  /// @description 颜色
  /// @default null
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

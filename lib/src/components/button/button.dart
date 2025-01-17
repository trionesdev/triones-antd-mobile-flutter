library;

import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  text,
  dashed,
  link,
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.block,
    this.disabled,
    this.text,
    this.icon,
    this.onPressed,
  });

  final bool? block;
  final bool? disabled;
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.red),
    );
    if (widget.icon != null) {
      return IconButton(
          onPressed: widget.onPressed, icon: widget.icon!, style: buttonStyle);
    }
    return TextButton.icon(
      onPressed: widget.onPressed,
      icon: widget.icon,
      label: Text(widget.text != null ? widget.text! : ''),
      style: buttonStyle,
    );
  }
}

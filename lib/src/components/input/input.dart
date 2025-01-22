import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    this.placeholder,
  });

  final String? placeholder;

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person), // 前缀图标
        suffixIcon: Icon(Icons.visibility),
        suffixIconConstraints: BoxConstraints(maxWidth: 24, maxHeight: 24),
        hintText: widget.placeholder, // 提示文本
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

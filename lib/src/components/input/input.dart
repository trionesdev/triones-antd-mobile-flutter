import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person), // 前缀图标
        hintText: 'Enter your name', // 提示文本
        border: OutlineInputBorder(), // 边框
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';

enum InputType {
  text,
  password,
}

class Input extends StatefulWidget {
  const Input({
    super.key,
    this.placeholder,
    this.type = InputType.text,
    this.prefix,
    this.suffix,
  });

  final String? placeholder;
  final InputType? type;
  final Widget? prefix;
  final Widget? suffix;

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !passwordVisible,
      decoration: InputDecoration(
        prefixIcon: widget.prefix, // 前缀图标
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.type == InputType.password)
              GestureDetector(
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: Icon(
                    passwordVisible ? Icons.visibility_off : Icons.visibility),
              ),
            if (widget.suffix != null) widget.suffix!,
          ],
        ),
        hintText: widget.placeholder, // 提示文本
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Form extends StatefulWidget {
  const Form({super.key, required this.children});

  final List<Widget> children;

  @override
  State<StatefulWidget> createState() => FormState();
}

class FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children,
    );
  }
}

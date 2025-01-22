import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Input'),
        ),
        body: Center(
            child: Column(children: [
              Input(),
        ])));
  }
}

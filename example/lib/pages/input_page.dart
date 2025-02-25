import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        appBar: AntAppBar(
          title: Text('Input'),
        ),
        body: Center(
            child: Column(spacing: 10, children: [
          AntInput(
            style: StateStyle(
              style: Style(
                  borderRadius: 0,
                  borderBottom: StyleBorder(
                      color: Colors.blue, width: 2, style: BorderStyle.solid)),
            ),
            placeholder: "请输入内容",
          ),
          AntInput(
            style: StateStyle(
              style: Style(
                  border: StyleBorder(
                      color: Colors.black, width: 1, style: BorderStyle.solid)),
            ),
            type: InputType.password,
            placeholder: "请输入内容",
            // height: 24,
          ),
          AntInput(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            placeholder: "请输入内容",
            height: 48,
            suffix: Icon(Icons.add),
            // height: 24,
          ),
        ])));
  }
}

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
    return Scaffold(
        appBar: AppBar(
          title: Text('Input'),
        ),
        body: Center(

            child: Column(
                spacing: 10,
                children: [
          AntInput(
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue, // 边框颜色
                    width: 2.0,         // 边框宽度
                  ),
                  top: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                )
            ),
            placeholder: "请输入内容",
          ),
          AntInput(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            type: InputType.password,
            placeholder: "请输入内容",
            // height: 24,
          ),
                  AntInput(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    type: InputType.password,
                    placeholder: "请输入内容",
                    suffix: Icon(Icons.add),
                    // height: 24,
                  ),
                  TextField()
        ])));
  }
}

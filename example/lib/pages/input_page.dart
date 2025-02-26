import 'package:antd_flutter_example/demo_block.dart';
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
        body: SingleChildScrollView(
            child: Column(spacing: 10, children: [
          DemoBlock(
            title: "普通使用",
            child: AntInput(
              placeholder: "请输入内容",
            ),
          ),
          DemoBlock(
            title: "类型",
            child: Column(
              children: [
                AntInput(
                  type: InputType.password,
                  placeholder: "请输入内容",
                  // height: 24,
                ),
              ],
            ),
          ),
          DemoBlock(
            title: "自定义样式",
            child: Column(
              spacing: 10,
              children: [
                AntInput(
                  style: StateStyle(
                    style: Style(
                        borderRadius: 0,
                        borderBottom: StyleBorder(
                            color: Colors.blue,
                            width: 2,
                            style: BorderStyle.solid)),
                  ),
                  placeholder: "请输入内容",
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
              ],
            ),
          ),
        ])));
  }
}

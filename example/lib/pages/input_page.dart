import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text('Input 输入框')),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            DemoBlock(
              title: "普通使用",
              child: AntInput(placeholder: "请输入内容"),
            ),
            DemoBlock(
              title: "类型",
              child: Column(
                children: [
                  AntInput(
                    type: AntInputType.password,
                    placeholder: "请输入内容",
                    // height: 24,
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "变体",
              child: Column(
                spacing: 10,
                children: [
                  AntInput(
                    placeholder: "outlined",
                    variant: AntInputVariant.outlined,
                  ),
                  AntInput(
                    placeholder: "filled",
                    variant: AntInputVariant.filled,
                  ),
                  AntInput(
                    placeholder: "borderless",
                    variant: AntInputVariant.borderless,
                  ),
                  AntInput(
                    placeholder: "underlined",
                    variant: AntInputVariant.underlined,
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "对齐方式",
              child: Column(
                spacing: 10,
                children: [
                  AntInput(
                    placeholder: "左对齐",
                    align: AntInputAlign.left,
                    variant: AntInputVariant.outlined,
                  ),
                  AntInput(
                    placeholder: "右对齐",
                    align: AntInputAlign.right,
                    variant: AntInputVariant.outlined,
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "只读模式",
              child: AntInput(
                placeholder: "只读输入框",
                value: "这是只读内容",
                readOnly: true,
                variant: AntInputVariant.outlined,
              ),
            ),
            DemoBlock(
              title: "自定义样式",
              child: Column(
                spacing: 10,
                children: [
                  AntInput(
                    variant: AntInputVariant.outlined,
                    borderRadius: BorderRadius.circular(90),
                    gapPadding: 20,
                    placeholder: "请输入内容",
                  ),
                  AntInput(
                    variant: AntInputVariant.filled,
                    borderRadius: BorderRadius.circular(90),
                    gapPadding: 20,
                    placeholder: "请输入内容",
                  ),
                  AntInput(
                    style: StateStyle(
                      style: Style(
                        borderRadius: 0,
                        borderBottom: StyleBorder(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    placeholder: "请输入内容",
                  ),
                  AntInput(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    placeholder: "请输入内容",
                    size: AntSize.large,
                    suffix: Icon(Icons.add),
                    // height: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

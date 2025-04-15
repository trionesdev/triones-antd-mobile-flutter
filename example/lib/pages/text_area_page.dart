import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class TextAreaPage extends StatefulWidget {
  const TextAreaPage({super.key});

  @override
  State<StatefulWidget> createState() => _TextAreaPageState();
}

class _TextAreaPageState extends State<TextAreaPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: const Text("TextArea 文本域")),
      body: SingleChildScrollView(child: Column(children: [
        DemoBlock(title: "基本用法", child: Column(children: [
          AntTextArea()
        ]),),
        DemoBlock(title: "最大行数", child: Column(children: [
          AntTextArea(maxLines: 5,)
        ]),)
      ],),),
    );
  }
}

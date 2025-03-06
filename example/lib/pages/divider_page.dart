import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class DividerPage extends StatefulWidget {
  const DividerPage({super.key});

  @override
  State<StatefulWidget> createState() => _DividerPageState();
}

class _DividerPageState extends State<DividerPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: const Text("Divider"),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            DemoBlock(title: "基本使用",child: Column(children: [
              AntDivider()
            ]),),
            DemoBlock(title: "带内容的分割线",child: Column(children: [
              AntDivider(child: Text("分割线"),),
              AntDivider(contentPosition: ContentPosition.left,child: Text("分割线"),),
              AntDivider(contentPosition: ContentPosition.right,child: Text("分割线"),),
            ]),),
            DemoBlock(title: "垂直分割线",child: Column(children: [
              Row(children: [Text("link"), VerticalDivider(), Text("link")])
            ]))
          ],
        ),
      )
    );
  }
}
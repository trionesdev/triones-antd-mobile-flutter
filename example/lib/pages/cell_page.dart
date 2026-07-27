import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../demo_block.dart';

class CellPage extends StatefulWidget {
  const CellPage({super.key});

  @override
  State<StatefulWidget> createState() => _CellPageState();
}

class _CellPageState extends State<CellPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: const Text('Cell 单元格')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DemoBlock(
              title: "基本使用",
              child: AntCell(labelText: "单元格", child: Text("内容")),
            ),
            DemoBlock(
              title: "基本使用(内容居右)",
              child: AntCell(
                labelText: "单元格",
                contentAlign: AntAlign.right,
                child: Text("内容"),
              ),
            ),
            DemoBlock(
              title: "单元格组",
              child: AntCellGroup(
                arrow: true,
                contentAlign: AntAlign.right,
                children: [
                  AntCell(labelText: "单元格1", child: Text("内容1")),
                  AntCell(labelText: "单元格2", child: Text("内容2")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../demo_block.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  SelectPageState createState() => SelectPageState();
}

class SelectPageState extends State<SelectPage> {
  static const options = [
    {"value": "1", "label": "选项1"},
    {"value": "2", "label": "选项2"},
    {"value": "3", "label": "选项3"},
    {"value": "4", "label": "选项4"},
    {"value": "5", "label": "选项5"},
    {"value": "6", "label": "选项6"},
    {"value": "7", "label": "选项7"},
    {"value": "8", "label": "选项8"},
    {"value": "9", "label": "选项9"},
  ];

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text("Select 选择器")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本用法",
              child: Column(
                children: [
                  AntSelect(options: options, placeholder: "请选择", arrow: true),
                ],
              ),
            ),
            DemoBlock(
              title: "页面模式",
              child: Column(
                children: [
                  AntSelect(
                    options: options,
                    placeholder: "请选择",
                    arrow: true,
                    modalMode: AntSelectModalMode.page,
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "多选模式",
              child: Column(
                children: [
                  AntSelect(options: options, placeholder: "请选择", arrow: true,mode: AntSelectMode.multiple,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

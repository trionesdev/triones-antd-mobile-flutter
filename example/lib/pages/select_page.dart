import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../demo_block.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  SelectPageState createState() => SelectPageState();
}

class SelectPageState extends State<SelectPage> {
  var options = [
    {"value": "1", "label": "选项1"},
    {"value": "2", "label": "选项2"},
    {"value": "3", "label": "选项3"},
    {"value": "4", "label": "选项4"},
    {"value": "5", "label": "选项5"},
    {"value": "6", "label": "选项6"},
    {"value": "7", "label": "选项7"},
    {"value": "8", "label": "选项8"},
    {"value": "9", "label": "选项9"},
    {"value": "10", "label": "选项10"},
    {"value": "11", "label": "选项11"},
    {"value": "12", "label": "选项12"},
    {"value": "13", "label": "选项13"},
    {"value": "14", "label": "选项14"},
    {"value": "15", "label": "选项15"},
    {"value": "16", "label": "选项16"},
    {"value": "17", "label": "选项17"},
    {"value": "18", "label": "选项18"},
    {"value": "19", "label": "选项19"},
    {"value": "20", "label": "选项20"},
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
            DemoBlock(
              title: "Popup模式-刷新",
              child: Column(
                children: [
                  AntSelect(
                    options: options,
                    placeholder: "请选择",
                    arrow: true,
                    modalMode: AntSelectModalMode.popup,
                    showSearch:  true,
                    onSearch: (value) {
                      print("search Value:"+value.toString());
                    },
                    onRefresh: () async {
                      setState(() {
                        options = [
                          {"value": "1", "label": "选项1"},
                          {"value": "2", "label": "选项2"},
                          {"value": "3", "label": "选项3"},
                          {"value": "4", "label": "选项4"},
                          {"value": "5", "label": "选项5"},
                          {"value": "6", "label": "选项6"},
                          {"value": "7", "label": "选项7"},
                        ];
                      });
                    },
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "页面模式-刷新",
              child: Column(
                children: [
                  AntSelect(
                    options: options,
                    placeholder: "请选择",
                    arrow: true,
                    modalMode: AntSelectModalMode.page,
                    showSearch:  true,
                    onSearch: (value) {
                      print("search Value:"+value.toString());
                    },
                    onRefresh: () async {
                      setState(() {
                        options = [
                          {"value": "1", "label": "选项1"},
                          {"value": "2", "label": "选项2"},
                          {"value": "3", "label": "选项3"},
                          {"value": "4", "label": "选项4"},
                          {"value": "5", "label": "选项5"},
                          {"value": "6", "label": "选项6"},
                          {"value": "7", "label": "选项7"},
                        ];
                      });
                    },
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

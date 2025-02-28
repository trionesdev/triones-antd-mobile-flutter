import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class CascaderPickerPage extends StatefulWidget {
  const CascaderPickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _CascaderPickerPageState();
}

class _CascaderPickerPageState extends State<CascaderPickerPage> {
  final List<List<CascaderPickerOption>> _columns = [
    [
      CascaderPickerOption(label: "江苏", value: "jaingsu", children: [
        CascaderPickerOption(label: "泰州", value: "taizhou", children: [
          CascaderPickerOption(label: "泰兴", value: "taixing"),
          CascaderPickerOption(label: "靖江", value: "靖江"),
        ]),
        CascaderPickerOption(label: "苏州", value: "suzhou"),
        CascaderPickerOption(label: "无锡", value: "wuxi"),
      ]),
      CascaderPickerOption(label: "山东", value: "shandong"),
      CascaderPickerOption(label: "浙江", value: "zhejiang"),
      CascaderPickerOption(label: "上海", value: "shanghai"),
      CascaderPickerOption(label: "广东", value: "guangdong"),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: const Text('CascaderPicker'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [AntButton(text: "CascaderPicker", onPressed: () {})]),
      ),
    );
  }
}

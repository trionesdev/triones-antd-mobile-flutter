import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CascaderPickerPage extends StatefulWidget {
  const CascaderPickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _CascaderPickerPageState();
}

class _CascaderPickerPageState extends State<CascaderPickerPage> {
  final List<AntCascaderPickerOption> _options = [
    AntCascaderPickerOption(label: "江苏", value: "jiangsu", children: [
      AntCascaderPickerOption(label: "泰州", value: "taizhou", children: [
        AntCascaderPickerOption(label: "泰兴", value: "taixing"),
        AntCascaderPickerOption(label: "靖江", value: "靖江"),
      ]),
      AntCascaderPickerOption(label: "苏州", value: "suzhou"),
      AntCascaderPickerOption(label: "无锡", value: "wuxi"),
    ]),
    AntCascaderPickerOption(label: "山东", value: "shandong"),
    AntCascaderPickerOption(label: "浙江", value: "zhejiang"),
    AntCascaderPickerOption(label: "上海", value: "shanghai"),
    AntCascaderPickerOption(label: "广东", value: "guangdong"),
    AntCascaderPickerOption(label: "福建", value: "fujian"),
    AntCascaderPickerOption(label: "云南", value: "yunan"),
    AntCascaderPickerOption(label: "贵州", value: "guizhou"),
    AntCascaderPickerOption(label: "四川", value: "sichuan"),
    AntCascaderPickerOption(label: "湖南", value: "hunan"),
    AntCascaderPickerOption(label: "湖北", value: "hubei"),
    AntCascaderPickerOption(label: "河南", value: "heinan"),
    AntCascaderPickerOption(label: "河北", value: "hebei"),
  ];

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: const Text('CascaderPicker'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          DemoBlock(
            title: "基本使用",
            child: AntButton(
                text: "CascaderPicker",
                onPressed: () {
                  showAntCascaderPicker(
                      context: context,
                      options: _options,
                      maxHeight: 400,
                      onOk: (value) {
                        print(value);
                      });
                }),
          ),
          DemoBlock(
            title: "设置默认值",
            child: AntButton(
                text: "CascaderPicker 默认值",
                onPressed: () {
                  showAntCascaderPicker(
                      context: context,
                      value: ["jiangsu", "taizhou"],
                      options: _options,
                      maxHeight: 400,
                      onOk: (value) {
                        print(value);
                      });
                }),
          ),
          DemoBlock(
            title: "设置默认值,并自动滚动到对应位置",
            child: AntButton(
                text: "CascaderPicker 默认值",
                onPressed: () {
                  showAntCascaderPicker(
                      context: context,
                      value: ["hebei"],
                      options: _options,
                      maxHeight: 400,
                      onOk: (value) {
                        print(value);
                      });
                }),
          )
        ]),
      ),
    );
  }
}

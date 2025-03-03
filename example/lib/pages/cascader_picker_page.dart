import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class CascaderPickerPage extends StatefulWidget {
  const CascaderPickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _CascaderPickerPageState();
}

class _CascaderPickerPageState extends State<CascaderPickerPage> {
  final List<CascaderPickerOption> _options = [
    CascaderPickerOption(label: "江苏", value: "jiangsu", children: [
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
    CascaderPickerOption(label: "福建", value: "fujian"),
    CascaderPickerOption(label: "云南", value: "yunan"),
    CascaderPickerOption(label: "贵州", value: "guizhou"),
    CascaderPickerOption(label: "四川", value: "sichuan"),
    CascaderPickerOption(label: "湖南", value: "hunan"),
    CascaderPickerOption(label: "湖北", value: "hubei"),
    CascaderPickerOption(label: "河南", value: "heinan"),
    CascaderPickerOption(label: "河北", value: "hebei"),
  ];

  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
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
                  AntCascaderPicker.show(
                      context: context,
                      options: _options,
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
                  AntCascaderPicker.show(
                      context: context,
                      value: ["jiangsu","taizhou"],
                      options: _options,
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
                  AntCascaderPicker.show(
                      context: context,
                      value: ["hebei"],
                      options: _options,
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

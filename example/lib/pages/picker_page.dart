import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  final List<AntPickerOption> _options1 = [
    AntPickerOption(label: "周一", value: "Mon"),
    AntPickerOption(label: "周二", value: "Tues"),
    AntPickerOption(label: "周三", value: "Wed"),
    AntPickerOption(label: "周四", value: "Thur"),
    AntPickerOption(label: "周五", value: "Fri"),
  ];

  final List<List<AntPickerOption>> _columns = [
    [
      AntPickerOption(label: "周一", value: "Mon"),
      AntPickerOption(label: "周二", value: "Tues"),
      AntPickerOption(label: "周三", value: "Wed"),
      AntPickerOption(label: "周四", value: "Thur"),
      AntPickerOption(label: "周五", value: "Fri"),
    ],
    [
      AntPickerOption(label: "上午", value: "am"),
      AntPickerOption(label: "下午", value: "pm"),
    ],
  ];

  List<AntPickerOption> _optionsJiangSu = [
    AntPickerOption(label: "南京", value: "nanjing"),
    AntPickerOption(label: "苏州", value: "suzhou"),
  ];

  final List<AntPickerOption> _optionsZheJiang = [
    AntPickerOption(label: "杭州", value: "hangzhou"),
    AntPickerOption(label: "宁波", value: "ningbo"),
  ];

  final List<AntPickerOption> _optionsHeNan = [
    AntPickerOption(label: "开封", value: "kaifeng")
  ];

  List<List<AntPickerOption>> _options2 = [
    [
      AntPickerOption(label: "江苏", value: "jiangsu"),
      AntPickerOption(label: "浙江", value: "zhejiang"),
      AntPickerOption(label: "河南", value: "heinan"),
    ],
    [
      AntPickerOption(label: "南京", value: "nanjing"),
      AntPickerOption(label: "苏州", value: "suzhou"),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(title: Text('Picker')),
        body: SingleChildScrollView(
          child: Column(spacing: 10, children: [
            DemoBlock(
              title: "基本用法",
              child: Column(
                children: [
                  AntButton(
                      text: '选择',
                      block: true,
                      onPressed: () {
                        AntPicker.show(
                            context: context,
                            options: _options1,
                            title: Text("选择日期"),
                            maxHeight: 400,
                            onOk: (value) {
                              print(value);
                            });
                      })
                ],
              ),
            ),
            DemoBlock(
                title: "多列选择",
                child: Column(children: [
                  AntButton(
                      text: "默认值",
                      block: true,
                      onPressed: () {
                        AntPicker.showMulti(
                            context: context,
                            title: Text("选择日期"),
                            options: _columns,
                            value: ["Fri", "pm"],
                            maxHeight: 400,
                            onOk: (value) {
                              print(value);
                            });
                      })
                ])),
            DemoBlock(
              title: "联动效果",
              child: Column(children: [
                AntButton(
                  text: "联动效果",
                  block: true,
                  onPressed: () {
                    AntPicker.showMulti(
                        context: context,
                        title: Text("选择地区"),
                        options: _options2,
                        maxHeight: 400,
                        onOk: (value) {
                          print(value);
                        },
                        onColumnSelected: (value, index) {
                          if (index == 0) {
                            if (value?.value == "zhejiang") {
                              _options2[1] = _optionsZheJiang;
                            }
                            if (value?.value == "jiangsu") {
                              _options2[1] = _optionsJiangSu;
                            }
                            if (value?.value == "heinan") {
                              _options2[1] = _optionsHeNan;
                            }
                          }
                        });
                  },
                )
              ]),
            )
          ]),
        ));
  }
}

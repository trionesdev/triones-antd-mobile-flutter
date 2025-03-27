import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  final List<PickerOption> _options1 = [
    PickerOption(label: "周一", value: "Mon"),
    PickerOption(label: "周二", value: "Tues"),
    PickerOption(label: "周三", value: "Wed"),
    PickerOption(label: "周四", value: "Thur"),
    PickerOption(label: "周五", value: "Fri"),
  ];

  final List<List<PickerOption>> _columns = [
    [
      PickerOption(label: "周一", value: "Mon"),
      PickerOption(label: "周二", value: "Tues"),
      PickerOption(label: "周三", value: "Wed"),
      PickerOption(label: "周四", value: "Thur"),
      PickerOption(label: "周五", value: "Fri"),
    ],
    [
      PickerOption(label: "上午", value: "am"),
      PickerOption(label: "下午", value: "pm"),
    ],
  ];

  List<PickerOption> _optionsJiangSu = [
    PickerOption(label: "南京", value: "nanjing"),
    PickerOption(label: "苏州", value: "suzhou"),
  ];

  final List<PickerOption> _optionsZheJiang = [
    PickerOption(label: "杭州", value: "hangzhou"),
    PickerOption(label: "宁波", value: "ningbo"),
  ];

  final List<PickerOption> _optionsHeNan = [
    PickerOption(label: "开封", value: "kaifeng")
  ];

  List<List<PickerOption>> _options2 = [
    [
      PickerOption(label: "江苏", value: "jiangsu"),
      PickerOption(label: "浙江", value: "zhejiang"),
      PickerOption(label: "河南", value: "heinan"),
    ],
    [
      PickerOption(label: "南京", value: "nanjing"),
      PickerOption(label: "苏州", value: "suzhou"),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
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

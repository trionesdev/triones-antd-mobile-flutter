import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
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

  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        appBar: AntAppBar(title: Text('Picker')),
        body: SingleChildScrollView(
          child: Column(spacing: 10, children: [
            Wrap(
              children: [
                AntButton(
                    text: '选择',
                    block: true,
                    onPressed: () {
                      AntPicker.show(
                          context: context,
                          columns: _columns,
                          title: Text("选择日期"),
                          maxHeight: 400,
                          onOk: (value) {
                            print(value);
                          });
                    })
              ],
            ),
            AntButton(
                text: "默认值",
                block: true,
                onPressed: () {
                  AntPicker.show(
                      context: context,
                      title: Text("选择日期"),
                      columns: _columns,
                      value: ["Fri", "pm"],
                      maxHeight: 400,
                      onOk: (value) {
                        print(value);
                      });
                })
          ]),
        ));
  }
}

import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AppBar(title: const Text('DatePicker')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本用法",
              child: Column(
                children: [
                  AntButton(
                    text: "基本用法",
                    onPressed: () {
                      showAntDatePicker(
                        context: context,
                        onOk: (value) {
                          print(value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "带时间",
              child: Column(
                children: [
                  AntButton(
                    text: "基本用法(带时间)",
                    onPressed: () {
                      showAntDatePicker(
                        context: context,
                        showTime: true,
                        onOk: (value) {
                          print(value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "时间模式",
              child: Column(
                children: [
                  AntButton(
                    text: "时间模式",
                    onPressed: () {
                      showAntDatePicker(
                        context: context,
                        mode: AntDatePickerMode.time,
                        onOk: (value) {
                          print(value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "时间模式(格式化)",
              child: Column(
                children: [
                  AntButton(
                    text: "时间模式(格式化)",
                    onPressed: () {
                      showAntDatePicker(
                        context: context,
                        titleText: "时间模式(格式化)",
                        mode: AntDatePickerMode.time,
                        timeFormat: "HH:mm",
                        onOk: (value) {
                          print(value);
                        },
                      );
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

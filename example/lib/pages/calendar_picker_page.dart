import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CalendarPickerPage extends StatefulWidget {
  const CalendarPickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarPickerPageState();
}

class _CalendarPickerPageState extends State<CalendarPickerPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("CalendarPicker"),
      ),
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
                      showAntCalendarPicker(
                          context: context,
                          onOk: (value) {
                            AntToast.show(
                                context: context, content: Text("$value"));
                          });
                    },
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "设置默认值",
              child: Column(
                children: [
                  AntButton(
                    text: "设置默认值",
                    onPressed: () {
                      showAntCalendarPicker(
                          context: context,
                          value: DateTime.now(),
                          onOk: (value) {
                            AntToast.show(
                                context: context, content: Text("$value"));
                          });
                    },
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "基本用法(范围选择)",
              child: Column(
                children: [
                  AntButton(
                    text: "基本用法",
                    onPressed: () {
                      showAntCalendarRangePicker(
                          context: context,
                          onOk: (value) {
                            AntToast.show(
                                context: context,
                                content: Text(
                                    "${value?.elementAtOrNull(0)}~${value?.elementAtOrNull(1)}"));
                          });
                    },
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "设置默认值(范围选择)",
              child: Column(
                children: [
                  AntButton(
                    text: "设置默认值",
                    onPressed: () {
                      showAntCalendarRangePicker(
                          context: context,
                          value: [
                            DateTime.now(),
                            DateTime.now().add(Duration(days: 7))
                          ],
                          onOk: (value) {
                            showAntToast(
                                context: context,
                                content: Text(
                                    "${value?.elementAtOrNull(0)}~${value?.elementAtOrNull(1)}"));
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

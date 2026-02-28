import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CalendarPickerCellPage extends StatefulWidget {
  const CalendarPickerCellPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarPickerCellPageState();
}

class _CalendarPickerCellPageState extends State<CalendarPickerCellPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: const Text('CalendarPickerCell')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本用法",
              child: Column(
                children: [
                  AntCalendarPickerCell(
                    labelText: "选择日期",
                    placeholderText: "请选择日期",
                    value: DateTime(2026, 1, 15),
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "自定义格式",
              child: Column(
                children: [
                  AntCalendarPickerCell(
                    labelText: "生日",
                    format: "yyyy年MM月dd日",
                    value: DateTime(1990, 5, 15),
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "带标题",
              child: Column(
                children: [
                  AntCalendarPickerCell(
                    labelText: "选择日期",
                    titleText: "请选择您的出生日期",
                    value: DateTime(2026, 1, 15),
                    format: "yyyy-MM-dd",
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

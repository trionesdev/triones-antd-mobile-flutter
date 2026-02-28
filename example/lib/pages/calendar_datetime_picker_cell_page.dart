import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CalendarDatetimePickerCellPage extends StatefulWidget {
  const CalendarDatetimePickerCellPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarDatetimePickerCellPageState();
}

class _CalendarDatetimePickerCellPageState extends State<CalendarDatetimePickerCellPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: const Text('DatePickerCell')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本用法",
              child: Column(
                children: [
                  AntCalendarDateTimePickerCell(
                    labelText: "选择日期",
                    placeholderText: "请选择日期",
                    value: DateTime(2026,1),
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

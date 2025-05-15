import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CalendarDatetimePickerPage extends StatefulWidget {
  const CalendarDatetimePickerPage({super.key});

  @override
  State<CalendarDatetimePickerPage> createState() =>
      _CalendarDatetimePickerPageState();
}

class _CalendarDatetimePickerPageState
    extends State<CalendarDatetimePickerPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("CalendarDatetime"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本使用",
              child: AntButton(
                  text: "打开",
                  onPressed: () {
                    AntCalendarDatetimePicker.show(context: context,onOk: (date) {
                      print(date.toString());
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}

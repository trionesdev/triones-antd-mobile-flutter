import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<StatefulWidget> createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("CalendarPicker"),
      ),
      body: SingleChildScrollView(child: Column(children: [
        DemoBlock(title: "基本使用", child: AntCalendar(),),
        DemoBlock(title: "基本使用（范围选择）", child: AntCalendarRange(),),
      ],),),
    );
  }
}
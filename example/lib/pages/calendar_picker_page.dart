import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class CalendarPickerPage extends StatefulWidget {
  const CalendarPickerPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarPickerPageState();
}

class _CalendarPickerPageState extends State<CalendarPickerPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
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
                      AntCalendarPicker.show(context: context);
                    },
                  ),
                  Container(
                    height: 100,
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      onPageChanged: (index) {
                        print(index);
                      },
                      children: [
                        Container(
                          height: 50,
                          child: Text("1"),
                        ),
                        Container(
                          height: 50,
                          child: Text("2"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

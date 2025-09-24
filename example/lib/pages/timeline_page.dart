import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<StatefulWidget> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("Timeline 时间轴"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DemoBlock(
              title: "基本用法",
              child: AntTimeline(
                items: List.generate(10, (index) {
                  return AntTimelineItemStruct(
                      latest: index == 9, content: Text("内容${index + 1}"));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AntTimelineItem {
  Widget? content;
}

class AntTimeline extends StatefulWidget {
  const AntTimeline({super.key, this.items});

  final List<AntTimelineItem>? items;

  @override
  State<StatefulWidget> createState() => _AntTimelineState();
}

class _AntTimelineState extends State<AntTimeline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(10, (index) {
            return IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          child: Icon(Icons.access_time_filled),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 100,
                    child: Text("ddddddddddddddddd"),
                  ))
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

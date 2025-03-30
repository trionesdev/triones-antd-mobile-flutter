import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AntTimelineItemType {
  Widget? icon;
  Widget? content;
}

class AntTimeline extends StatefulWidget {
  const AntTimeline({super.key, this.items});

  final List<AntTimelineItemType>? items;

  @override
  State<StatefulWidget> createState() => _AntTimelineState();
}

class _AntTimelineState extends State<AntTimeline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(10, (index) {
            bool endItem = (index == 9);
            return IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: endItem
                              ? null
                              : Container(
                                  width: 2,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(color: Color(0xffF0F0F0),width: 2),
                                          right: BorderSide.none)),
                                ),
                        ),
                        Positioned(
                            top: 0,
                            child: Container(
                              color: Colors.white,
                              child: CustomPaint(
                                size: Size(20, 20),
                                painter: MyCustomPainter(),
                              ),
                            ))
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


class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 5;
    paint.style = PaintingStyle.stroke;


    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 6.0, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 如果你的绘图逻辑依赖于某些可变状态，并且这些状态发生变化时你需要重绘，
    // 那么你应该在这里返回true。否则，返回false以提高性能。
    return false;
  }
}
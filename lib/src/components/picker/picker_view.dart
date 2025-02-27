import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AntPickerView extends StatefulWidget {
  const AntPickerView({super.key});

  @override
  State<StatefulWidget> createState() => _AntPickerViewState();
}

class _AntPickerViewState extends State<AntPickerView> with MaterialStateMixin {
  double viewHeight = 0;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print(constraints.maxHeight);
      viewHeight = constraints.maxHeight;
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            child: ListWheelScrollView(
              itemExtent: 40,              // 条目固定高度
              diameterRatio: 1.5,          // 滚轮直径比例
              perspective: 0.003,          // 3D透视效果
              physics: FixedExtentScrollPhysics(), // 物理效果
              useMagnifier: true,          // 放大镜效果
              magnification: 1.2,          // 放大系数
              children: List.generate(50, (i) =>
                  Text("sss")
              ),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.white.withOpacity(0)])),
                )),
                Container(
                  height: 36,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // color: Colors.grey
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5),
                          bottom: BorderSide(color: Colors.grey, width: 0.5))),
                  child: Text("ddd"),
                ),
                Expanded(
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.white, Colors.white.withOpacity(0)])),
                ))
              ],
            ),
          )
        ],
      );
    });
  }
}

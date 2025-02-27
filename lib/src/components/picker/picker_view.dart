import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker.dart';

class AntPickerView extends StatefulWidget {
  const AntPickerView({super.key, this.columns});

  final List<List<PickerOption>>? columns;

  @override
  State<StatefulWidget> createState() => _AntPickerViewState();
}

class _AntPickerViewState extends State<AntPickerView> with MaterialStateMixin {
  double viewHeight = 0;
  List<PickerOption> _value = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.columns?[0] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);


    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                child: Text(
                  "取消",
                  style: TextStyle(color: Color(0xFF1777ff)),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                child: Text("确定", style: TextStyle(color: Color(0xFF1777ff))),
              ),
            ),
          ]),
        ),
        Expanded(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          print(constraints.maxHeight);
          viewHeight = constraints.maxHeight;
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: (widget.columns ?? []).map((options) {
                    return Expanded(
                        child: ListWheelScrollView(
                            itemExtent: 34,
                            // 条目固定高度
                            diameterRatio: 1.5,
                            // 滚轮直径比例
                            perspective: 0.003,
                            // 3D透视效果
                            physics: FixedExtentScrollPhysics(),
                            // 物理效果
                            useMagnifier: true,
                            // 放大镜效果
                            magnification: 1.2,
                            // 放大系数
                            onSelectedItemChanged: (index) {
                              setState(() {

                              });
                            },
                            children: (options ?? []).map((option) {
                              return Center(
                                child: Text(option?.label ?? ''),
                              );
                            }).toList()));
                  }).toList(),
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
                              colors: [
                            Colors.white,
                            Colors.white.withOpacity(0)
                          ])),
                    )),
                    Container(
                      height: 34,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          // color: Colors.grey
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5),
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5))),
                    ),
                    Expanded(
                        child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Colors.white,
                            Colors.white.withOpacity(0)
                          ])),
                    ))
                  ],
                ),
              )
            ],
          );
        }))
      ],
    );
  }
}

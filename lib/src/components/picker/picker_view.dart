import 'package:flutter/material.dart';
import './picker.dart';

typedef OnOk = void Function(List<PickerOption?> value);
typedef OnCancel = void Function();

class AntPickerView extends StatefulWidget {
  const AntPickerView(
      {super.key,
      this.columns,
      this.onOk,
      this.onCancel,
      this.value,
      this.title,
      this.itemHeight = 34});

  final Widget? title;
  final List<List<PickerOption>>? columns;
  final List<String>? value;
  final OnCancel? onCancel;
  final OnOk? onOk;
  final double? itemHeight;

  @override
  State<StatefulWidget> createState() => _AntPickerViewState();
}

class _AntPickerViewState extends State<AntPickerView> with MaterialStateMixin {
  double viewHeight = 0;
  List<PickerOption?> _value = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = List.filled(widget.columns?.length ?? 0, null);
      if (widget.value != null) {
        for (int i = 0; i < (widget.columns?.length ?? 0); i++) {
          if (widget.value?[i] != null) {
            _value[i] = widget.columns?[i].firstWhere((option) {
              return option.value == widget.value?[i];
            });
          } else {
            _value[i] = widget.columns?[i].first;
          }
        }
      } else {
        for (int i = 0; i < (widget.columns?.length ?? 0); i++) {
          _value[i] = widget.columns?[i].first;
        }
      }
      print(_value);
    });
  }

  PickerOption? _getOptionByValue(int columnIndex) {
    if (widget.columns != null && widget.value != null) {
      if (widget.columns!.length > columnIndex &&
          widget.value!.length > columnIndex) {
        return widget.columns![columnIndex].firstWhere((option) {
          return option.value == widget.value![columnIndex];
        });
      }
    }
    return null;
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
                padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                child: Text(
                  "取消",
                  style: TextStyle(color: Color(0xFF1777ff)),
                ),
              ),
              onTap: () {
                widget.onCancel?.call();
              },
            ),
            if (widget.title != null)
              Expanded(
                  child: Center(
                child: widget.title!,
              )),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                child: Text("确定", style: TextStyle(color: Color(0xFF1777ff))),
              ),
              onTap: () {
                widget.onOk?.call(_value);
              },
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
                  children:
                      (widget.columns ?? []).asMap().keys.map((columnIndex) {
                    return Expanded(
                        child: AntPickerViewColumn(
                      itemHeight: widget.itemHeight,
                      options: widget.columns?[columnIndex],
                      onSelected: (option) {
                        setState(() {
                          _value[columnIndex] = option;
                        });
                      },
                      value: _getOptionByValue(columnIndex),
                    ));
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
                            Colors.white.withAlpha(0)
                          ])),
                    )),
                    Container(
                      height: widget.itemHeight,
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
                            Colors.white.withAlpha(0)
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

typedef OnSelected = void Function(PickerOption? option);

class AntPickerViewColumn extends StatefulWidget {
  const AntPickerViewColumn(
      {super.key,
      this.options,
      this.onSelected,
      this.value,
      this.itemHeight = 34});

  final List<PickerOption>? options;
  final OnSelected? onSelected;
  final PickerOption? value;
  final double? itemHeight;

  @override
  State<StatefulWidget> createState() => _AntPickerViewColumnState();
}

class _AntPickerViewColumnState extends State<AntPickerViewColumn> {
  FixedExtentScrollController _controller =
      FixedExtentScrollController(initialItem: 2);

  @override
  void initState() {
    super.initState();
    int initItemIndex = 0;
    if (widget.value != null) {
      initItemIndex = widget.options
              ?.indexWhere((element) => element.value == widget.value?.value) ??
          0;
    }
    _controller = FixedExtentScrollController(initialItem: initItemIndex);
  }

  @override
  void didUpdateWidget(AntPickerViewColumn oldWidget) {
    if (oldWidget.value != widget.value) {
      if (widget.value != null) {
        _controller.jumpToItem(widget.options?.indexWhere(
                (element) => element.value == widget.value?.value) ??
            0);
      } else {
        _controller.jumpToItem(0);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
        controller: _controller,
        itemExtent: widget.itemHeight!,
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
          widget.onSelected?.call(widget.options?[index]);
        },
        children: (widget.options ?? []).map((option) {
          return Center(
            child: Text(option.label ?? ''),
          );
        }).toList());
  }
}

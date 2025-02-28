import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'cascader_picker.dart';

typedef OnOk = void Function(List<CascaderPickerOption?> value);
typedef OnCancel = void Function();

class TabItem {
  final String tabKey;
  final String? label;
  final String? value;
  final List<CascaderPickerOption>? options;

  const TabItem( {
    required this.tabKey,
    this.label,
    this.value,
    this.options,
  });
}

class AntCascaderPickerView extends StatefulWidget {
  const AntCascaderPickerView({
    super.key,
    this.options,
    this.onOk,
    this.onCancel,
    this.value,
    this.title,
  });

  final List<CascaderPickerOption>? options;
  final List<String>? value;
  final OnCancel? onCancel;
  final OnOk? onOk;
  final Widget? title;

  @override
  State<StatefulWidget> createState() => _AntCascaderPickerViewState();
}

class _AntCascaderPickerViewState extends State<AntCascaderPickerView> {
  double _rowHight = 34;
  int _activeIndex = 0;
  double viewHeight = 0;

  List<CascaderPickerOption> _options = [];
  List<TabItem?> _tabItems = [];


  @override
  void initState() {
    super.initState();
    _options = widget.options ?? [];
    if (widget.value != null && widget.value!.isNotEmpty) {
      _tabItems = List.filled(widget.value!.length, null);
      CascaderPickerOption? firstOption =  _options.firstWhere((option){
        return option.value == widget.value![0];
      });
      _tabItems[0] = TabItem(
        tabKey: '0',
        label: firstOption.label,
        value: firstOption.value,
        options: _options,
      );
      if (widget.value!.length == 1) {
        _activeIndex = 0;
      }
      // for(int i=1;i<widget.value!.length;i++){
      //   List<CascaderPickerOption> options = _options.where((option){
      //     return option.value == widget.value![i-1];
      //   }).first.children ?? [];
      //
      //   _tabItems[i] = TabItem(
      //   tabKey: i.toString(),
      //  );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
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
            if (widget.title != null) Expanded(child: Center(child: widget.title!,)),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                child: Text("确定", style: TextStyle(color: Color(0xFF1777ff))),
              ),
              onTap: () {
                // widget.onOk?.call(_value);
              },
            ),
          ]),
        ),
        Expanded(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print(constraints.maxHeight);
              viewHeight = constraints.maxHeight;
              return Container();
            }))
      ],
    );
  }
}


typedef OnSelected = void Function(CascaderPickerOption? option);

class AntCascaderPickerViewColumn extends StatefulWidget {
  const AntCascaderPickerViewColumn(
      {super.key, this.options, this.onSelected, this.value});

  final List<CascaderPickerOption>? options;
  final OnSelected? onSelected;
  final CascaderPickerOption? value;

  @override
  State<StatefulWidget> createState() => _AntCascaderPickerViewColumnState();
}

class _AntCascaderPickerViewColumnState extends State<AntCascaderPickerViewColumn> {
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
  void didUpdateWidget(AntCascaderPickerViewColumn oldWidget) {
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
  Widget build(BuildContext context) {
    return ListWheelScrollView(
        controller: _controller,
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
          widget.onSelected?.call(widget.options?[index]);
        },
        children: (widget.options ?? []).map((option) {
          return Center(
            child: Text(option.label ?? ''),
          );
        }).toList());
  }
}
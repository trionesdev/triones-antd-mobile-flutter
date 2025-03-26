import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/types.dart';

class AntPickerViewColumn extends StatefulWidget {
  const AntPickerViewColumn(
      {super.key,
        this.options,
        this.onSelected,
        this.value,
        this.itemHeight = 34});

  final List<PickerOption>? options;
  final ValueChanged<PickerOption?>? onSelected;
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
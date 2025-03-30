import 'package:flutter/material.dart';

import 'picker_view_column.dart';
import 'types.dart';

class AntPickerViewMultiColumns extends StatefulWidget {
  const AntPickerViewMultiColumns(
      {super.key,
      this.columns,
      this.itemHeight,
      this.onColumnSelected,
      this.value,
      this.onOk,
      this.height});

  final List<List<AntPickerOption>>? columns;
  final List<String>? value;
  final double? itemHeight;
  final double? height;
  final void Function(AntPickerOption? value, int index)? onColumnSelected;
  final void Function(List<AntPickerOption?> value)? onOk;

  @override
  State<StatefulWidget> createState() => _AntPickerViewMultiColumnsState();
}

class _AntPickerViewMultiColumnsState extends State<AntPickerViewMultiColumns> {
  List<AntPickerOption?> _value = [];

  AntPickerOption? _getOptionByValue(int columnIndex) {
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

  void generateValueOptions() {
    setState(() {
      _value = List.filled(widget.columns?.length ?? 0, null);
      if (widget.value != null) {
        for (int i = 0; i < (widget.columns?.length ?? 0); i++) {
          if (widget.value?[i] != null) {
            _value[i] = widget.columns![i].firstWhere((option) {
              return option.value == widget.value?[i];
            });
          } else {
            _value[i] = widget.columns![i].first;
          }
        }
      } else {
        for (int i = 0; i < (widget.columns?.length ?? 0); i++) {
          _value[i] = widget.columns![i].first;
        }
      }
    });
    widget.onOk?.call(_value);
  }

  @override
  void initState() {
    super.initState();
    generateValueOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: (widget.columns ?? []).asMap().keys.map((columnIndex) {
              return Expanded(
                  child: AntPickerViewColumn(
                itemHeight: widget.itemHeight,
                options: widget.columns![columnIndex],
                onSelected: (option) {
                  setState(() {
                    _value[columnIndex] = option!;
                    widget.onColumnSelected?.call(option, columnIndex);
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white.withAlpha(0)])),
              )),
              Container(
                height: widget.itemHeight,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    // color: Colors.grey
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5),
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
              ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.white, Colors.white.withAlpha(0)])),
              ))
            ],
          ),
        )
      ],
    );
  }
}

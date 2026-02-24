import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'picker_view_column.dart';
import 'types.dart';

class AntPickerViewMultiColumns extends StatefulWidget {
  const AntPickerViewMultiColumns({
    super.key,
    this.columns,
    this.itemHeight,
    this.onSelectedItemChanged,
    this.onChange,
    this.value,
    this.onOk,
    this.height,
  });

  final List<List<AntPickerOption>>? columns;
  final List<String?>? value;
  final double? itemHeight;
  final double? height;
  final void Function(AntPickerOption? value, int index)? onSelectedItemChanged;
  final void Function(AntPickerOption? value, int index)? onChange;
  final void Function(List<AntPickerOption?> value)? onOk;

  @override
  State<StatefulWidget> createState() => _AntPickerViewMultiColumnsState();
}

class _AntPickerViewMultiColumnsState extends State<AntPickerViewMultiColumns> {
  List<List<AntPickerOption>> _columns = [];
  List<AntPickerOption?> _value = [];

  AntPickerOption? _getOptionByValue(int columnIndex) {
    if (widget.value != null &&
        widget.value!.isNotEmpty) {
      if (_columns.length > columnIndex &&
          widget.value!.length > columnIndex) {
        return _columns[columnIndex].firstWhereOrNull((option) {
          return option.value == widget.value![columnIndex];
        });
      }
    }
    return null;
  }

  void generateValueOptions() {
    _value = List.filled(_columns.length ?? 0, null);
    if (widget.value != null && widget.value!.isNotEmpty) {
      for (int i = 0; i < (_columns.length ?? 0); i++) {
        if (i < widget.value!.length && widget.value?[i] != null) {
          _value[i] = _columns[i].firstWhere((option) {
            return option.value == widget.value?[i];
          });
        } else {
          _value[i] = _columns[i].first;
        }
      }
    } else {
      for (int i = 0; i < (_columns.length ?? 0); i++) {
        _value[i] = _columns[i].first;
      }
    }
    // widget.onOk?.call(_value);
  }

  @override
  void initState() {
    _columns = widget.columns ?? [];
    generateValueOptions();
    super.initState();
  }

  @override
  void didUpdateWidget(AntPickerViewMultiColumns oldWidget) {
    if (!listEquals(oldWidget.columns, widget.columns)) {
      _columns = widget.columns ?? [];
      generateValueOptions();
    }
    super.didUpdateWidget(oldWidget);
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
            children:
                (_columns ?? []).asMap().keys.map((columnIndex) {
                  return Expanded(
                    child: AntPickerViewColumn(
                      itemHeight: widget.itemHeight,
                      options: _columns[columnIndex] ?? [],
                      onSelected: (option) {
                        _value[columnIndex] = option!;
                        widget.onChange?.call(option, columnIndex);
                      },
                      onSelectedItemChanged: (option) {
                        widget.onSelectedItemChanged?.call(option, columnIndex);
                      },
                      value: _getOptionByValue(columnIndex),
                    ),
                  );
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
                      colors: [Colors.white, Colors.white.withAlpha(0)],
                    ),
                  ),
                ),
              ),
              Container(
                height: widget.itemHeight,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Colors.grey
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.5),
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white, Colors.white.withAlpha(0)],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

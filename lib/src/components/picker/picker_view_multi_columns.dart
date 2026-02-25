import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'picker_view_column.dart';
import 'types.dart';

class AntPickerViewMultiColumns extends StatefulWidget {
  const AntPickerViewMultiColumns({
    super.key,
    this.cascade = false,
    this.columns = const [],
    this.itemHeight,
    this.onSelectedItemChanged,
    this.onColumnSelectedChanged,
    this.onChange,
    this.value = const [],
    this.onOk,
    this.height,
  });

  final bool cascade;
  final List<List<AntPickerOption>>? columns;
  final List<String?>? value;
  final double? itemHeight;
  final double? height;
  final Function(AntPickerOption? value, int index)? onSelectedItemChanged;
  final Function(AntPickerOption? value, int index)? onColumnSelectedChanged;
  final Function(
    List<AntPickerOption?> value
  )?
  onChange;
  final Function(List<AntPickerOption?> value)? onOk;

  @override
  State<StatefulWidget> createState() => _AntPickerViewMultiColumnsState();
}

class _AntPickerViewMultiColumnsState extends State<AntPickerViewMultiColumns> {
  List<List<AntPickerOption>> _columns = [];
  List<AntPickerOption?> _value = [];

  void handleInitialValue() {
    _columns = List.from(widget.columns ?? []);
    _value = List.from(List.filled(_columns.length ?? 0, null));
    if (widget.value != null && widget.value!.isNotEmpty) {
      for (int i = 0; i < (_columns.length ?? 0); i++) {
        if (i < widget.value!.length && widget.value?[i] != null) {
          _value[i] = _columns[i].firstWhereOrNull((option) {
            return option.value == widget.value?[i];
          });
        }
        if (_value[i] == null) {
          _value[i] = _columns[i].firstOrNull;
        }
      }
    } else {
      for (int i = 0; i < (_columns.length ?? 0); i++) {
        _value[i] = _columns[i].firstOrNull;
      }
    }

    if (_value.lastOrNull?.children != null &&
        _value.lastOrNull!.children!.isNotEmpty) {
      while (_value.lastOrNull?.children != null &&
          _value.lastOrNull!.children!.isNotEmpty) {
        _columns.add(_value.lastOrNull!.children!);
        _value.add(_value.lastOrNull!.children!.firstOrNull);
      }
    }
    widget.onChange?.call(_value);
  }

  void handleColumnSelectedChange(AntPickerOption? option, int columnIndex) {
    _value[columnIndex] = option;
    widget.onChange?.call(_value);
    if (option != null) {
      if (widget.cascade) {
        setState(() {
          _value = _value.take(columnIndex + 1).toList();
          _columns = _columns.take(columnIndex + 1).toList();
          while (_value.lastOrNull?.children != null &&
              _value.lastOrNull!.children!.isNotEmpty) {
            _columns.add(_value.lastOrNull!.children!);
            _value.add(_value.lastOrNull!.children!.firstOrNull);
          }
        });
      }
    }
  }

  @override
  void initState() {
    handleInitialValue();
    super.initState();
  }

  @override
  void didUpdateWidget(AntPickerViewMultiColumns oldWidget) {
    if (!listEquals(oldWidget.columns, widget.columns)) {
      handleInitialValue();
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
                        handleColumnSelectedChange(option, columnIndex);
                      },
                      onSelectedItemChanged: (option) {
                        widget.onSelectedItemChanged?.call(option, columnIndex);
                      },
                      value: _value.elementAtOrNull(columnIndex),
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

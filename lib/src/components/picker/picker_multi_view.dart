import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view_multi_columns.dart';

import '../theme/theme.dart';

class AntPickerMultiView extends StatefulWidget {
  const AntPickerMultiView({
    super.key,
    this.columns,
    this.onOk,
    this.onCancel,
    this.value,
    this.title,
    this.titleText,
    this.itemHeight = 34,
    this.onSelectedItemChanged,
    this.onColumnSelectedChanged,
    this.onChange,
  });

  final Widget? title;
  final String? titleText;
  final List<List<AntPickerOption>>? columns;
  final List<String?>? value;
  final Function? onCancel;
  final ValueChanged<List<AntPickerOption?>>? onOk;
  final double? itemHeight;
  final void Function(AntPickerOption? value, int index)? onSelectedItemChanged;
  final void Function(AntPickerOption? value, int index)?
  onColumnSelectedChanged;
  final void Function(List<AntPickerOption?>? value)? onChange;

  @override
  State<StatefulWidget> createState() => _AntPickerMultiViewState();
}

class _AntPickerMultiViewState extends State<AntPickerMultiView>
    with MaterialStateMixin {
  // double viewHeight = 0;
  List<AntPickerOption?> _value = [];

  @override
  void initState() {
    _value = List.filled(widget.columns?.length ?? 0, null);
    if (widget.value != null && widget.value!.isNotEmpty) {
      for (int i = 0; i < (widget.columns?.length ?? 0); i++) {
        if (i < widget.value!.length && widget.value?[i] != null) {
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
    super.initState();
  }

  @override
  void didUpdateWidget(AntPickerMultiView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("取消"),
                ),
                onTap: () {
                  widget.onCancel?.call();
                },
              ),
              if (widget.title != null || widget.titleText != null)
                Expanded(
                  child: Center(
                    child: widget.title ?? Text(widget.titleText ?? ""),
                  ),
                ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "确定",
                    style: TextStyle(color: theme.colorPrimary),
                  ),
                ),
                onTap: () {
                  widget.onOk?.call(_value);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // viewHeight = constraints.maxHeight;
              return AntPickerViewMultiColumns(
                columns: widget.columns,
                itemHeight: widget.itemHeight,
                value: _value.map((e) => e?.value).toList(),
                onSelectedItemChanged: (value, index) {
                  _value[index] = value;
                  widget.onSelectedItemChanged?.call(value, index);
                },
                onChange: (value, index) {
                  _value[index] = value;
                  widget.onColumnSelectedChanged?.call(value, index);
                  widget.onChange?.call(_value);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

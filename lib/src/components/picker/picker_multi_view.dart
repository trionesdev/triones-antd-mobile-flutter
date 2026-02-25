import 'package:flutter/foundation.dart';
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
  final Function(AntPickerOption? value, int index)? onSelectedItemChanged;
  final Function(AntPickerOption? value, int index)? onColumnSelectedChanged;
  final Function(List<AntPickerOption?>? value)? onChange;

  @override
  State<StatefulWidget> createState() => _AntPickerMultiViewState();
}

class _AntPickerMultiViewState extends State<AntPickerMultiView>
    with MaterialStateMixin {
  // double viewHeight = 0;
  bool _cascade = false;
  List<AntPickerOption?> _value = [];

  @override
  void initState() {
    _cascade = (widget.columns != null && widget.columns!.length == 1);
    super.initState();
  }

  @override
  void didUpdateWidget(AntPickerMultiView oldWidget) {
    if (listEquals(widget.columns, oldWidget.columns)) {
      _cascade = (widget.columns != null && widget.columns!.length == 1);
    }
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
              return AntPickerViewMultiColumns(
                cascade: _cascade,
                columns: widget.columns,
                itemHeight: widget.itemHeight,
                value: widget.value,
                onSelectedItemChanged: widget.onSelectedItemChanged,
                onColumnSelectedChanged: widget.onColumnSelectedChanged,
                onChange: (value) {
                  widget.onChange?.call(value);
                  _value = value;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

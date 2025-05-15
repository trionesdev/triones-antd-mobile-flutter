import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view_multi_columns.dart';

import '../theme/theme.dart';

class AntPickerMultiView extends StatefulWidget {
  const AntPickerMultiView(
      {super.key,
        this.columns,
        this.onOk,
        this.onCancel,
        this.value,
        this.title,
        this.itemHeight = 34,
        this.onColumnSelected});

  final Widget? title;
  final List<List<AntPickerOption>>? columns;
  final List<String>? value;
  final Function? onCancel;
  final ValueChanged<List<AntPickerOption?>>? onOk;
  final double? itemHeight;
  final void Function(AntPickerOption? value, int index)? onColumnSelected;

  @override
  State<StatefulWidget> createState() => _AntPickerMultiViewState();
}

class _AntPickerMultiViewState extends State<AntPickerMultiView>
    with MaterialStateMixin {
  // double viewHeight = 0;
  List<AntPickerOption?> _value = [];

  @override
  void initState() {
    super.initState();
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
      print(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    AntThemeData theme = AntTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
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
                child: Text("确定", style: TextStyle(color: theme.colorPrimary)),
              ),
              onTap: () {
                widget.onOk?.call(_value);
              },
            ),
          ]),
        ),
        Expanded(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // viewHeight = constraints.maxHeight;
              return AntPickerViewMultiColumns(
                columns: widget.columns,
                itemHeight: widget.itemHeight,
                value: widget.value,
                onColumnSelected: (value, index) {
                  widget.onColumnSelected?.call(value, index);
                },
              );
            }))
      ],
    );
  }
}
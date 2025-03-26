import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view_column.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/types.dart';
import '../theme/theme.dart';


class AntPickerView extends StatefulWidget {
  const AntPickerView(
      {super.key,
      this.options,
      this.onOk,
      this.onCancel,
      this.value,
      this.title,
      this.itemHeight = 34});

  final Widget? title;
  final List<PickerOption>? options;
  final List<String>? value;
  final Function? onCancel;
  final ValueChanged<List<PickerOption?>>? onOk;
  final double? itemHeight;

  @override
  State<StatefulWidget> createState() => _AntPickerViewState();
}

class _AntPickerViewState extends State<AntPickerView> with MaterialStateMixin {
  double viewHeight = 0;
  PickerOption? _value = null;

  @override
  void initState() {
    super.initState();
    setState(() {

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
                  style: TextStyle(color: theme.colorPrimary),
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
          viewHeight = constraints.maxHeight;
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                    child: AntPickerViewColumn(
                      itemHeight: widget.itemHeight,
                      options: widget.options,
                      onSelected: (option) {
                        setState(() {
                          _value = option;
                        });
                      },
                      value: _getOptionByValue(columnIndex),
                    )),
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


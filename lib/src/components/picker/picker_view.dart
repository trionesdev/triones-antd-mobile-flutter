import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view_column.dart';
import '../theme/theme.dart';

class AntPickerView extends StatefulWidget {
  const AntPickerView({super.key,
    this.options,
    this.onOk,
    this.onCancel,
    this.value,
    this.title,
    this.itemHeight = 34});

  final Widget? title;
  final List<AntPickerOption>? options;
  final String? value;
  final Function? onCancel;
  final ValueChanged<AntPickerOption?>? onOk;
  final double? itemHeight;

  @override
  State<StatefulWidget> createState() => _AntPickerViewState();
}

class _AntPickerViewState extends State<AntPickerView> with MaterialStateMixin {
  double viewHeight = 0;
  AntPickerOption? _value = null;
  List<AntPickerOption>? _options;

  AntPickerOption? _getOptionByValue() {
    if (widget.options != null && widget.value != null) {
      return widget.options?.firstWhere((option) {
        return option.value == widget.value;
      });
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _options = widget.options ?? [];
      if (widget.value == null && _options!=null && _options!.isNotEmpty) {
        _value = _options?[0];
      }
    });
  }

  @override
  void didUpdateWidget(covariant AntPickerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!ListEquality().equals(oldWidget.options, widget.options)) {
      setState(() {
        _options = widget.options ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // GestureDetector(
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 16),
            //     child: Text("取消"),
            //   ),
            //   onTap: () {
            //     widget.onCancel?.call();
            //   },
            // ),
            AntButton(
              type: AntButtonType.text,
              text: "取消",
              onPressed: () {
                widget.onCancel?.call();
              },
            ),
            if (widget.title != null)
              Expanded(
                  child: Center(
                    child: widget.title!,
                  )),
            // GestureDetector(
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 16),
            //     child: Text(
            //         "确定", style: TextStyle(color: theme.colorPrimary)),
            //   ),
            //   onTap: () {
            //     widget.onOk?.call(_value);
            //   },
            // ),
            AntButton(
              type: AntButtonType.text,
              text: "确定",
              style: StateStyle(style: Style(color: theme.colorPrimary)),
              onPressed: () {
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: AntPickerViewColumn(
                      itemHeight: widget.itemHeight,
                      options: _options,
                      onSelected: (option) {
                        setState(() {
                          _value = option;
                        });
                      },
                      value: _getOptionByValue(),
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                            // color: Colors.grey
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5),
                                  bottom:
                                  BorderSide(color: Colors.grey, width: 0.5))),
                        ),
                        Expanded(
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
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

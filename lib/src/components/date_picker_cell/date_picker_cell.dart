import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntDatePickerCell extends StatefulWidget {
  const AntDatePickerCell({
    super.key,
    this.placeholder,
    this.placeholderText,
    this.label,
    this.labelText,
    this.labelCol,
    this.labelAlign = AntLabelAlign.left,
    this.wrapperAlign = AntAlign.right,
    this.format,
    this.title,
    this.titleText,
    this.mode = AntDatePickerMode.date,
    this.showTime = false,
    this.timeFormat,
    this.value,
    this.onCancel,
    this.minDate,
    this.maxDate,
  });

  /// @description 占位符
  /// @default null
  final Text? placeholder;

  /// @description 占位符文本
  /// @default null
  final String? placeholderText;

  /// @description 标签
  /// @default null
  final Widget? label;

  /// @description 标签文本
  /// @default null
  final String? labelText;

  /// @description 标签列
  /// @default null
  final AntCol? labelCol;

  /// @description 标签对齐方式
  /// @default AntLabelAlign.left
  final AntLabelAlign? labelAlign;

  /// @description 内容对齐方式
  /// @default AntAlign.right
  final AntAlign? wrapperAlign;

  /// @description 模态框标题
  /// @default null
  final Widget? title;

  /// @description 模态框标题文本
  /// @default null
  final String? titleText;

  /// @description 模式
  /// @default AntDatePickerMode.date
  final AntDatePickerMode mode;

  /// @description 格式
  /// @default null
  final String? format;

  /// @description 是否显示时间
  /// @default false
  final bool showTime;

  /// @description 时间格式，仅在mode为AntDatePickerMode.date，showTime=ture,或者mode为AntDatePickerMode.time时有效
  /// @default null
  final String? timeFormat;

  /// @description 值
  /// @default null
  final DateTime? value;

  /// @description 取消回调
  /// @default null
  final Function? onCancel;

  /// @description 最小日期，有效到日期单位
  /// @default null
  final DateTime? minDate;

  /// @description 最大日期，有效到日期单位
  /// @default null
  final DateTime? maxDate;

  @override
  State<StatefulWidget> createState() => _AntDatePickerCellState();
}

class _AntDatePickerCellState extends State<AntDatePickerCell> {
  DateTime? _value;

  Widget? get content {
    if (_value != null) {
      if (widget.format != null) {
        return Text(DateFormat(widget.format).format(_value!));
      }
      if (widget.mode == AntDatePickerMode.date) {
        if (widget.showTime) {
          return Text(DateFormat("yyyy-MM-dd HH:mm:ss").format(_value!));
        }
        return Text(DateFormat("yyyy-MM-dd").format(_value!));
      } else if (widget.mode == AntDatePickerMode.time) {
        return Text(DateFormat("HH:mm:ss").format(_value!));
      }
      return Text(DateFormat("yyyy-MM-dd").format(_value!));
    }
    return null;
  }

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(AntDatePickerCell oldWidget) {
    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AntCell(
      placeholder: widget.placeholder,
      placeholderText: widget.placeholderText,
      label: widget.label,
      labelText: widget.labelText,
      wrapperAlign: widget.wrapperAlign,
      child: content,
      onTap: () {
        showAntDatePicker(
          context: context,
          mode: widget.mode,
          showTime: widget.showTime,
          timeFormat: widget.timeFormat,
          value: _value,
          minDate: widget.minDate,
          maxDate: widget.maxDate,
          onOk: (DateTime? value) {
            setState(() {
              _value = value;
            });
          },
        );
      },
    );
  }
}

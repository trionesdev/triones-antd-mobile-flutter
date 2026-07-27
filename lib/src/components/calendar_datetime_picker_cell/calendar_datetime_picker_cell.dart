import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntCalendarDateTimePickerCell extends StatefulWidget {
  const AntCalendarDateTimePickerCell({
    super.key,
    this.placeholder,
    this.placeholderText,
    this.label,
    this.labelText,
    this.labelCol,
    this.labelAlign,
    this.contentAlign = AntAlign.right,
    this.title,
    this.titleText,
    this.value,
    this.format,
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
  final AntAlign? contentAlign;

  /// @description 模态框标题
  /// @default null
  final Widget? title;

  /// @description 模态框标题文本
  /// @default null
  final String? titleText;

  /// @description 值
  /// @default null
  final DateTime? value;

  /// @description 格式
  /// @default null
  final String? format;

  @override
  State<StatefulWidget> createState() => _AntCalendarDateTimePickerCellState();
}

class _AntCalendarDateTimePickerCellState
    extends State<AntCalendarDateTimePickerCell> {
  DateTime? _value;

  Widget? get content {
    if (_value != null) {
      if (widget.format != null) {
        return Text(DateFormat(widget.format).format(_value!));
      }
      return Text(DateFormat("yyyy-MM-dd HH:mm:ss").format(_value!));
    }
    return null;
  }

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(AntCalendarDateTimePickerCell oldWidget) {
    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AntCell(
      placeholder: widget.placeholder,
      placeholderText: widget.placeholderText,
      label: widget.label,
      labelText: widget.labelText,
      labelCol: widget.labelCol,
      labelAlign: widget.labelAlign,
      contentAlign: widget.contentAlign,
      child: content,
      onTap: () {
        showAntCalendarDatetimePicker(
          context: context,
          value: _value,
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

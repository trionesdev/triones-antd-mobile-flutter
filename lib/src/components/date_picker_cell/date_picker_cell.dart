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

  final Text? placeholder;
  final String? placeholderText;
  final Widget? label;
  final String? labelText;
  final AntCol? labelCol;
  final AntLabelAlign? labelAlign;
  final AntAlign? wrapperAlign;
  final Widget? title;
  final String? titleText;
  final AntDatePickerMode mode;
  final String? format;
  final bool showTime;
  final String? timeFormat;
  final DateTime? value;
  final Function? onCancel;

  final DateTime? minDate;
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

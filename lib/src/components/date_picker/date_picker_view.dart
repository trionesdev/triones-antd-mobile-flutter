import 'package:flutter/material.dart';

enum AntDatePickerMode { date, time }

class AntDatePickerView extends StatefulWidget {
  const AntDatePickerView({
    super.key,
    this.mode = AntDatePickerMode.date,
    this.minDate,
    this.maxDate,
    this.title,
    this.titleText,
    this.value,
    this.onOk,
  });

  final Widget? title;
  final String? titleText;
  final AntDatePickerMode mode;
  final DateTime? value;
  final ValueChanged<DateTime?>? onOk;

  final DateTime? minDate;
  final DateTime? maxDate;

  @override
  State<StatefulWidget> createState() => _AntDatePickerViewState();
}

class _AntDatePickerViewState extends State<AntDatePickerView> {
  List<List<int>>? _columns = [];
  List<int> hours = List.generate(24, (index) => index);
  List<int> minutes = List.generate(60, (index) => index);
  List<int> seconds = List.generate(60, (index) => index);

  List<int> get years {
    List<int> years = [];
    if (widget.minDate != null) {
      years.add(widget.minDate!.year);
    }
    if (widget.maxDate != null) {
      years.add(widget.maxDate!.year);
    }
    return years;
  }

  List<int> get months {
    List<int> months = [];
    if (widget.minDate != null) {
      months.add(widget.minDate!.month);
    }
    if (widget.maxDate != null) {
      months.add(widget.maxDate!.month);
    }
    return months;
  }

  List<int> get days {
    List<int> days = [];
    if (widget.minDate != null) {
      days.add(widget.minDate!.day);
    }
    if (widget.maxDate != null) {
      days.add(widget.maxDate!.day);
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

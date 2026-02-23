import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/src/components/util/utils.dart';
import '../picker/index.dart';
import '../picker/picker_multi_view.dart';

enum AntDatePickerMode { date, time }

class InternalValueType {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;

  const InternalValueType({
    this.year = 0,
    this.month = 0,
    this.day = 0,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
  });
}

class AntDatePickerView extends StatefulWidget {
  const AntDatePickerView({
    super.key,
    this.mode = AntDatePickerMode.date,
    this.format,
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
  final String? format;
  final DateTime? value;
  final ValueChanged<DateTime?>? onOk;

  final DateTime? minDate;
  final DateTime? maxDate;

  @override
  State<StatefulWidget> createState() => _AntDatePickerViewState();
}

class _AntDatePickerViewState extends State<AntDatePickerView> {
  String _cleanFormat = '';
  InternalValueType _internalValue = const InternalValueType();
  List<String?> _pickerValue = [];
  List<List<AntPickerOption>>? _columns = [];
  List<AntPickerOption> hours = List.generate(
    24,
    (index) => AntPickerOption(
      value: index.toString(),
      label: DatetimeUtils.twoDigits(index),
    ),
  );
  List<AntPickerOption> minutes = List.generate(
    60,
    (index) => AntPickerOption(
      value: index.toString(),
      label: DatetimeUtils.twoDigits(index),
    ),
  );
  List<AntPickerOption> seconds = List.generate(
    60,
    (index) => AntPickerOption(
      value: index.toString(),
      label: DatetimeUtils.twoDigits(index),
    ),
  );

  List<int> get years {
    if (widget.minDate != null && widget.maxDate != null) {
      return List.generate(
        widget.maxDate!.month - widget.minDate!.month + 1,
        (index) => widget.minDate!.month + index,
      );
    }
    if (widget.minDate != null) {
      int startYear = widget.minDate!.year;
      return List.generate(
        DateTime.now().year - startYear,
        (index) => startYear + index,
      );
    }
    if (widget.maxDate != null) {
      return List.generate(widget.maxDate!.month - 1, (index) => index + 1);
    }
    int startYear = DateTime.now().year + 30 - 100;
    return List.generate(100, (index) => startYear + index);
  }

  List<int> get months {
    int startMonth = 1;
    int endMonth = 12;
    return List.generate(
      endMonth - startMonth + 1,
      (index) => startMonth + index,
    );
  }

  List<int> get days {
    int startDay = 1;
    int endDay = 31;
    return List.generate(endDay - startDay, (index) => startDay + index);
  }

  @override
  void initState() {
    _cleanFormat =
        widget.format ??
        (widget.mode == AntDatePickerMode.date ? 'yyyy-MM-dd' : 'HH:mm:ss');
    DateTime now = DateTime.now();
    _internalValue = InternalValueType(
      year: widget.value?.year ?? now.year,
      month: widget.value?.month ?? now.month,
      day: widget.value?.day ?? now.day,
      hour: widget.value?.hour ?? now.hour,
      minute: widget.value?.minute ?? now.minute,
      second: widget.value?.second ?? now.second,
    );
    _columns = [
      years
          .map((e) => AntPickerOption(value: e.toString(), label: e.toString()))
          .toList(),
      months
          .map((e) => AntPickerOption(value: e.toString(), label: e.toString()))
          .toList(),
      days
          .map((e) => AntPickerOption(value: e.toString(), label: e.toString()))
          .toList(),
      hours,
      minutes,
      seconds,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AntPickerMultiView(columns: _columns,value: ["2026","1"],onOk: (value) {
      print(value);
    },);
  }
}

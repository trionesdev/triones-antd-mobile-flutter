import 'package:flutter/material.dart';
import '../picker/index.dart';
import '../picker/picker_multi_view.dart';

enum AntDatePickerMode { date, time }

class DateValue {
  late int year;
  late int month;
  late int day;
  late int hour;
  late int minute;
  late int second;

  static DateValue newDate({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
  }) {
    DateTime now = DateTime.now();
    DateValue dateValue = DateValue();
    dateValue.year = year ?? now.year;
    dateValue.month = month ?? now.month;
    dateValue.day = day ?? now.day;
    dateValue.hour = hour ?? now.hour;
    dateValue.minute = minute ?? now.minute;
    dateValue.second = second ?? now.second;
    return dateValue;
  }

  static DateValue clone(DateValue v) {
    return DateValue.newDate(
      year: v.year,
      month: v.month,
      day: v.day,
      hour: v.hour,
      minute: v.minute,
      second: v.second,
    );
  }

  DateTime toDateTime() {
    return DateTime(year, month, day, hour, minute, second);
  }
}

class AntDatePickerView extends StatefulWidget {
  const AntDatePickerView({
    super.key,
    this.mode = AntDatePickerMode.date,
    this.format,
    this.showTime = false,
    this.timeFormat,
    this.minDate,
    this.maxDate,
    this.title,
    this.titleText,
    this.value,
    this.onOk,
    this.onCancel,
  });

  final Widget? title;
  final String? titleText;
  final AntDatePickerMode mode;
  final String? format;
  final bool showTime;
  final String? timeFormat;
  final DateTime? value;
  final ValueChanged<DateTime?>? onOk;
  final Function? onCancel;

  final DateTime? minDate;
  final DateTime? maxDate;

  @override
  State<StatefulWidget> createState() => _AntDatePickerViewState();
}

class _AntDatePickerViewState extends State<AntDatePickerView> {
  String _cleanTimeFormat = '';

  bool get hasHour => _cleanTimeFormat.contains('H');

  bool get hasMinute => _cleanTimeFormat.contains('m');

  bool get hasSecond => _cleanTimeFormat.contains('s');

  DateValue _internalValue = DateValue.newDate();
  List<String?> _pickerValue = [];
  List<List<AntPickerOption>>? _columns = [];
  List<int> _years = [];
  List<int> _months = [];
  List<int> _days = [];
  final List<int> _hours = List.generate(24, (index) => index);
  final List<int> _minutes = List.generate(60, (index) => index);
  final List<int> _seconds = List.generate(60, (index) => index);

  List<int> generateYears() {
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

  List<int> generateMonths() {
    int startMonth = 1;
    int endMonth = 12;
    return List.generate(
      endMonth - startMonth + 1,
      (index) => startMonth + index,
    );
  }

  List<int> generateDays({int? year, int? month}) {
    int startDay = 1;
    int endDay =
        DateTime(
          year ?? _internalValue.year,
          (month ?? _internalValue.month) + 1,
          0,
        ).day;
    return List.generate(endDay - startDay + 1, (index) => startDay + index);
  }

  List<AntPickerOption> get yearOptions {
    return _years
        .map((i) => AntPickerOption(value: i.toString(), label: '$i年'))
        .toList();
  }

  List<AntPickerOption> get monthOptions {
    return _months
        .map((i) => AntPickerOption(value: i.toString(), label: '$i月'))
        .toList();
  }

  List<AntPickerOption> get dayOptions {
    return _days
        .map((i) => AntPickerOption(value: i.toString(), label: '$i日'))
        .toList();
  }

  List<AntPickerOption> get hourOptions {
    return _hours
        .map((i) => AntPickerOption(value: i.toString(), label: '$i时'))
        .toList();
  }

  List<AntPickerOption> get minuteOptions {
    return _minutes
        .map((i) => AntPickerOption(value: i.toString(), label: '$i分'))
        .toList();
  }

  List<AntPickerOption> get secondOptions {
    return _seconds
        .map((i) => AntPickerOption(value: i.toString(), label: '$i秒'))
        .toList();
  }

  List<List<AntPickerOption>> generateColumns() {
    List<List<AntPickerOption>> columns = [];

    if (widget.mode == AntDatePickerMode.date) {
      columns = [yearOptions, monthOptions, dayOptions];
      if (widget.showTime) {
        if (_cleanTimeFormat.isNotEmpty) {
          if (hasHour) {
            columns.add(hourOptions);
          }
          if (hasMinute) {
            columns.add(minuteOptions);
          }
          if (hasSecond) {
            columns.add(secondOptions);
          }
        } else {
          columns.add(hourOptions);
          columns.add(minuteOptions);
          columns.add(secondOptions);
        }
      }
    } else if (widget.mode == AntDatePickerMode.time) {
      if (_cleanTimeFormat.isNotEmpty) {
        if (hasHour) {
          columns.add(hourOptions);
        }
        if (hasMinute) {
          columns.add(minuteOptions);
        }
        if (hasSecond) {
          columns.add(secondOptions);
        }
      } else {
        columns.add(hourOptions);
        columns.add(minuteOptions);
        columns.add(secondOptions);
      }
    }
    return columns;
  }

  List<String?> generatePickerValue() {
    List<String?> pickerValue = [];
    if (widget.mode == AntDatePickerMode.date) {
      pickerValue = [
        _internalValue.year.toString(),
        _internalValue.month.toString(),
        _internalValue.day.toString(),
      ];
      if (widget.showTime) {
        if (_cleanTimeFormat.isNotEmpty) {
          if (hasHour) {
            pickerValue.add(_internalValue.hour.toString());
          }
          if (hasMinute) {
            pickerValue.add(_internalValue.minute.toString());
          }
          if (hasSecond) {
            pickerValue.add(_internalValue.second.toString());
          }
        } else {
          pickerValue.add(_internalValue.hour.toString());
          pickerValue.add(_internalValue.minute.toString());
          pickerValue.add(_internalValue.second.toString());
        }
      }
    } else if (widget.mode == AntDatePickerMode.time) {
      if (_cleanTimeFormat.isNotEmpty) {
        if (hasHour) {
          pickerValue.add(_internalValue.hour.toString());
        }
        if (hasMinute) {
          pickerValue.add(_internalValue.minute.toString());
        }
        if (hasSecond) {
          pickerValue.add(_internalValue.second.toString());
        }
      } else {
        pickerValue.add(_internalValue.hour.toString());
        pickerValue.add(_internalValue.minute.toString());
        pickerValue.add(_internalValue.second.toString());
      }
    }
    return pickerValue;
  }

  void reRenderColumns(DateValue newDate) {
    if (newDate.year != _internalValue.year) {
      _years = generateYears();
      _months = generateMonths();
    }
    if (newDate.month != _internalValue.month) {
      _days = generateDays(year: newDate.year, month: newDate.month);
    }
    setState(() {
      _columns = generateColumns();
    });
  }

  DateValue updateInternalValue(List<AntPickerOption?>? value) {
    DateValue internalValueType = DateValue.clone(_internalValue);
    if (widget.mode == AntDatePickerMode.date) {
      if (value?[0]?.value != null) {
        internalValueType.year = int.parse(value![0]!.value!);
      }
      if (value?[1]?.value != null) {
        internalValueType.month = int.parse(value![1]!.value!);
      }
      if (value?[2]?.value != null) {
        internalValueType.day = int.parse(value![2]!.value!);
      }
      if (widget.showTime) {
        if (_cleanTimeFormat.isNotEmpty) {
          if (hasHour) {
            if (value?[3]?.value != null) {
              internalValueType.hour = int.parse(value![3]!.value!);
            }
          }
          if (hasMinute) {
            if (value?[4]?.value != null) {
              internalValueType.minute = int.parse(value![4]!.value!);
            }
          }
          if (hasSecond) {
            if (value?[5]?.value != null) {
              internalValueType.second = int.parse(value![5]!.value!);
            }
          }
        } else {
          if (value?[3]?.value != null) {
            internalValueType.hour = int.parse(value![3]!.value!);
          }
          if (value?[4]?.value != null) {
            internalValueType.minute = int.parse(value![4]!.value!);
          }
          if (value?[5]?.value != null) {
            internalValueType.second = int.parse(value![5]!.value!);
          }
        }
      }
    }
    return internalValueType;
  }

  @override
  void initState() {
    _cleanTimeFormat = widget.timeFormat ?? 'HH:mm:ss';
    DateTime now = DateTime.now();
    _internalValue = DateValue.newDate(
      year: widget.value?.year ?? now.year,
      month: widget.value?.month ?? now.month,
      day: widget.value?.day ?? now.day,
      hour: widget.value?.hour ?? now.hour,
      minute: widget.value?.minute ?? now.minute,
      second: widget.value?.second ?? now.second,
    );
    _pickerValue = generatePickerValue();
    _years = generateYears();
    _months = generateMonths();
    _days = generateDays();
    _columns = generateColumns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AntPickerMultiView(
      title: widget.title,
      titleText: widget.titleText,
      columns: _columns,
      value: _pickerValue,
      onChange: (value) {
        DateValue internalValue = updateInternalValue(value);
        reRenderColumns(internalValue);
        // ss(internalValue);
        _internalValue = internalValue;
      },
      onColumnSelected: (index, value) {},
      onOk: (value) {
        widget.onOk?.call(_internalValue.toDateTime());
      },
      onCancel: () {
        widget.onCancel?.call();
      },
    );
  }
}

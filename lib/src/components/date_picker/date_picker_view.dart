import 'package:flutter/foundation.dart';
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
    dateValue.hour = hour ?? 0;
    dateValue.minute = minute ?? 0;
    dateValue.second = second ?? 0;
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

  /// @description 标题Widget
  /// @default null
  final Widget? title;

  /// @description 标题文字
  /// @default null
  final String? titleText;

  /// @description 显示模式
  /// @default AntDatePickerMode.date
  final AntDatePickerMode mode;

  /// @description 显示时间, 仅在mode为AntDatePickerMode.date时有效
  /// @default false
  final bool showTime;

  /// @description 时间格式
  /// @default null
  final String? timeFormat;

  /// @description 默认值
  /// @default null
  final DateTime? value;

  /// @description 最小日期
  /// @default null
  final DateTime? minDate;

  /// @description 最大日期
  /// @default null
  final DateTime? maxDate;

  /// @description 点击确定按钮回调
  /// @default null
  final ValueChanged<DateTime?>? onOk;

  /// @description 点击取消按钮回调
  /// @default null
  final Function? onCancel;

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
    DateTime now = DateTime.now();
    int startYear = now.year - 50;
    int endYear = now.year + 50;
    if (widget.minDate != null && widget.maxDate != null) {
      startYear = widget.minDate!.year;
      endYear = widget.maxDate!.year;
    }
    if (widget.minDate != null) {
      startYear = widget.minDate!.year;
    }
    if (widget.maxDate != null) {
      endYear = widget.maxDate!.year;
    }
    return List.generate(endYear - startYear + 1, (index) => startYear + index);
  }

  List<int> generateMonths() {
    int startMonth = 1;
    int endMonth = 12;
    if (widget.minDate != null && widget.minDate!.year == _internalValue.year) {
      startMonth = widget.minDate!.month;
    }
    if (widget.maxDate != null && widget.maxDate!.year == _internalValue.year) {
      endMonth = widget.maxDate!.month;
    }
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
    if (widget.minDate != null &&
        widget.minDate!.year == _internalValue.year &&
        widget.minDate!.month == _internalValue.month) {
      startDay = widget.minDate!.day;
    }
    if (widget.maxDate != null &&
        widget.maxDate!.year == _internalValue.year &&
        widget.maxDate!.month == _internalValue.month) {
      endDay = widget.maxDate!.day;
    }
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

  // 更新列数据,如果新的数据列与之前一致，则不重新渲染
  void reRenderColumns(DateValue newDate) {
    List<int> currentMonths = List.from(_months);
    List<int> currentDays = List.from(_days);
    if (newDate.year != _internalValue.year) {
      currentMonths = generateMonths();
    }
    if (newDate.month != _internalValue.month) {
      currentDays = generateDays(year: newDate.year, month: newDate.month);
    }
    if (listEquals(currentMonths, _months) && listEquals(currentDays, _days)) {
      return;
    }
    _months = currentMonths;
    _days = currentDays;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _columns = generateColumns();
      });
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
    } else if (widget.mode == AntDatePickerMode.time) {
      if (_cleanTimeFormat.isNotEmpty) {
        if (hasHour) {
          if (value?[0]?.value != null) {
            internalValueType.hour = int.parse(value![0]!.value!);
          }
        }
        if (hasMinute) {
          if (value?[1]?.value != null) {
            internalValueType.minute = int.parse(value![1]!.value!);
          }
        }
        if (hasSecond) {
          if (value?[2]?.value != null) {
            internalValueType.second = int.parse(value![2]!.value!);
          }
        }
      } else {
        if (value?[1]?.value != null) {
          internalValueType.hour = int.parse(value![1]!.value!);
        }
        if (value?[2]?.value != null) {
          internalValueType.minute = int.parse(value![2]!.value!);
        }
        if (value?[3]?.value != null) {
          internalValueType.second = int.parse(value![3]!.value!);
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
      hour: widget.value?.hour ?? 0,
      minute: widget.value?.minute ?? 0,
      second: widget.value?.second ?? 0,
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
        _internalValue = internalValue;
      },
      onColumnSelected: (index, value) {},
      onOk: (value) {
        DateValue internalValue = updateInternalValue(value);
        widget.onOk?.call(internalValue.toDateTime());
      },
      onCancel: () {
        widget.onCancel?.call();
      },
    );
  }
}

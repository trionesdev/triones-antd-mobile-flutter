import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntCalendarPicker {
  static Future<T?> show<T>({
    required BuildContext context,
    DateTime? value,
    ValueChanged<DateTime?>? onOk,
  }) {
    return showAntCalendarPicker(context: context, value: value, onOk: onOk);
  }
}

class AntCalendarRangePicker {
  static Future<T?> show<T>({
    required BuildContext context,
    List<DateTime>? value,
    ValueChanged<List<DateTime?>?>? onOk,
  }) {
    return showAntCalendarRangePicker(
      context: context,
      value: value,
      onOk: onOk,
    );
  }
}

///  显示日历选择器
Future<T?> showAntCalendarPicker<T>({
  required BuildContext context,
  DateTime? value,
  ValueChanged<DateTime?>? onOk,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return AntCalendarPickerView(
        value: value,
        onOk: (date) {
          Navigator.of(context).pop();
          onOk?.call(date);
        },
      );
    },
  );
}

///  显示日历区间选择器
Future<T?> showAntCalendarRangePicker<T>({
  required BuildContext context,
  List<DateTime>? value,
  ValueChanged<List<DateTime?>?>? onOk,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return AntCalendarRangePickerView(
        value: value,
        onOk: (date) {
          Navigator.of(context).pop();
          onOk?.call(date);
        },
      );
    },
  );
}

import 'package:flutter/widgets.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntCalendarPicker {
  static Future<T?> show<T>({
    required BuildContext context,
    DateTime? value,
    ValueChanged<DateTime?>? onOk,
  }) {
    return AntPopup.show(
      context: context,
      maxHeight: 1000,
      child: AntCalendarPickerView(
        value: value,
        onOk: (date) {
          Navigator.of(context).pop();
          onOk?.call(date);
        },
      ),
    );
  }
}

class AntCalendarRangePicker {
  static Future<T?> show<T>({
    required BuildContext context,
    List<DateTime>? value,
    ValueChanged<List<DateTime?>?>? onOk,
  }) {
    return AntPopup.show(
      context: context,
      maxHeight: 1000,
      child: AntCalendarRangePickerView(
        value: value,
        onOk: (date) {
          Navigator.of(context).pop();
          onOk?.call(date);
        },
      )
    );
  }
}

///  显示日历选择器
Future<T?> showAntCalendarPicker<T>({
  required BuildContext context,
  DateTime? value,
  ValueChanged<DateTime?>? onOk,
}) {
  return showAntPopup(
    context: context,
    maxHeight: 1000,
    child: AntCalendarPickerView(
      value: value,
      onOk: (date) {
        Navigator.of(context).pop();
        onOk?.call(date);
      },
    ),
  );
}

///  显示日历区间选择器
Future<T?> showAntCalendarRangePicker<T>({
  required BuildContext context,
  List<DateTime>? value,
  ValueChanged<List<DateTime?>?>? onOk,
}) {
  return showAntPopup(
    context: context,
    maxHeight: 1000,
    child: AntCalendarRangePickerView(
      value: value,
      onOk: (date) {
        Navigator.of(context).pop();
        onOk?.call(date);
      },
    ),
  );
}

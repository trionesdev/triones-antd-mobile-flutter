import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../popup/popup.dart';
import 'CalendarDatetimePickerView.dart';

/// @component CalendarDatetimePicker 日历时间选择器
class AntCalendarDatetimePicker {
  static void show({
    /// @description 上下文
    required BuildContext context,

    /// @description 当前值
    /// @default DateTime.now()
    DateTime? value,

    /// @description 确定按钮回调
    /// @default null
    ValueChanged<DateTime?>? onOk,
  }) {
    showAntCalendarDatetimePicker(context: context, value: value, onOk: onOk);
  }
}

Future<T?> showAntCalendarDatetimePicker<T>({
  required BuildContext context,
  DateTime? value,
  ValueChanged<DateTime?>? onOk,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SafeArea(
        bottom: true,
        child: AntCalendarDatetimePickerView(
          value: value,
          onOk: (date) {
            Navigator.of(context).pop();
            onOk?.call(date);
          },
        ),
      );
    },
  );
}

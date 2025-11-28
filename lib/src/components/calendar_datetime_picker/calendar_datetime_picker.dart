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
    AntPopup.show(
      context: context,
      child: SafeArea(
        bottom: true,
        child: AntCalendarDatetimePickerView(
          value: value,
          onOk: (date) {
            Navigator.of(context).pop();
            onOk?.call(date);
          },
        ),
      ),
    );
  }
}

Future<T?> showAntCalendarDatetimePicker<T>({
  required BuildContext context,
  DateTime? value,
  ValueChanged<DateTime?>? onOk,
}) {
  return showAntPopup(
    context: context,
    child: AntCalendarDatetimePickerView(
      value: value,
      onOk: (date) {
        Navigator.of(context).pop();
        onOk?.call(date);
      },
    ),
  );
}

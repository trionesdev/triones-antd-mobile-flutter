import 'package:flutter/widgets.dart';

import '../popup/popup.dart';
import 'CalendarDatetimePickerView.dart';

class AntCalendarDatetimePicker {
  static void show({
    required BuildContext context,
    DateTime? value,
    ValueChanged<DateTime?>? onOk,
  }) {
    AntPopup.show(
        context: context,
        child: AntCalendarDatetimePickerView(
          value: value,
          onOk: (date) {
            Navigator.of(context).pop();
            onOk?.call(date);
          },
        ));
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
      ));
}

import 'package:flutter/material.dart';

import '../popup/popup.dart';
import 'date_picker_view.dart';

Future<T?> showAntDatePicker<T>({
  required BuildContext context,
  AntDatePickerMode mode = AntDatePickerMode.date,
  Widget? title,
  String? titleText,
  bool showTime = false,
  String? timeFormat,
  DateTime? value,
  ValueChanged<DateTime?>? onOk,
  DateTime? minDate,
  DateTime? maxDate,
}) {
  return showAntPopup(
    context: context,
    isScrollControlled: false,
    child: AntDatePickerView(
      mode: mode,
      title: title,
      titleText: titleText,
      showTime: showTime,
      timeFormat: timeFormat,
      value: value,
      minDate: minDate,
      maxDate: maxDate,
      onOk: (date) {
        Navigator.of(context).pop();
        onOk?.call(date);
      },
      onCancel: () {
        Navigator.of(context).pop();
      },
    ),
  );
}

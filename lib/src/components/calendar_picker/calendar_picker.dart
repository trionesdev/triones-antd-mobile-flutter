import 'package:flutter/widgets.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntCalendarPicker {
  static void show({
    required BuildContext context,
    DateTime? value,
    ValueChanged<DateTime?>? onOk,
  }) {
    AntPopup.show(
        context: context,
        maxHeight: 1000,

        child: AntCalendarPickerView(
          value: value,
          onOk: (date) {
            Navigator.of(context).pop();
            onOk?.call(date);
          },
        ));
  }
}

class AntCalendarRangePicker {
  static void show({
    required BuildContext context,
    List<DateTime>? value,
    ValueChanged<List<DateTime?>?>? onOk,
  }) {
    AntPopup.show(
        context: context,
        maxHeight: 1000,

        child: AntCalendarRangePickerView(
          value: value,
          onOk: (date) {
            Navigator.of(context).pop();
            onOk?.call(date);
          },
        ));
  }
}
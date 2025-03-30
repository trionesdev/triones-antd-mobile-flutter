import 'package:flutter/widgets.dart';

import '../../../antd.dart';
import 'calendar_picker_view.dart';

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

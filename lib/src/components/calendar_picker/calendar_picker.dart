import 'package:flutter/widgets.dart';

import '../../../antd.dart';
import 'calendar_picker_view.dart';

class AntCalendarPicker {
  static void show({
    required BuildContext context,
    double? minHeight,
    double? maxHeight,

  }) {
    AntPopup.show(
        context: context,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: AntCalendarPickerView(

        )
    );
  }
}
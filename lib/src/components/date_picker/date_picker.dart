import 'package:flutter/material.dart';

import '../popup/popup.dart';
import 'date_picker_view.dart';

class DatePicker {
  static Future<T?> showD<T>({
    required BuildContext context,

    /// @description 模式，默认AntDatePickerMode.date
    /// @default null
    AntDatePickerMode mode = AntDatePickerMode.date,

    /// @description 标题Widget
    /// @default null
    Widget? title,

    /// @description 标题文字
    /// @default null
    String? titleText,

    /// @description 是否显示时间，仅在mode为AntDatePickerMode.date时有效
    /// @default false
    bool showTime = false,

    /// @description 时间格式，仅在mode为AntDatePickerMode.date，showTime=ture,或者mode为AntDatePickerMode.time时有效
    /// @default null
    String? timeFormat,

    /// @description 默认值
    /// @default null
    DateTime? value,

    /// @description 点击确定按钮回调
    /// @default null
    ValueChanged<DateTime?>? onOk,

    /// @description 最小日期
    /// @default null
    DateTime? minDate,

    /// @description 最大日期
    /// @default null
    DateTime? maxDate,
  }) async {
    return showAntDatePicker<T>(
      context: context,
      mode: mode,
      title: title,
      titleText: titleText,
      showTime: showTime,
      timeFormat: timeFormat,
      value: value,
      onOk: onOk,
      minDate: minDate,
      maxDate: maxDate,
    );
  }
}

Future<T?> showAntDatePicker<T>({
  required BuildContext context,

  /// @description 模式，默认AntDatePickerMode.date
  /// @default null
  AntDatePickerMode mode = AntDatePickerMode.date,

  /// @description 标题Widget
  /// @default null
  Widget? title,

  /// @description 标题文字
  /// @default null
  String? titleText,

  /// @description 是否显示时间，仅在mode为AntDatePickerMode.date时有效
  /// @default false
  bool showTime = false,

  /// @description 时间格式，仅在mode为AntDatePickerMode.date，showTime=ture,或者mode为AntDatePickerMode.time时有效
  /// @default null
  String? timeFormat,

  /// @description 默认值
  /// @default null
  DateTime? value,

  /// @description 点击确定按钮回调
  /// @default null
  ValueChanged<DateTime?>? onOk,

  /// @description 最小日期
  /// @default null
  DateTime? minDate,

  /// @description 最大日期
  /// @default null
  DateTime? maxDate,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return SafeArea(
        bottom: true,
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
    },
  );
}

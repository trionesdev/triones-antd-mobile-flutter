import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_multi_view.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view.dart';

class AntPicker {
  static Future<T?> show<T>({
    required BuildContext context,
    double? minHeight,
    double? maxHeight,
    Widget? title,
    List<AntPickerOption>? options,
    String? value,
    ValueChanged<AntPickerOption?>? onOk,
    Function? onCancel,
    double? itemHeight = 34,
    bool isScrollControlled = false,
    bool round = true,
  }) {
    return showPicker(
      context: context,
      minHeight: minHeight,
      maxHeight: maxHeight,
      title: title,
      options: options,
      value: value,
      onOk: onOk,
      onCancel: onCancel,
      itemHeight: itemHeight,
      isScrollControlled: isScrollControlled,
      round: round,
    );
  }

  static Future<T?> showMulti<T>({
    required BuildContext context,
    double? minHeight,
    double? maxHeight,
    Widget? title,
    List<List<AntPickerOption>>? options,
    List<String>? value,
    ValueChanged<List<AntPickerOption?>>? onOk,
    Function? onCancel,
    Function(AntPickerOption? value, int index)? onSelectedItemChanged,
    Function(AntPickerOption? value, int index)? onColumnSelectedChanged,
    Function(List<AntPickerOption?>? value)? onChange,
    double? itemHeight = 34,
    bool isScrollControlled = false,
    bool round = true,
  }) {
    return showMultiPicker(
      context: context,
      minHeight: minHeight,
      maxHeight: maxHeight,
      title: title,
      options: options,
      value: value,
      onOk: onOk,
      onCancel: onCancel,
      onSelectedItemChanged: onSelectedItemChanged,
      onColumnSelectedChanged: onColumnSelectedChanged,
      onChange: onChange,
      itemHeight: itemHeight,
      isScrollControlled: isScrollControlled,
      round: round,
    );
  }
}

Future<T?> showPicker<T>({
  required BuildContext context,
  double? minHeight,
  double? maxHeight,
  Widget? title,
  List<AntPickerOption>? options,
  String? value,
  ValueChanged<AntPickerOption?>? onOk,
  Function? onCancel,
  double? itemHeight = 34,
  bool isScrollControlled = false,
  bool round = true,
}) {
  AntThemeData theme = AntTheme.of(context);
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    shape: RoundedRectangleBorder(
      borderRadius:
          (round
              ? BorderRadius.circular(theme.borderRadius)
              : BorderRadius.zero),
    ),
    builder: (context) {
      return AntPickerView(
        itemHeight: itemHeight,
        title: title,
        value: value,
        options: options,
        onOk: (value) {
          Navigator.of(context).pop();
          onOk?.call(value);
        },
        onCancel: () {
          Navigator.of(context).pop();
          onCancel?.call();
        },
      );
    },
  );
}

Future<T?> showMultiPicker<T>({
  required BuildContext context,
  double? minHeight,
  double? maxHeight,
  Widget? title,
  List<List<AntPickerOption>>? options,
  List<String>? value,
  ValueChanged<List<AntPickerOption?>>? onOk,
  Function? onCancel,
  Function(AntPickerOption? value, int index)? onSelectedItemChanged,
  Function(AntPickerOption? value, int index)? onColumnSelectedChanged,
  Function(List<AntPickerOption?>? value)? onChange,
  double? itemHeight = 34,
  bool isScrollControlled = false,
  bool round = true,
}) {
  AntThemeData theme = AntTheme.of(context);
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius:
          (round
              ? BorderRadius.circular(theme.borderRadius)
              : BorderRadius.zero),
    ),
    isScrollControlled: isScrollControlled,
    builder: (context) {
      return AntPickerMultiView(
        itemHeight: itemHeight,
        title: title,
        value: value,
        columns: options,
        onSelectedItemChanged: onSelectedItemChanged,
        onColumnSelectedChanged: onColumnSelectedChanged,
        onChange: onChange,
        onOk: (value) {
          Navigator.of(context).pop();
          onOk?.call(value);
        },
        onCancel: () {
          Navigator.of(context).pop();
          onCancel?.call();
        },
      );
    },
  );
}

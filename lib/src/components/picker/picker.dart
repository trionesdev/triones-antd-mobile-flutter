import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    void Function(AntPickerOption? value, int index)? onColumnSelected,
    double? itemHeight = 34,
    bool isScrollControlled = false,
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
      onColumnSelected: onColumnSelected,
      itemHeight: itemHeight,
      isScrollControlled: isScrollControlled,
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
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
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
  void Function(AntPickerOption? value, int index)? onColumnSelected,
  double? itemHeight = 34,
  bool isScrollControlled = false,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    builder: (context) {
      return AntPickerMultiView(
        itemHeight: itemHeight,
        title: title,
        value: value,
        columns: options,
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

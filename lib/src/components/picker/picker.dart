import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_multi_view.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view.dart';

class AntPicker {
  static void show({required BuildContext context,
    double? minHeight,
    double? maxHeight,
    Widget? title,
    List<AntPickerOption>? options,
    String? value,
    ValueChanged<AntPickerOption?>? onOk,
    Function? onCancel,
    double? itemHeight = 34,
    bool? isScrollControlled = false,
  }) {
    AntPopup.show(
        context: context,
        minHeight: minHeight,
        maxHeight: maxHeight,
        isScrollControlled: isScrollControlled,
        child: AntPickerView(
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
        ));
  }

  static void showMulti({required BuildContext context,
    double? minHeight,
    double? maxHeight,
    Widget? title,
    List<List<AntPickerOption>>? options,
    List<String>? value,
    ValueChanged<List<AntPickerOption?>>? onOk,
    Function? onCancel,
    void Function(AntPickerOption? value, int index)? onColumnSelected,
    double? itemHeight = 34,
    bool? isScrollControlled = false,
  }) {
    AntPopup.show(
        context: context,
        minHeight: minHeight,
        maxHeight: maxHeight,
        isScrollControlled: isScrollControlled,
        child: AntPickerMultiView(
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
          onColumnSelected: (value, index) {
            onColumnSelected?.call(value, index);
          },
        ));
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
  bool? isScrollControlled = false,
}) {
  return AntPopup.show<T>(
      context: context,
      minHeight: minHeight,
      maxHeight: maxHeight,
      isScrollControlled: isScrollControlled,
      child: AntPickerView(
          itemHeight: itemHeight,
          title: title,
          value: value,
          options: options,
          onOk: (value) {
            Navigator.of(context).pop();
            onOk?.call(value);
          },
          onCancel: () {}
      )
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
  bool? isScrollControlled = false,
}) {
  return AntPopup.show<T>(
      context: context,
      minHeight: minHeight,
      maxHeight: maxHeight,
      isScrollControlled: isScrollControlled,
      child: AntPickerMultiView(
        itemHeight: itemHeight,
        title: title,
        value: value,
        columns: options,
        onOk: (value) {
          Navigator.of(context).pop();
          onOk?.call(value);
        },
        onCancel: () {},
      )
  );
}
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_multi_view.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view_column.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/types.dart';

class AntPicker {
  static void show({required BuildContext context,
    double? minHeight,
    double? maxHeight,
    Widget? title,
    List<PickerOption> options,
    List<String>? value,
    ValueChanged<>? onOk,
    OnCancel? onCancel,
    double? itemHeight = 34}) {
    AntPopup.show(
        context: context,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: AntPickerView(
          itemHeight: itemHeight,
          title: title,
          value: value,
          columns: columns,
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
    List<List<PickerOption>>? columns,
    List<String>? value,
    ValueChanged<List<PickerOption?>>? onOk,
    Function? onCancel,
    double? itemHeight = 34}) {
    AntPopup.show(
        context: context,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: AntPickerMultiView(
          itemHeight: itemHeight,
          title: title,
          value: value,
          columns: columns,
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
}

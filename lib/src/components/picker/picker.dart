import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view.dart';

class PickerOption {
  String? label;
  String? value;

  PickerOption({this.label, this.value});
}

class AntPicker {
  static void show({
    required BuildContext context,
    double? minHeight,
    double? maxHeight,
    Widget? title,
    List<List<PickerOption>>? columns,
    List<String>? value,
    OnOk? onOk,
    OnCancel? onCancel,
  }) {
    AntPopup.show(
        context: context,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: AntPickerView(
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

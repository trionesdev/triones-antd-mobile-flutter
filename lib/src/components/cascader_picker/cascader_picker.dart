import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import 'cascader_picker_view.dart';

class CascaderPickerOption {
  final String? label;
  final String? value;
  final List<CascaderPickerOption>? children;

  const CascaderPickerOption({
    this.label,
    this.value,
    this.children,
  });
}

class AntCascaderPicker {
  static void show({
    required BuildContext context,
    double? minHeight,
    double? maxHeight,
    double? itemHeight = 34,
    List<CascaderPickerOption>? options,
    List<String>? value,
    OnOk? onOk,
    OnCancel? onCancel,
  }) {
    AntPopup.show(
        context: context,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: AntCascaderPickerView(
          itemHeight: itemHeight,
          options: options,
          value: value,
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

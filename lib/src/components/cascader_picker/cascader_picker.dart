import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import 'cascader_picker_view.dart';

class AntCascaderPickerOption {
  final String? label;
  final String? value;
  final List<AntCascaderPickerOption>? children;

  const AntCascaderPickerOption({
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
    List<AntCascaderPickerOption>? options,
    List<String>? value,
    ValueChanged<List<AntCascaderPickerOption?>?>? onOk,
    Function? onCancel,
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

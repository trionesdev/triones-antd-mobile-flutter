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
    List<List<PickerOption>>? columns,
  }) {
    AntPopup.show(
        context: context,
        minHeight: minHeight,
        child: AntPickerView(
          columns: columns,
        ));
  }
}

import 'package:flutter/widgets.dart';

import 'cascader_picker.dart';

typedef OnOk = void Function(List<CascaderPickerOption?> value);
typedef OnCancel = void Function();

class AntCascaderPickerView extends StatefulWidget {
  const AntCascaderPickerView({
    super.key,
    this.columns,
    this.onOk,
    this.onCancel,
    this.value,
    this.title,
  });

  final List<List<CascaderPickerOption>>? columns;
  final List<String>? value;
  final OnCancel? onCancel;
  final OnOk? onOk;
  final Widget? title;

  @override
  State<StatefulWidget> createState() =>_AntCascaderPickerViewState();

}

class _AntCascaderPickerViewState extends State<AntCascaderPickerView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
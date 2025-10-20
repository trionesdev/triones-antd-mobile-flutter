import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/types.dart';

enum AntSelectMode { multiple, tags }

enum AntSelectPickerMode { page, popup }

class AntFieldsNames {
  NamePath? label;
  NamePath? value;

  AntFieldsNames({ this.label, this.value });
}

typedef AntSelectValueChanged = void Function(dynamic value,dynamic? option);

typedef AntSelectOptionBuilder = Widget Function(
    BuildContext context,
    dynamic item,
    int index,
    bool selected,
    );
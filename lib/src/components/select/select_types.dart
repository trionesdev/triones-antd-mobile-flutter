import 'package:flutter/widgets.dart';

enum AntSelectMode { multiple, tags }

enum AntSelectModalMode { page, popup }

class AntFieldsNames {
  String label;
  String value;

  AntFieldsNames({this.label = "label", this.value = "value"});
}

typedef AntSelectValueChanged = void Function(dynamic value,dynamic option);

typedef AntSelectOptionBuilder = Widget Function(
    BuildContext context,
    dynamic item,
    int index,
    bool selected,
    );
//region types
import '../../../trionesdev_antd_mobile.dart';

enum AntFormLayout { horizontal, vertical }

enum AntFormLabelVerticalAlign { start, center, end }


class AntFormListField{

  AntFormListField({required this.name, required this.index});

  final NamePath name;
  final int index;
}

typedef AddFunction = void Function(dynamic defalutValue);
typedef RemoveFunction = void Function(int index);


class AntFormListOperations{
  AntFormListOperations({required this.add,required this.remove});
  final AddFunction add;
  final RemoveFunction remove;
}
//endregion

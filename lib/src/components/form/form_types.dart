

enum AntFormLayout { horizontal, vertical }

enum AntLabelAlign { left, right }

enum AntFormLabelVerticalAlign { start, center, end }

class NamePath {
  List<dynamic> _namePaths = [];

  NamePath(dynamic namePath) {
    if (namePath is List) {
      _namePaths = namePath;
    } else {
      _namePaths = [namePath];
    }
  }

  List<dynamic> get value => _namePaths;

  NamePath append(dynamic name) {
    if (name is List) {
      _namePaths.addAll(name);
    } else {
      _namePaths.add(name);
    }
    return this;
  }

  @override
  bool operator == (Object other) {
    if (other is! NamePath) {
      return false;
    }
    return jsonValue == other.jsonValue;
  }

  String get jsonValue => _namePaths.map((item) {
    return item.toString();
  }).join(".");


}

class AntFormCol {
  const AntFormCol({this.flex, this.span});

  final double? flex;
  final int? span;
}

class AntFormListField{

  AntFormListField({required this.name, required this.index});

  final NamePath name;
  final int index;
}

typedef AddFunction = void Function(dynamic defalutValue);
typedef RemoveFunction = void Function(int index);


class AntFormListOperations{
   AntFormListOperations({this.add,this.remove});
  final AddFunction? add;
  final RemoveFunction? remove;
}
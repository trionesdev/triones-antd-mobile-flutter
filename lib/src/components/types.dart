enum AntSize { small, middle, large }

enum AntLayout{
  horizontal,
  vertical
}

class AntCol {
  const AntCol({this.flex, this.span});

  final double? flex;
  final int? span;
}

enum AntLabelAlign { left, right }

class AntOption {
  String? label;
  dynamic? value;

  AntOption({this.label, this.value});
}

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

  bool get isEmpty => _namePaths.isEmpty;

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
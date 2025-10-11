enum AntSize { small, middle, large }

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

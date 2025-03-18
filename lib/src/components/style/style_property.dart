import 'package:flutter/widgets.dart';

class StylePadding {
  const StylePadding({this.top, this.bottom, this.left, this.right});

  static StylePadding all(double value) {
    return StylePadding(
      top: value,
      bottom: value,
      left: value,
      right: value,
    );
  }

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
}

class StyleMargin {
  const StyleMargin({this.top, this.bottom, this.left, this.right});

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
}

class StyleBorder {
  const StyleBorder({this.color, this.width, this.style});

  final Color? color;
  final double? width;
  final BorderStyle? style;
}

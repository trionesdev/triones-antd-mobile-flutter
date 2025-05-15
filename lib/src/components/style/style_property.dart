import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class StyleMargin {
  const StyleMargin({this.top, this.bottom, this.left, this.right});

  static StyleMargin all(double value) {
    return StyleMargin(
      top: value,
      bottom: value,
      left: value,
      right: value,
    );
  }

  static StyleMargin symmetric({double? vertical, double? horizontal}) {
    return StyleMargin(
      top: vertical,
      bottom: vertical,
      left: horizontal,
      right: horizontal,
    );
  }

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
}

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

  static StylePadding symmetric({double? vertical, double? horizontal}) {
    return StylePadding(
      top: vertical,
      bottom: vertical,
      left: horizontal,
      right: horizontal,
    );
  }

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

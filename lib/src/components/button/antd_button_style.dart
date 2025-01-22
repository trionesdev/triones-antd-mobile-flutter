import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AntdButtonStyle with Diagnosticable {
  final WidgetStateProperty<TextStyle?>? textStyle;
  final WidgetStateProperty<Color?>? iconColor;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<OutlinedBorder?>? shape;
  final WidgetStateProperty<EdgeInsets?>? padding;

  const AntdButtonStyle(
      {this.textStyle,
      this.iconColor,
      this.backgroundColor,
      this.shape,
      this.padding});

  AntdButtonStyle copyWith(
      {WidgetStateProperty<TextStyle?>? textStyle,
      WidgetStateProperty<Color?>? iconColor,
      WidgetStateProperty<Color?>? backgroundColor,
      WidgetStateProperty<OutlinedBorder?>? shape,
      WidgetStateProperty<EdgeInsets?>? padding}) {
    return AntdButtonStyle(
        textStyle: textStyle ?? this.textStyle,
        iconColor: iconColor ?? this.iconColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        shape: shape ?? this.shape,
        padding: padding ?? this.padding);
  }

  AntdButtonStyle merge(AntdButtonStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
        textStyle: textStyle ?? style.textStyle,
        iconColor: iconColor ?? style.iconColor,
        backgroundColor: backgroundColor ?? style.backgroundColor,
        shape: shape ?? style.shape,
        padding: padding ?? style.padding);
  }
}

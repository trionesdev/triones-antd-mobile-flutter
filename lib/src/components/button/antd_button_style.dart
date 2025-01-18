import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AntdButtonStyle with Diagnosticable {
  final WidgetStateProperty<TextStyle?>? textStyle;
  final WidgetStateProperty<Color?>? backgroundColor;
  final BorderRadius? borderRadius;
  final BorderRadius? borderColor;
  final WidgetStateProperty<OutlinedBorder?>? shape;
  final WidgetStateProperty<EdgeInsets?>? padding;

  const AntdButtonStyle(
      {this.textStyle,
      this.backgroundColor,
      this.borderRadius,
        this.borderColor,
      this.shape,
      this.padding});

  ButtonStyle toButtonStyle() {
    return ButtonStyle(
        padding: padding,
        backgroundColor: backgroundColor,
        shape: shape ??
            WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(600.0),
                side: BorderSide(color: Color(0xFFd9d9d9), width: 0.5))));
  }

  AntdButtonStyle copyWith(
      {WidgetStateProperty<TextStyle?>? textStyle,
      WidgetStateProperty<Color?>? backgroundColor,
      borderRadius,
      WidgetStateProperty<OutlinedBorder?>? shape,
      WidgetStateProperty<EdgeInsets?>? padding}) {
    return AntdButtonStyle(
        textStyle: textStyle ?? this.textStyle,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        borderRadius: borderRadius ?? this.borderRadius,
        shape: shape ?? this.shape,
        padding: padding ?? this.padding);
  }

  AntdButtonStyle merge(AntdButtonStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
        textStyle: textStyle ?? style.textStyle,
        backgroundColor: backgroundColor ?? style.backgroundColor,
        borderRadius: borderRadius ?? style.borderRadius,
        shape: shape ?? style.shape,
        padding: padding ?? style.padding);
  }
}

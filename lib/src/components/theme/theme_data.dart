library;

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;

class AntThemeData with Diagnosticable {
  factory AntThemeData(
      {Color? colorPrimary,
      Color? colorSuccess,
      Color? colorWarning,
        Color? colorError,
        Color? colorBorder,
      double? borderRadius}) {
    colorPrimary ??= Color(0xFF1677FF);
    colorSuccess ??= Color(0xff52c41a);
    colorWarning ??= Color(0xfffaad14);
    colorWarning ??= Color(0xffff4d4f);
    colorBorder ??= Color(0xffd9d9d9);
    borderRadius ??= 6;
    return AntThemeData.raw(
      colorPrimary: colorPrimary,
      colorSuccess: colorSuccess,
      colorWarning: colorWarning,
      colorError: colorWarning,
      colorBorder: colorBorder,
      borderRadius: borderRadius,
    );
  }

  const AntThemeData.raw({
    required this.colorPrimary,
    required this.colorSuccess,
    required this.colorWarning,
    required this.colorError,
    required this.colorBorder,
    required this.borderRadius,
  });

  final Color colorPrimary;
  final Color colorSuccess;
  final Color colorWarning;
  final Color colorError;
  final Color colorBorder;
  final double borderRadius;

  factory AntThemeData.fallback() => AntThemeData(colorPrimary: null);

  static AntThemeData localize(
      AntThemeData? baseTheme, AntThemeData? localTextGeometry) {
    return AntThemeData();
  }

  material.ThemeData toMaterialThemeData() {
    return material.ThemeData(
        splashFactory: material.NoSplash.splashFactory,
        //移除水纹效果
        splashColor: material.Colors.transparent,
        highlightColor: material.Colors.transparent,
        shadowColor: material.Colors.transparent,
        //移除阴影效果
        textTheme: material.TextTheme());
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AntdThemeData with Diagnosticable {
  factory AntdThemeData() {
    return AntdThemeData.raw();
  }

  const AntdThemeData.raw();

  factory AntdThemeData.fallback() => AntdThemeData();

  static AntdThemeData localize(
      AntdThemeData? baseTheme, AntdThemeData? localTextGeometry) {
    return AntdThemeData();
  }

  ThemeData toMaterialThemeData() {
    return ThemeData(
      splashFactory: NoSplash.splashFactory,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

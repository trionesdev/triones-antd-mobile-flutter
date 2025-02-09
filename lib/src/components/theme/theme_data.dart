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
      splashFactory: NoSplash.splashFactory, //移除水纹效果
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      shadowColor: Colors.transparent //移除阴影效果
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

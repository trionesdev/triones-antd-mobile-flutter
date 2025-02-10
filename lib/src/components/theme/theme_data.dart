library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;

class ThemeData with Diagnosticable {
  factory ThemeData() {
    return ThemeData.raw();
  }

  const ThemeData.raw();

  factory ThemeData.fallback() => ThemeData();

  static ThemeData localize(
      ThemeData? baseTheme, ThemeData? localTextGeometry) {
    return ThemeData();
  }

  material.ThemeData toMaterialThemeData() {
    return material.ThemeData(
      splashFactory: material.NoSplash.splashFactory, //移除水纹效果
      splashColor: material.Colors.transparent,
      highlightColor: material.Colors.transparent,
      shadowColor: material.Colors.transparent //移除阴影效果
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

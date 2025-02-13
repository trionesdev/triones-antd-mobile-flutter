library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;

class AntThemeData with Diagnosticable {
  factory AntThemeData() {
    return AntThemeData.raw();
  }

  const AntThemeData.raw();

  factory AntThemeData.fallback() => AntThemeData();

  static AntThemeData localize(
      AntThemeData? baseTheme, AntThemeData? localTextGeometry) {
    return AntThemeData();
  }

  material.ThemeData toMaterialThemeData() {
    return material.ThemeData(
      splashFactory: material.NoSplash.splashFactory, //移除水纹效果
      splashColor: material.Colors.transparent,
      highlightColor: material.Colors.transparent,
      shadowColor: material.Colors.transparent, //移除阴影效果
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

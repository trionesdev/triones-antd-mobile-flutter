
import 'package:flutter/material.dart';

class AntColor extends ColorSwatch<int>{
  const AntColor(super.primary, super.swatch);

}

class AntAccentColor extends ColorSwatch<int>{
  const AntAccentColor(super.primary, super.swatch);

}

abstract final class Colors {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF1890ff);
}
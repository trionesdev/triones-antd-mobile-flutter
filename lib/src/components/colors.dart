
import 'package:flutter/cupertino.dart';

class AntdColor extends ColorSwatch<int>{
  const AntdColor(super.primary, super.swatch);

}

class AntdAccentColor extends ColorSwatch<int>{
  const AntdAccentColor(super.primary, super.swatch);

}

abstract final class Colors {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
}
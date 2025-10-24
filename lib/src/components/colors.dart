
import 'package:flutter/material.dart';

class AntColor extends ColorSwatch<int>{
  const AntColor(super.primary, super.swatch);

}

class AntAccentColor extends ColorSwatch<int>{
  const AntAccentColor(super.primary, super.swatch);

}

abstract final class AntColors {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF1890ff);
  static const Color blue = Color(0xFF1677FF);
  static const Color purple = Color(0xFF722ED1);
  static const Color cyan = Color(0xFF13C2C2);
  static const Color green = Color(0xFF52C41A);
  static const Color magenta = Color(0xFFEB2F96);
  static const Color pink = Color(0xFFEB2F96);
  static const Color red = Color(0xFFF5222D);
  static const Color orange = Color(0xFFFA8C16);
  static const Color yellow = Color(0xFFFADB14);
  static const Color volcano = Color(0xFFFA541C);
  static const Color geekblue = Color(0xFF2F54EB);
  static const Color lime = Color(0xFFA0D911);
  static const Color gold = Color(0xFFFAAD14);
}
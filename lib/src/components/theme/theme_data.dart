library;

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;

class AntThemeData with Diagnosticable {
  factory AntThemeData({
    Color? colorTextBase,
    Color? colorTextPlaceholder,
    Color? colorBgBase,
    Color? colorInfo,
    Color? colorLink,
    double? controlHeight,
    double? borderRadiusLG,
    double? borderRadiusOuter,
    double? borderRadiusSM,
    double? borderRadiusXS,
    Color? colorPrimary,
    Color? colorSuccess,
    Color? colorWarning,
    Color? colorError,
    Color? colorBorder,
    double? borderRadius,
    Brightness? brightness,
  }) {
    borderRadius ??= 6;
    colorBgBase ??= Color(0xFFFFFFFF);
    colorError ??= Color(0xffff4d4f);
    colorInfo ??= Color(0xFF1890ff);
    colorLink ??= Color(0xFF1677ff);
    colorPrimary ??= Color(0xFF1677FF);
    colorSuccess ??= Color(0xff52c41a);
    colorWarning ??= Color(0xfffaad14);
    colorTextBase ??= Color(0xff000000);
    controlHeight ??= 32;
    borderRadiusLG ??= 8;
    borderRadiusOuter ??= 4;
    borderRadiusSM ??= 4;
    borderRadiusXS ??= 2;

    colorBorder ??= Color(0xffd9d9d9);
    colorTextPlaceholder ??= Color.fromRGBO(0, 0, 0, 0.25);
    brightness ??= Brightness.light;

    return AntThemeData.raw(
      colorTextBase: colorTextBase,
      colorTextPlaceholder: colorTextPlaceholder,
      colorBgBase: colorBgBase,
      colorInfo: colorInfo,
      colorLink: colorLink,
      controlHeight: controlHeight,
      borderRadiusLG: borderRadiusLG,
      borderRadiusOuter: borderRadiusOuter,
      borderRadiusSM: borderRadiusSM,
      borderRadiusXS: borderRadiusXS,
      colorPrimary: colorPrimary,
      colorSuccess: colorSuccess,
      colorWarning: colorWarning,
      colorError: colorError,
      colorBorder: colorBorder,
      borderRadius: borderRadius,
      brightness: brightness,
    );
  }

  const AntThemeData.raw({
    required this.colorTextBase,
    required this.colorTextPlaceholder,
    required this.colorBgBase,
    required this.colorInfo,
    required this.colorLink,
    required this.controlHeight,
    required this.borderRadiusLG,
    required this.borderRadiusOuter,
    required this.borderRadiusSM,
    required this.borderRadiusXS,
    required this.colorPrimary,
    required this.colorSuccess,
    required this.colorWarning,
    required this.colorError,
    required this.colorBorder,
    required this.borderRadius,
    required this.brightness,
  });

  final double borderRadius;
  final Color colorBgBase;
  final Color colorError;
  final Color colorInfo;
  final Color colorLink;
  final Color colorPrimary;
  final Color colorSuccess;
  final Color colorTextBase;
  final Color colorWarning;
  final double controlHeight;

  final double borderRadiusLG;
  final double borderRadiusOuter;
  final double borderRadiusSM;
  final double borderRadiusXS;
  final Color colorBorder;
  final Color colorTextPlaceholder;

  final Brightness brightness;

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

library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AntThemeData with Diagnosticable {
  factory AntThemeData({
    TargetPlatform? platform,
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
    Color? colorPrimaryBg,
    Color? colorSuccess,
    Color? colorWarning,
    Color? colorError,
    Color? colorBorder,
    double? borderRadius,
    Brightness? brightness,
  }) {
    platform ??= defaultTargetPlatform;

    final bool useInkSparkle = platform == TargetPlatform.android && !kIsWeb;

    borderRadius ??= 6;
    colorBgBase ??= Color(0xFFFFFFFF);
    colorError ??= Color(0xffff4d4f);
    colorInfo ??= Color(0xFF1890ff);
    colorLink ??= Color(0xFF1677ff);
    colorPrimary ??= Color(0xFF1677FF);
    colorPrimaryBg ??= Color(0xffe6f4ff);
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
      platform: platform,
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
      colorPrimaryBg: colorPrimaryBg,
      colorSuccess: colorSuccess,
      colorWarning: colorWarning,
      colorError: colorError,
      colorBorder: colorBorder,
      borderRadius: borderRadius,
      brightness: brightness,
    );
  }

  const AntThemeData.raw({
    required this.platform,
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
    required this.colorPrimaryBg,
    required this.colorSuccess,
    required this.colorWarning,
    required this.colorError,
    required this.colorBorder,
    required this.borderRadius,
    required this.brightness,
  });

  final TargetPlatform platform;

  final double borderRadius;
  final Color colorBgBase;
  final Color colorError;
  final Color colorInfo;
  final Color colorLink;
  final Color colorPrimary;
  final Color colorPrimaryBg;
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

  factory AntThemeData.light() =>
      AntThemeData(
        brightness: Brightness.light,
      );

  factory AntThemeData.dark() =>
      AntThemeData(
        brightness: Brightness.dark,
      );

  factory AntThemeData.fallback() => AntThemeData.light();

  static AntThemeData of(BuildContext context) {
    // final _InheritedTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return AntThemeData();
  }

  static AntThemeData localize(AntThemeData? baseTheme,
      AntThemeData? localTextGeometry) {
    return baseTheme ?? AntThemeData();
  }

  ThemeData toMaterialThemeData() {
    return ThemeData(
        splashFactory: NoSplash.splashFactory,
        //移除水纹效果
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        shadowColor: Colors.transparent,
        //移除阴影效果
        textTheme: TextTheme(),
        dialogBackgroundColor: colorBgBase,
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: colorBgBase,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius))))
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

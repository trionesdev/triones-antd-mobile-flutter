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
    double? fontSize,
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
    Color? colorBgBlur,
    Color? colorBgContainer,
    Color? colorBgElevated,
    Color? colorBgLayout,
    Color? colorBgMask,
    Color? colorBgSolid,
    Color? colorBgSolidActive,
    Color? colorBgSolidHover,
    Color? colorBgSpotlight,
    Color? colorBorderSecondary,
    Color? colorErrorActive,
    Color? colorErrorBg,
    Color? colorErrorBgActive,
    Color? colorErrorBgFilledHover,
    Color? colorErrorBgHover,
    Color? colorErrorBorder,
    Color? colorErrorBorderHover,
    Color? colorErrorHover,
    Color? colorErrorText,
    Color? colorErrorTextActive,
    Color? colorErrorTextHover,
    Color? colorFill,
    Color? colorFillQuaternary,
    Color? colorFillSecondary,
    Color? colorFillTertiary,
    Color? colorInfoActive,
    Color? colorInfoBg,
    Color? colorInfoBgHover,
    Color? colorInfoBorder,
    Color? colorInfoBorderHover,
    Color? colorInfoHover,
    Color? colorInfoText,
    Color? colorInfoTextActive,
    Color? colorInfoTextHover,
    Color? colorLinkActive,
    Color? colorLinkHover,
    Color? colorPrimaryActive,
    Color? colorPrimaryBgHover,
    Color? colorPrimaryBorder,
    Color? colorPrimaryBorderHover,
    Color? colorPrimaryHover,
    Color? colorPrimaryText,
    Color? colorPrimaryTextActive,
    Color? colorPrimaryTextHover,
    Color? colorSuccessActive,
    Color? colorSuccessBg,
    Color? colorSuccessBgHover,
    Color? colorSuccessBorder,
    Color? colorSuccessBorderHover,
    Color? colorSuccessHover,
    Color? colorSuccessText,
    Color? colorSuccessTextActive,
    Color? colorSuccessTextHover,
    Color? colorText,
    Color? colorTextQuaternary,
    Color? colorTextSecondary,
    Color? colorTextTertiary,
    Color? colorWarningActive,
    Color? colorWarningBg,
    Color? colorWarningBgHover,
    Color? colorWarningBorder,
    Color? colorWarningBorderHover,
    Color? colorWarningHover,
    Color? colorWarningText,
    Color? colorWarningTextActive,
    Color? colorWarningTextHover,
    Color? colorWhite,
    double? controlHeightLG,
    double? controlHeightSM,
    double? controlHeightXS,
    double? fontSizeHeading1,
    double? fontSizeHeading2,
    double? fontSizeHeading3,
    double? fontSizeHeading4,
    double? fontSizeHeading5,
    double? fontSizeLG,
    double? fontSizeSM,
    double? fontSizeXL,
    double? size,
    double? sizeLG,
    double? sizeMD,
    double? sizeMS,
    double? sizeSM,
    double? sizeXL,
    double? sizeXS,
    double? sizeXXL,
    double? sizeXXS,
    Color? colorBgContainerDisabled,
    Color? colorBgTextActive,
    Color? colorBgTextHover,
    Color? colorBorderBg,
    Color? colorErrorOutline,
    Color? colorFillAlter,
    Color? colorFillContent,
    Color? colorFillContentHover,
    Color? colorHighlight,
    Color? colorIcon,
    Color? colorIconHover,
    Color? colorSplit,
    Color? colorTextDescription,
    Color? colorTextDisabled,
    Color? colorTextHeading,
    Color? colorTextLabel,
    Color? colorTextLightSolid,
    Color? colorWarningOutline,
    double? controlInteractiveSize,
    Color? controlItemBgActive,
    Color? controlItemBgActiveDisabled,
    Color? controlItemBgActiveHover,
    Color? controlItemBgHover,
    Color? controlOutline,
    double? controlOutlineWidth,
    double? controlPaddingHorizontal,
    double? controlPaddingHorizontalSM,
    double? fontSizeIcon,
    double? fontWeightStrong,
    double? lineWidthFocus,
    double? margin,
    double? marginLG,
    double? marginMD,
    double? marginSM,
    double? marginXL,
    double? marginXS,
    double? marginXXL,
    double? marginXXS,
    double? opacityLoading,
    double? padding,
    double? paddingContentHorizontal,
    double? paddingContentHorizontalLG,
    double? paddingContentHorizontalSM,
    double? paddingContentVertical,
    double? paddingContentVerticalLG,
    double? paddingContentVerticalSM,
    double? paddingLG,
    double? paddingMD,
    double? paddingSM,
    double? paddingXL,
    double? paddingXS,
    double? paddingXXS,
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
    fontSize ??= 14;
    borderRadiusLG ??= 8;
    borderRadiusOuter ??= 4;
    borderRadiusSM ??= 4;
    borderRadiusXS ??= 2;
    colorBgBlur ??= Color(0x00000000);
    colorBgContainer ??= Color(0xFFFFFFFF);
    colorBgElevated ??= Color(0xFFFFFFFF);
    colorBgLayout ??= Color(0xFFf5f5f5);
    colorBgMask ??= Color.fromRGBO(0,0,0,0.45);
    colorBgSolid ??= Color.fromRGBO(0, 0, 0, 1);
    colorBgSolidActive ??= Color.fromRGBO(0,0,0,0.95);
    colorBgSolidHover ??= Color.fromRGBO(0,0,0,0.75);
    colorBgSpotlight ??= Color.fromRGBO(0,0,0,0.85);
    colorBorder ??= Color(0xffd9d9d9);
    colorBorderSecondary ??= Color(0xfff0f0f0);
    colorErrorActive ??= Color(0xffd9363e);
    colorErrorBg ??= Color(0xfffff2f0);
    colorErrorBgActive ??= Color(0xffffccc7);
    colorErrorBgFilledHover ??= Color(0xffffdfdc);
    colorErrorBgHover ??= Color(0xfffff1f0);
    colorErrorBorder ??= Color(0xffffccc7);
    colorErrorBorderHover ??= Color(0xffffa39e);
    colorErrorHover ??= Color(0xffff7875);
    colorErrorText ??= Color(0xffff4d4f);
    colorErrorTextActive ??= Color(0xffd9363e);
    colorErrorTextHover ??= Color(0xffff7875);
    colorFill ??= Color.fromRGBO(0,0,0,0.15);
    colorFillQuaternary ??= Color.fromRGBO(0,0,0,0.02);
    colorFillSecondary ??= Color.fromRGBO(0,0,0,0.06);
    colorFillTertiary ??= Color.fromRGBO(0,0,0,0.04);
    colorInfoActive ??= Color(0xFF0958d9);
    colorInfoBg ??= Color(0xFFe6f4ff);
    colorInfoBgHover ??= Color(0xFFbae0ff);
    colorInfoBorder ??= Color(0xFF91caff);
    colorInfoBorderHover ??= Color(0xFF69b1ff);
    colorInfoHover ??= Color(0xFF69b1ff);
    colorInfoText ??= Color(0xFF1677ff);
    colorInfoTextActive ??= Color(0xFF0958d9);
    colorInfoTextHover ??= Color(0xFF4096ff);
    colorLinkActive ??= Color(0xFF0958d9);
    colorLinkHover ??= Color(0xFF69b1ff);
    colorPrimaryActive ??= Color(0xFF0958d9);
    colorPrimaryBg ??= Color(0xffe6f4ff);
    colorPrimaryBgHover ??= Color(0xffbae0ff);
    colorPrimaryBorder ??= Color(0xFF91caff);
    colorPrimaryBorderHover ??= Color(0xFF69b1ff);
    colorPrimaryHover ??= Color(0xFF4096ff);
    colorPrimaryText ??= Color(0xFF1677ff);
    colorPrimaryTextActive ??= Color(0xFF0958d9);
    colorPrimaryTextHover ??= Color(0xFF4096ff);
    colorSuccessActive ??= Color(0xff389e0d);
    colorSuccessBg ??= Color(0xfff6ffed);
    colorSuccessBgHover ??= Color(0xffd9f7be);
    colorSuccessBorder ??= Color(0xffb7eb8f);
    colorSuccessBorderHover ??= Color(0xff52c41a);
    colorSuccessHover ??= Color(0xff95de64);
    colorSuccessText ??= Color(0xff52c41a);
    colorSuccessTextActive ??= Color(0xff389e0d);
    colorSuccessTextHover ??= Color(0xff73d13d);
    colorText ??= Color.fromRGBO(0,0,0,0.88);
    colorTextQuaternary ??= Color.fromRGBO(0,0,0,0.25);
    colorTextSecondary ??= Color.fromRGBO(0,0,0,0.65);
    colorTextTertiary ??= Color.fromRGBO(0,0,0,0.45);
    colorWarningActive ??= Color(0xffd48806);
    colorWarningBg ??= Color(0xfffffbe6);
    colorWarningBgHover ??= Color(0xfffff1b8);
    colorWarningBorder ??= Color(0xffffe58f);
    colorWarningBorderHover ??= Color(0xffffd666);
    colorWarningHover ??= Color(0xffffd666);
    colorWarningText ??= Color(0xfffaad14);
    colorWarningTextActive ??= Color(0xffd48806);
    colorWarningTextHover ??= Color(0xffffc53d);
    colorWhite ??= Color(0xFFFFFFFF);
    controlHeightLG ??= 40;
    controlHeightSM ??= 24;
    controlHeightXS ??= 16;
    fontSizeHeading1 ??= 38;
    fontSizeHeading2 ??= 30;
    fontSizeHeading3 ??= 24;
    fontSizeHeading4 ??= 20;
    fontSizeHeading5 ??= 16;
    fontSizeLG ??= 16;
    fontSizeSM ??= 12;
    fontSizeXL ??= 20;
    size ??= 16;
    sizeLG ??= 24;
    sizeMD ??= 20;
    sizeMS ??= 16;
    sizeSM ??= 12;
    sizeXL ??= 32;
    sizeXS ??= 8;
    sizeXXL ??= 48;
    sizeXXS ??= 4;
    colorBgContainerDisabled ??= Color(0xFFFFFFFF);
    colorBgTextActive ??= Color(0x00000000);
    colorBgTextHover ??= Color(0x00000000);
    colorBorderBg ??= Color(0x00000000);
    colorErrorOutline ??= Color(0xffff4d4f);
    colorFillAlter ??= Color(0x00000000);
    colorFillContent ??= Color(0x00000000);
    colorFillContentHover ??= Color(0x00000000);
    colorHighlight ??= Color(0x00000000);
    colorIcon ??= Color(0x00000000);
    colorIconHover ??= Color(0x00000000);
    colorSplit ??= Color(0x00000000);
    colorTextDescription ??= Color(0x00000000);
    colorTextDisabled ??= Color(0x00000000);
    colorTextHeading ??= Color(0x00000000);
    colorTextLabel ??= Color(0x00000000);
    colorTextLightSolid ??= Color(0x00000000);
    colorTextPlaceholder ??= Color.fromRGBO(0, 0, 0, 0.25);
    colorWarningOutline ??= Color(0xfffaad14);
    controlInteractiveSize ??= 16;
    controlItemBgActive ??= Color(0x00000000);
    controlItemBgActiveDisabled ??= Color(0x00000000);
    controlItemBgActiveHover ??= Color(0x00000000);
    controlItemBgHover ??= Color(0x00000000);
    controlOutline ??= Color(0x00000000);
    controlOutlineWidth ??= 1;
    controlPaddingHorizontal ??= 12;
    controlPaddingHorizontalSM ??= 8;
    fontSizeIcon ??= 16;
    fontWeightStrong ??= 600;
    lineWidthFocus ??= 2;
    margin ??= 12;
    marginLG ??= 24;
    marginMD ??= 16;
    marginSM ??= 8;
    marginXL ??= 32;
    marginXS ??= 4;
    marginXXL ??= 48;
    marginXXS ??= 2;
    opacityLoading ??= 0.5;
    padding ??= 12;
    paddingContentHorizontal ??= 12;
    paddingContentHorizontalLG ??= 24;
    paddingContentHorizontalSM ??= 8;
    paddingContentVertical ??= 12;
    paddingContentVerticalLG ??= 24;
    paddingContentVerticalSM ??= 8;
    paddingLG ??= 24;
    paddingMD ??= 16;
    paddingSM ??= 8;
    paddingXL ??= 32;
    paddingXS ??= 4;
    paddingXXS ??= 2;
    brightness ??= Brightness.light;

    return AntThemeData.raw(
      platform: platform,
      colorTextBase: colorTextBase,
      colorTextPlaceholder: colorTextPlaceholder,
      colorBgBase: colorBgBase,
      colorInfo: colorInfo,
      colorLink: colorLink,
      controlHeight: controlHeight,
      fontSize: fontSize,
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
      colorBgBlur: colorBgBlur,
      colorBgContainer: colorBgContainer,
      colorBgElevated: colorBgElevated,
      colorBgLayout: colorBgLayout,
      colorBgMask: colorBgMask,
      colorBgSolid: colorBgSolid,
      colorBgSolidActive: colorBgSolidActive,
      colorBgSolidHover: colorBgSolidHover,
      colorBgSpotlight: colorBgSpotlight,
      colorBorderSecondary: colorBorderSecondary,
      colorErrorActive: colorErrorActive,
      colorErrorBg: colorErrorBg,
      colorErrorBgActive: colorErrorBgActive,
      colorErrorBgFilledHover: colorErrorBgFilledHover,
      colorErrorBgHover: colorErrorBgHover,
      colorErrorBorder: colorErrorBorder,
      colorErrorBorderHover: colorErrorBorderHover,
      colorErrorHover: colorErrorHover,
      colorErrorText: colorErrorText,
      colorErrorTextActive: colorErrorTextActive,
      colorErrorTextHover: colorErrorTextHover,
      colorFill: colorFill,
      colorFillQuaternary: colorFillQuaternary,
      colorFillSecondary: colorFillSecondary,
      colorFillTertiary: colorFillTertiary,
      colorInfoActive: colorInfoActive,
      colorInfoBg: colorInfoBg,
      colorInfoBgHover: colorInfoBgHover,
      colorInfoBorder: colorInfoBorder,
      colorInfoBorderHover: colorInfoBorderHover,
      colorInfoHover: colorInfoHover,
      colorInfoText: colorInfoText,
      colorInfoTextActive: colorInfoTextActive,
      colorInfoTextHover: colorInfoTextHover,
      colorLinkActive: colorLinkActive,
      colorLinkHover: colorLinkHover,
      colorPrimaryActive: colorPrimaryActive,
      colorPrimaryBgHover: colorPrimaryBgHover,
      colorPrimaryBorder: colorPrimaryBorder,
      colorPrimaryBorderHover: colorPrimaryBorderHover,
      colorPrimaryHover: colorPrimaryHover,
      colorPrimaryText: colorPrimaryText,
      colorPrimaryTextActive: colorPrimaryTextActive,
      colorPrimaryTextHover: colorPrimaryTextHover,
      colorSuccessActive: colorSuccessActive,
      colorSuccessBg: colorSuccessBg,
      colorSuccessBgHover: colorSuccessBgHover,
      colorSuccessBorder: colorSuccessBorder,
      colorSuccessBorderHover: colorSuccessBorderHover,
      colorSuccessHover: colorSuccessHover,
      colorSuccessText: colorSuccessText,
      colorSuccessTextActive: colorSuccessTextActive,
      colorSuccessTextHover: colorSuccessTextHover,
      colorText: colorText,
      colorTextQuaternary: colorTextQuaternary,
      colorTextSecondary: colorTextSecondary,
      colorTextTertiary: colorTextTertiary,
      colorWarningActive: colorWarningActive,
      colorWarningBg: colorWarningBg,
      colorWarningBgHover: colorWarningBgHover,
      colorWarningBorder: colorWarningBorder,
      colorWarningBorderHover: colorWarningBorderHover,
      colorWarningHover: colorWarningHover,
      colorWarningText: colorWarningText,
      colorWarningTextActive: colorWarningTextActive,
      colorWarningTextHover: colorWarningTextHover,
      colorWhite: colorWhite,
      controlHeightLG: controlHeightLG,
      controlHeightSM: controlHeightSM,
      controlHeightXS: controlHeightXS,
      fontSizeHeading1: fontSizeHeading1,
      fontSizeHeading2: fontSizeHeading2,
      fontSizeHeading3: fontSizeHeading3,
      fontSizeHeading4: fontSizeHeading4,
      fontSizeHeading5: fontSizeHeading5,
      fontSizeLG: fontSizeLG,
      fontSizeSM: fontSizeSM,
      fontSizeXL: fontSizeXL,
      size: size,
      sizeLG: sizeLG,
      sizeMD: sizeMD,
      sizeMS: sizeMS,
      sizeSM: sizeSM,
      sizeXL: sizeXL,
      sizeXS: sizeXS,
      sizeXXL: sizeXXL,
      sizeXXS: sizeXXS,
      colorBgContainerDisabled: colorBgContainerDisabled,
      colorBgTextActive: colorBgTextActive,
      colorBgTextHover: colorBgTextHover,
      colorBorderBg: colorBorderBg,
      colorErrorOutline: colorErrorOutline,
      colorFillAlter: colorFillAlter,
      colorFillContent: colorFillContent,
      colorFillContentHover: colorFillContentHover,
      colorHighlight: colorHighlight,
      colorIcon: colorIcon,
      colorIconHover: colorIconHover,
      colorSplit: colorSplit,
      colorTextDescription: colorTextDescription,
      colorTextDisabled: colorTextDisabled,
      colorTextHeading: colorTextHeading,
      colorTextLabel: colorTextLabel,
      colorTextLightSolid: colorTextLightSolid,
      colorWarningOutline: colorWarningOutline,
      controlInteractiveSize: controlInteractiveSize,
      controlItemBgActive: controlItemBgActive,
      controlItemBgActiveDisabled: controlItemBgActiveDisabled,
      controlItemBgActiveHover: controlItemBgActiveHover,
      controlItemBgHover: controlItemBgHover,
      controlOutline: controlOutline,
      controlOutlineWidth: controlOutlineWidth,
      controlPaddingHorizontal: controlPaddingHorizontal,
      controlPaddingHorizontalSM: controlPaddingHorizontalSM,
      fontSizeIcon: fontSizeIcon,
      fontWeightStrong: fontWeightStrong,
      lineWidthFocus: lineWidthFocus,
      margin: margin,
      marginLG: marginLG,
      marginMD: marginMD,
      marginSM: marginSM,
      marginXL: marginXL,
      marginXS: marginXS,
      marginXXL: marginXXL,
      marginXXS: marginXXS,
      opacityLoading: opacityLoading,
      padding: padding,
      paddingContentHorizontal: paddingContentHorizontal,
      paddingContentHorizontalLG: paddingContentHorizontalLG,
      paddingContentHorizontalSM: paddingContentHorizontalSM,
      paddingContentVertical: paddingContentVertical,
      paddingContentVerticalLG: paddingContentVerticalLG,
      paddingContentVerticalSM: paddingContentVerticalSM,
      paddingLG: paddingLG,
      paddingMD: paddingMD,
      paddingSM: paddingSM,
      paddingXL: paddingXL,
      paddingXS: paddingXS,
      paddingXXS: paddingXXS,
    );
  }

  const AntThemeData.raw({
    required this.platform,
    required this.borderRadius,
    required this.colorBgBase,
    required this.colorError,
    required this.colorInfo,
    required this.colorLink,
    required this.colorPrimary,
    required this.colorSuccess,
    required this.colorTextBase,
    required this.colorWarning,
    required this.controlHeight,
    required this.fontSize,
    required this.borderRadiusLG,
    required this.borderRadiusOuter,
    required this.borderRadiusSM,
    required this.borderRadiusXS,
    required this.colorBgBlur,
    required this.colorBgContainer,
    required this.colorBgElevated,
    required this.colorBgLayout,
    required this.colorBgMask,
    required this.colorBgSolid,
    required this.colorBgSolidActive,
    required this.colorBgSolidHover,
    required this.colorBgSpotlight,
    required this.colorBorder,
    required this.colorBorderSecondary,
    required this.colorErrorActive,
    required this.colorErrorBg,
    required this.colorErrorBgActive,
    required this.colorErrorBgFilledHover,
    required this.colorErrorBgHover,
    required this.colorErrorBorder,
    required this.colorErrorBorderHover,
    required this.colorErrorHover,
    required this.colorErrorText,
    required this.colorErrorTextActive,
    required this.colorErrorTextHover,
    required this.colorFill,
    required this.colorFillQuaternary,
    required this.colorFillSecondary,
    required this.colorFillTertiary,
    required this.colorInfoActive,
    required this.colorInfoBg,
    required this.colorInfoBgHover,
    required this.colorInfoBorder,
    required this.colorInfoBorderHover,
    required this.colorInfoHover,
    required this.colorInfoText,
    required this.colorInfoTextActive,
    required this.colorInfoTextHover,
    required this.colorLinkActive,
    required this.colorLinkHover,
    required this.colorPrimaryActive,
    required this.colorPrimaryBg,
    required this.colorPrimaryBgHover,
    required this.colorPrimaryBorder,
    required this.colorPrimaryBorderHover,
    required this.colorPrimaryHover,
    required this.colorPrimaryText,
    required this.colorPrimaryTextActive,
    required this.colorPrimaryTextHover,
    required this.colorSuccessActive,
    required this.colorSuccessBg,
    required this.colorSuccessBgHover,
    required this.colorSuccessBorder,
    required this.colorSuccessBorderHover,
    required this.colorSuccessHover,
    required this.colorSuccessText,
    required this.colorSuccessTextActive,
    required this.colorSuccessTextHover,
    required this.colorText,
    required this.colorTextQuaternary,
    required this.colorTextSecondary,
    required this.colorTextTertiary,
    required this.colorWarningActive,
    required this.colorWarningBg,
    required this.colorWarningBgHover,
    required this.colorWarningBorder,
    required this.colorWarningBorderHover,
    required this.colorWarningHover,
    required this.colorWarningText,
    required this.colorWarningTextActive,
    required this.colorWarningTextHover,
    required this.colorWhite,
    required this.controlHeightLG,
    required this.controlHeightSM,
    required this.controlHeightXS,
    required this.fontSizeHeading1,
    required this.fontSizeHeading2,
    required this.fontSizeHeading3,
    required this.fontSizeHeading4,
    required this.fontSizeHeading5,
    required this.fontSizeLG,
    required this.fontSizeSM,
    required this.fontSizeXL,
    required this.size,
    required this.sizeLG,
    required this.sizeMD,
    required this.sizeMS,
    required this.sizeSM,
    required this.sizeXL,
    required this.sizeXS,
    required this.sizeXXL,
    required this.sizeXXS,
    required this.colorBgContainerDisabled,
    required this.colorBgTextActive,
    required this.colorBgTextHover,
    required this.colorBorderBg,
    required this.colorErrorOutline,
    required this.colorFillAlter,
    required this.colorFillContent,
    required this.colorFillContentHover,
    required this.colorHighlight,
    required this.colorIcon,
    required this.colorIconHover,
    required this.colorSplit,
    required this.colorTextDescription,
    required this.colorTextDisabled,
    required this.colorTextHeading,
    required this.colorTextLabel,
    required this.colorTextLightSolid,
    required this.colorTextPlaceholder,
    required this.colorWarningOutline,
    required this.controlInteractiveSize,
    required this.controlItemBgActive,
    required this.controlItemBgActiveDisabled,
    required this.controlItemBgActiveHover,
    required this.controlItemBgHover,
    required this.controlOutline,
    required this.controlOutlineWidth,
    required this.controlPaddingHorizontal,
    required this.controlPaddingHorizontalSM,
    required this.fontSizeIcon,
    required this.fontWeightStrong,
    required this.lineWidthFocus,
    required this.margin,
    required this.marginLG,
    required this.marginMD,
    required this.marginSM,
    required this.marginXL,
    required this.marginXS,
    required this.marginXXL,
    required this.marginXXS,
    required this.opacityLoading,
    required this.padding,
    required this.paddingContentHorizontal,
    required this.paddingContentHorizontalLG,
    required this.paddingContentHorizontalSM,
    required this.paddingContentVertical,
    required this.paddingContentVerticalLG,
    required this.paddingContentVerticalSM,
    required this.paddingLG,
    required this.paddingMD,
    required this.paddingSM,
    required this.paddingXL,
    required this.paddingXS,
    required this.paddingXXS,
    required this.brightness,
  });

  final TargetPlatform platform;
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
  final double fontSize;

  final double borderRadiusLG;
  final double borderRadiusOuter;
  final double borderRadiusSM;
  final double borderRadiusXS;
  final Color colorBgBlur;
  final Color colorBgContainer;
  final Color colorBgElevated;
  final Color colorBgLayout;
  final Color colorBgMask;
  final Color colorBgSolid;
  final Color colorBgSolidActive;
  final Color colorBgSolidHover;
  final Color colorBgSpotlight;
  final Color colorBorder;
  final Color colorBorderSecondary;
  final Color colorErrorActive;
  final Color colorErrorBg;
  final Color colorErrorBgActive;
  final Color colorErrorBgFilledHover;
  final Color colorErrorBgHover;
  final Color colorErrorBorder;
  final Color colorErrorBorderHover;
  final Color colorErrorHover;
  final Color colorErrorText;
  final Color colorErrorTextActive;
  final Color colorErrorTextHover;
  final Color colorFill;
  final Color colorFillQuaternary;
  final Color colorFillSecondary;
  final Color colorFillTertiary;
  final Color colorInfoActive;
  final Color colorInfoBg;
  final Color colorInfoBgHover;
  final Color colorInfoBorder;
  final Color colorInfoBorderHover;
  final Color colorInfoHover;
  final Color colorInfoText;
  final Color colorInfoTextActive;
  final Color colorInfoTextHover;
  final Color colorLinkActive;
  final Color colorLinkHover;
  final Color colorPrimaryActive;
  final Color colorPrimaryBg;
  final Color colorPrimaryBgHover;
  final Color colorPrimaryBorder;
  final Color colorPrimaryBorderHover;
  final Color colorPrimaryHover;
  final Color colorPrimaryText;
  final Color colorPrimaryTextActive;
  final Color colorPrimaryTextHover;
  final Color colorSuccessActive;
  final Color colorSuccessBg;
  final Color colorSuccessBgHover;
  final Color colorSuccessBorder;
  final Color colorSuccessBorderHover;
  final Color colorSuccessHover;
  final Color colorSuccessText;
  final Color colorSuccessTextActive;
  final Color colorSuccessTextHover;
  final Color colorText;
  final Color colorTextQuaternary;
  final Color colorTextSecondary;
  final Color colorTextTertiary;
  final Color colorWarningActive;
  final Color colorWarningBg;
  final Color colorWarningBgHover;
  final Color colorWarningBorder;
  final Color colorWarningBorderHover;
  final Color colorWarningHover;
  final Color colorWarningText;
  final Color colorWarningTextActive;
  final Color colorWarningTextHover;
  final Color colorWhite;
  final double controlHeightLG;
  final double controlHeightSM;
  final double controlHeightXS;
  final double fontSizeHeading1;
  final double fontSizeHeading2;
  final double fontSizeHeading3;
  final double fontSizeHeading4;
  final double fontSizeHeading5;
  final double fontSizeLG;
  final double fontSizeSM;
  final double fontSizeXL;
  final double size;
  final double sizeLG;
  final double sizeMD;
  final double sizeMS;
  final double sizeSM;
  final double sizeXL;
  final double sizeXS;
  final double sizeXXL;
  final double sizeXXS;
  final Color colorBgContainerDisabled;
  final Color colorBgTextActive;
  final Color colorBgTextHover;
  final Color colorBorderBg;
  final Color colorErrorOutline;
  final Color colorFillAlter;
  final Color colorFillContent;
  final Color colorFillContentHover;
  final Color colorHighlight;
  final Color colorIcon;
  final Color colorIconHover;
  final Color colorSplit;
  final Color colorTextDescription;
  final Color colorTextDisabled;
  final Color colorTextHeading;
  final Color colorTextLabel;
  final Color colorTextLightSolid;
  final Color colorTextPlaceholder;
  final Color colorWarningOutline;
  final double controlInteractiveSize;
  final Color controlItemBgActive;
  final Color controlItemBgActiveDisabled;
  final Color controlItemBgActiveHover;
  final Color controlItemBgHover;
  final Color controlOutline;
  final double controlOutlineWidth;
  final double controlPaddingHorizontal;
  final double controlPaddingHorizontalSM;
  final double fontSizeIcon;
  final double fontWeightStrong;
  final double lineWidthFocus;
  final double margin;
  final double marginLG;
  final double marginMD;
  final double marginSM;
  final double marginXL;
  final double marginXS;
  final double marginXXL;
  final double marginXXS;
  final double opacityLoading;
  final double padding;
  final double paddingContentHorizontal;
  final double paddingContentHorizontalLG;
  final double paddingContentHorizontalSM;
  final double paddingContentVertical;
  final double paddingContentVerticalLG;
  final double paddingContentVerticalSM;
  final double paddingLG;
  final double paddingMD;
  final double paddingSM;
  final double paddingXL;
  final double paddingXS;
  final double paddingXXS;

  final Brightness brightness;

  factory AntThemeData.light() => AntThemeData(brightness: Brightness.light);

  factory AntThemeData.dark() => AntThemeData(brightness: Brightness.dark);

  factory AntThemeData.fallback() => AntThemeData.light();

  static AntThemeData of(BuildContext context) {
    // final _InheritedTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return AntThemeData();
  }

  static AntThemeData localize(
    AntThemeData? baseTheme,
    AntThemeData? localTextGeometry,
  ) {
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
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.grey,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorBgBase,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
      ), dialogTheme: DialogThemeData(backgroundColor: colorBgBase),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

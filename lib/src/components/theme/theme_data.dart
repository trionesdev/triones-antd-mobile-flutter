library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AntdThemeData with Diagnosticable {
  factory AntdThemeData(){
    return AntdThemeData.raw(

    );
  }

  const AntdThemeData.raw();

  ThemeData toMaterialThemeData(){
    return ThemeData();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
library;

import 'package:flutter/material.dart';
import '../theme/theme_data.dart';

class AntdApp extends StatelessWidget {
  const AntdApp({super.key, this.title, this.theme, this.home});

  final String? title;
  final AntdThemeData? theme;
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: theme?.toMaterialThemeData(),
      home: home,
    );
  }
}

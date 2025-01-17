library;

import 'package:flutter/material.dart';
import '../theme/theme_data.dart';

class AntdApp extends StatelessWidget {
  const AntdApp(
      {super.key,
      this.title,
      this.theme,
      this.home,
      this.routes = const <String, WidgetBuilder>{}});

  final String? title;
  final AntdThemeData? theme;
  final Widget? home;
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: theme?.toMaterialThemeData(),
      home: home,
      routes: routes,
    );
  }
}

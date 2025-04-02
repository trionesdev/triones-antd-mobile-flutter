library;

import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import '../theme/theme_data.dart';

enum AntThemeMode {
  system,
  light,
  dark,
}

class AntApp extends StatelessWidget {
  const AntApp(
      {super.key,
      this.title,
      this.theme,
      this.home,
      this.routes = const <String, WidgetBuilder>{},
      this.onGenerateRoute,
      this.navigatorKey,
      this.initialRoute});

  const AntApp.router({
    super.key,
    this.title,
    this.theme,
    this.home,
    required this.routes,
    this.onGenerateRoute,
    this.navigatorKey,
    this.initialRoute,
  });

  final String? title;
  final AntThemeData? theme;
  final Widget? home;
  final Map<String, WidgetBuilder> routes;
  final RouteFactory? onGenerateRoute;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return material.MaterialApp(
      title: title,
      theme: theme?.toMaterialThemeData(),
      home: home,
      routes: routes,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigatorKey,
      initialRoute: initialRoute,
    );
  }
}

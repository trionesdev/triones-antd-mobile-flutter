library;

import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import '../../../antd.dart';

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
      this.initialRoute,
      this.scaffoldMessengerKey,
      this.onGenerateInitialRoutes,
      this.onUnknownRoute,
      this.onNavigationNotification,
      this.navigatorObservers,
      this.routeInformationProvider,
      this.routeInformationParser,
      this.routerDelegate,
      this.backButtonDispatcher,
      this.routerConfig,
      this.builder,
      this.onGenerateTitle,
      this.darkTheme,
      this.highContrastTheme,
      this.highContrastDarkTheme,
      this.themeMode,
      required this.themeAnimationDuration,
      required this.themeAnimationCurve,
      this.color,
      this.locale,
      this.localizationsDelegates,
      this.localeListResolutionCallback,
      this.localeResolutionCallback,
      required this.supportedLocales,
      required this.showPerformanceOverlay,
      required this.checkerboardRasterCacheImages,
      required this.checkerboardOffscreenLayers,
      required this.showSemanticsDebugger,
      required this.debugShowCheckedModeBanner,
      this.shortcuts,
      this.actions,
      this.restorationScopeId,
      this.scrollBehavior,
      required this.debugShowMaterialGrid,
      this.themeAnimationStyle});

  const AntApp.router({
    super.key,
    this.scaffoldMessengerKey,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.onNavigationNotification,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = AntThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.themeAnimationStyle,
  })  : assert(routerDelegate != null || routerConfig != null),
        navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null;

  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<AntScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final NotificationListenerCallback<NavigationNotification>?
      onNavigationNotification;
  final List<NavigatorObserver>? navigatorObservers;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final RouterConfig<Object>? routerConfig;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final AntThemeData? theme;
  final AntThemeData? darkTheme;
  final AntThemeData? highContrastTheme;
  final AntThemeData? highContrastDarkTheme;
  final AntThemeMode? themeMode;
  final Duration themeAnimationDuration;
  final Curve themeAnimationCurve;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final bool debugShowMaterialGrid;
  final AnimationStyle? themeAnimationStyle;

  material.ThemeMode getThemeMode() {
    switch (themeMode) {
      case AntThemeMode.system:
        return material.ThemeMode.system;
      case AntThemeMode.light:
        return material.ThemeMode.light;
      case AntThemeMode.dark:
        return material.ThemeMode.dark;
      case null:
        return material.ThemeMode.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    return material.MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: home,
      routes: routes ?? const <String, WidgetBuilder>{},
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme?.toMaterialThemeData(),
      darkTheme: darkTheme?.toMaterialThemeData(),
      highContrastTheme: highContrastTheme?.toMaterialThemeData(),
      highContrastDarkTheme: highContrastDarkTheme?.toMaterialThemeData(),
      themeMode: getThemeMode(),
      themeAnimationDuration: themeAnimationDuration,
      themeAnimationCurve: themeAnimationCurve,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior,
      themeAnimationStyle: themeAnimationStyle,
    );
  }
}

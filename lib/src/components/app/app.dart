library;

import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import '../../../trionesdev_antd_mobile.dart';

enum AntThemeMode {
  system,
  light,
  dark,
}

material.ThemeMode toMaterialThemeMode(AntThemeMode? value) {
  switch (value) {
    case AntThemeMode.light:
      return material.ThemeMode.light;
    case AntThemeMode.dark:
      return material.ThemeMode.dark;
    case AntThemeMode.system:
    case null:
      return material.ThemeMode.system;
  }
}

///@component App 应用
class AntApp extends StatelessWidget {
  const AntApp({
    super.key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    Map<String, WidgetBuilder> this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.onNavigationNotification,
    List<NavigatorObserver> this.navigatorObservers =
        const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
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
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null,
        _usesRouter = false;

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
        initialRoute = null,
        _usesRouter = true;

  final bool _usesRouter;

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
  final Duration? themeAnimationDuration;
  final Curve? themeAnimationCurve;
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

  GlobalKey<material.ScaffoldMessengerState>? get _materialScaffoldMessengerKey {
    final key = scaffoldMessengerKey;
    if (key == null) {
      return null;
    }
    return key as GlobalKey<material.ScaffoldMessengerState>;
  }

  AntThemeData _resolveAntTheme(BuildContext context) {
    final brightness = material.Theme.of(context).brightness;
    if (brightness == Brightness.dark) {
      return darkTheme ?? theme ?? AntThemeData.fallback();
    }
    return theme ?? AntThemeData.fallback();
  }

  Widget _buildAppChild(BuildContext context, Widget? child) {
    final Widget content =
        builder?.call(context, child) ?? child ?? const SizedBox.shrink();
    return AntTheme(
      data: _resolveAntTheme(context),
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    final material.ThemeMode materialThemeMode = toMaterialThemeMode(themeMode);
    final Duration animationDuration =
        themeAnimationDuration ?? kThemeAnimationDuration;
    final Curve animationCurve = themeAnimationCurve ?? Curves.linear;

    if (_usesRouter) {
      return material.MaterialApp.router(
        scaffoldMessengerKey: _materialScaffoldMessengerKey,
        routeInformationProvider: routeInformationProvider,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
        routerConfig: routerConfig,
        backButtonDispatcher: backButtonDispatcher,
        builder: _buildAppChild,
        title: title,
        onGenerateTitle: onGenerateTitle,
        onNavigationNotification: onNavigationNotification,
        color: color,
        theme: theme?.toMaterialThemeData(),
        darkTheme: darkTheme?.toMaterialThemeData(),
        highContrastTheme: highContrastTheme?.toMaterialThemeData(),
        highContrastDarkTheme: highContrastDarkTheme?.toMaterialThemeData(),
        themeMode: materialThemeMode,
        themeAnimationDuration: animationDuration,
        themeAnimationCurve: animationCurve,
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

    return material.MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: _materialScaffoldMessengerKey,
      home: home,
      routes: routes ?? const <String, WidgetBuilder>{},
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      onNavigationNotification: onNavigationNotification,
      navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
      builder: _buildAppChild,
      title: title ?? '',
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme?.toMaterialThemeData(),
      darkTheme: darkTheme?.toMaterialThemeData(),
      highContrastTheme: highContrastTheme?.toMaterialThemeData(),
      highContrastDarkTheme: highContrastDarkTheme?.toMaterialThemeData(),
      themeMode: materialThemeMode,
      themeAnimationDuration: animationDuration,
      themeAnimationCurve: animationCurve,
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

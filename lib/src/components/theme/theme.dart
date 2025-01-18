import 'package:flutter/cupertino.dart';
import 'package:trionesdev_antd/src/components/theme/theme_data.dart';

class AntdTheme extends StatelessWidget{


  final AntdThemeData data;
  final Widget child;

  const AntdTheme({super.key,required this.data,required this.child});
  static final AntdThemeData _kFallbackTheme = AntdThemeData.fallback();

  static AntdThemeData of(BuildContext context){
    final _InheritedTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return AntdThemeData.localize(null, null);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    required this.theme,
    required super.child,
  });

  final AntdTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AntdTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}
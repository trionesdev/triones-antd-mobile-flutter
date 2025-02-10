
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd/src/components/theme/theme_data.dart';

class Theme extends StatelessWidget{


  final ThemeData data;
  final Widget child;

  const Theme({super.key,required this.data,required this.child});
  static final ThemeData _kFallbackTheme = ThemeData.fallback();

  static ThemeData of(BuildContext context){
    final _InheritedTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return ThemeData.localize(null, null);
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

  final Theme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return Theme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}
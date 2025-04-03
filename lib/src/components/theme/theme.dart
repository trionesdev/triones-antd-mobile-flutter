
import 'package:flutter/widgets.dart';

import '../../../antd.dart';

const Duration kThemeAnimationDuration = Duration(milliseconds: 200);

class AntTheme extends StatelessWidget{


  final AntThemeData data;
  final Widget child;

  const AntTheme({super.key,required this.data,required this.child});
  static final AntThemeData _kFallbackTheme = AntThemeData.fallback();

  static AntThemeData of(BuildContext context){
    final _InheritedTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return AntThemeData.localize(null, null);
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

  final AntTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AntTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}
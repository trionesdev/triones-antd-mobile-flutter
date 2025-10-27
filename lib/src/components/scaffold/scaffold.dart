import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AntScaffold extends StatefulWidget {
  const AntScaffold({super.key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.backgroundColor = Colors.white,
    this.bottomSheet});

  /// 顶部导航栏
  final PreferredSizeWidget? appBar;

  /// 主体内容
  final Widget? body;

  /// 底部导航栏
  final Widget? bottomNavigationBar;

  /// 背景色
  final Color? backgroundColor;
  final Widget? bottomSheet;

  @override
  State<StatefulWidget> createState() => _AntScaffoldState();
}

class _AntScaffoldState extends State<AntScaffold> {
  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     systemNavigationBarColor: Color(0xffffffff),
    //     systemNavigationBarIconBrightness: Brightness.light,
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar ,
      backgroundColor: widget.backgroundColor,
      bottomSheet: widget.bottomSheet,
    );
  }
}


class AntScaffoldMessenger extends ScaffoldMessenger {
  const AntScaffoldMessenger({super.key, required super.child});
}

class AntScaffoldMessengerState extends ScaffoldMessengerState {
}

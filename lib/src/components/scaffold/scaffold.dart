import 'package:flutter/material.dart';

class AntScaffoldMessengerState extends ScaffoldMessengerState{}

class AntScaffold extends StatefulWidget {
  const AntScaffold(
      {super.key,
      this.appBar,
      this.body,
      this.bottomNavigationBar,
      this.backgroundColor = Colors.white});

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  State<StatefulWidget> createState() => _AntScaffoldState();
}

class _AntScaffoldState extends State<AntScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar,
      backgroundColor: widget.backgroundColor,
    );
  }
}

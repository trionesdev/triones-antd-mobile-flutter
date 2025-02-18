import 'package:flutter/material.dart';

class AntPageContainer extends StatefulWidget {
  const AntPageContainer({super.key, this.appBar, this.body, this.bottomNavigationBar});
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;

  @override
  State<StatefulWidget> createState() => _AntPageContainerState();
}

class _AntPageContainerState extends State<AntPageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
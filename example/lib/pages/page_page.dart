import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd/antd.dart';

class PagePage extends StatefulWidget {
  const PagePage({super.key});

  @override
  State<StatefulWidget> createState() => _PagePageState();
}

class _PagePageState extends State<PagePage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer();
  }
}

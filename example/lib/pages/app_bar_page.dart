import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd/antd.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<StatefulWidget> createState()=> _AppBarPageState();

}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: Text('AppBar'),
        back: true,
        left: [],
        right: [],
        childHeight: 20,
        child: Text('AppBar'),
      ),
    );
  }

}

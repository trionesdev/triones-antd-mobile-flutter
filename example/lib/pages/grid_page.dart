import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd/antd.dart';

class GridPage extends StatefulWidget{
  const GridPage({super.key});

  @override
  State<StatefulWidget> createState() => _GridPageState();

}

class _GridPageState extends State<GridPage>{
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      body: AntGrid(),
    );
  }

}
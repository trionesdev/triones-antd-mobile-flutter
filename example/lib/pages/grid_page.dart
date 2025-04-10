import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<StatefulWidget> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: Text('Grid 栅格'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(title: "基本使用",child: AntGrid(
              columns: 4,
              gap: 2,
              children: [
                AntGridItem(
                  span: 1,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("111"),
                ),
                AntGridItem(
                  span: 2,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("111"),
                ),
                AntGridItem(
                  span: 1,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("111"),
                ),
                AntGridItem(
                  span: 1,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("111"),
                ),
                AntGridItem(
                  span: 1,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("111"),
                ),
                AntGridItem(
                  span: 1,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("111"),
                ),
                AntGridItem(
                  span: 1,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("111"),
                )
              ],
            ),)
          ],
        ),
      ),
    );
  }
}

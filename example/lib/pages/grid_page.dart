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
        title: Text('Grid'),
        back: true,
      ),
      body: AntGrid(
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
      ),
    );
  }
}

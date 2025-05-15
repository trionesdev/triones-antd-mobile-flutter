import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text("Scaffold 脚手架"),),
      bottomNavigationBar: AntTabBar(
        children: [
          AntTabBarItem(
            icon: Icon(Icons.home),
            label: Text("首页"),
            antKey: 'index',
          ),
          AntTabBarItem(
            icon: Icon(Icons.search),
            label: Text("搜索"),
            antKey: 'search',
          ),
          AntTabBarItem(
            icon: Icon(Icons.person),
            label: Text("我的"),
            antKey: 'my',
          ),
        ],
      ),
    );
  }
}

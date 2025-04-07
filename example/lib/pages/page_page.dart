import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class PagePage extends StatefulWidget {
  const PagePage({super.key});

  @override
  State<StatefulWidget> createState() => _PagePageState();
}

class _PagePageState extends State<PagePage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      bottomNavigationBar: AntTabBar(
        children: [
          AntTabBarItem(
            icon: Icon(Icons.home),
            label: Text("首页"),
            tabKey: 'index',
          ),
          AntTabBarItem(
            icon: Icon(Icons.search),
            label: Text("搜索"),
            tabKey: 'search',
          ),
          AntTabBarItem(
            icon: Icon(Icons.person),
            label: Text("我的"),
            tabKey: 'my',
          ),
        ],
      ),
    );
  }
}

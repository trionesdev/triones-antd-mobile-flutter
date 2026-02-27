import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text("TabBar")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "TabBar",
              child: Column(
                children: [
                  AntTabBar(
                    children: [
                      AntTabBarItem(
                        icon: Icon(Icons.home),
                        label: Text("首页"),
                        antKey: 'index',
                        activeColor: Color(0xff1677FF),
                        onPressed: (String id) {
                          print(id);
                        },
                      ),
                      AntTabBarItem(
                        icon: Icon(Icons.search),
                        label: Text("搜索"),
                        antKey: 'search',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "TabBar",
              child: Column(
                children: [
                  AntTabBar(
                    children: [
                      AntTabBarItem(
                        icon: Icon(Icons.home),
                        activeIcon: Icon(Icons.account_box),
                        labelText: "首页",
                        antKey: 'index',
                        activeColor: Color(0xff1677FF),
                        onPressed: (String id) {
                          print(id);
                        },
                      ),
                      AntTabBarItem(
                        icon: Icon(Icons.search),
                        labelText: "搜索",
                        antKey: 'search',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

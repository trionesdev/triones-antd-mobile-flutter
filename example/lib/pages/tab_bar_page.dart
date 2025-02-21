import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        appBar: AntAppBar(
          title: Text("TabBar"),
        ),
        bottomNavigationBar: AntTabBar(items: [
          AntTabBarItem(
              icon: Icons.home,
              label: "首页",
              id: 'index',
              activeColor: Color(0xff1677FF),
              onPressed: (String id) {
                print(id);
              }),
          AntTabBarItem(
            icon: Icons.search,
            label: "搜索",
            id: 'search',
          )
        ]));
  }
}

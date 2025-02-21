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
        items: [
          AntTabBarItem(
            icon: Icons.home,
            label: "首页",
            id: 'index',
          ),
          AntTabBarItem(
            icon: Icons.search,
            label: "搜索",
            id: 'search',
          ),
          AntTabBarItem(
            icon: Icons.person,
            label: "我的",
            id: 'my',
          ),
        ],
      ),
    );
  }
}

import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("AppBar 导航栏"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本使用",
              child: AntAppBar(
                title: Text("标题"),
              ),
            ),
            DemoBlock(
              title: "返回按钮显示文字",
              child: AntAppBar(
                backText: Text("返回"),
                title: Text("标题"),
              ),
            ),
            DemoBlock(
              title: "自定义icon",
              child: AntAppBar(
                backIcon: Icon(Icons.chevron_left_outlined),
                title: Text("标题"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class BadgePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BadgePageState();
}

class _BadgePageState extends State<BadgePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("Badge 徽标"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基础使用",
              child: Wrap(
                spacing: 10,
                children: [
                  AntBadge(
                    count: 5,
                    child: Icon(Icons.notifications),
                  ),
                  AntBadge(label: Text("新"), child: Icon(Icons.notifications)),
                  AntBadge(child: Icon(Icons.notifications)),
                ],
              ),
            ),
            DemoBlock(
              title: "独立使用",
              child: Wrap(
                children: [
                  AntBadge(
                      label: Text("更新啦"), child: Icon(Icons.notifications)),
                ],
              ),
            ),
            DemoBlock(
              title: "独立使用",
              child: Wrap(
                spacing: 10,
                children: [
                  AntBadge(count: 5),
                  AntBadge(label: Text("更新啦！")),
                ],
              ),
            ),
            DemoBlock(
              title: "自定义颜色和偏移量",
              child: Wrap(
                spacing: 10,
                children: [
                  AntBadge(
                      alignment: Alignment.bottomLeft,
                      child: Icon(Icons.notifications)),
                  AntBadge(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.notifications)),
                  AntBadge(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.notifications)),
                  AntBadge(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.notifications)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

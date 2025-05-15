import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../demo_block.dart';

class EmptyPage extends StatefulWidget {
  const EmptyPage({super.key});

  @override
  State<StatefulWidget> createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: const Text('Empty 空页面'),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              DemoBlock(
                title: "基本使用",
                child: AntEmpty(),
              ),
              DemoBlock(
                title: "自定义内容",
                child: AntEmpty(
                  image: Icon(
                    Icons.hourglass_empty,
                    color: Colors.grey,
                  ),
                ),
              )
            ])));
  }
}

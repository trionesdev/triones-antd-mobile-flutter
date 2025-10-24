import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<StatefulWidget> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: const Text('Card 卡片'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DemoBlock(
                title: "基本用法",
                child: Column(children: [
                  AntCard(
                    titleWidget: const Text('Card Title'),
                    extraWidget: const Icon(Icons.more_horiz_rounded),
                    child: const Text('Card Content'),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}

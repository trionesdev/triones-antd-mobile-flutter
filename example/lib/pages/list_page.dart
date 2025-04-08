import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic> list = [
    {"name": "A"},
    {"name": "B"},
    {"name": "C"},
    {"name": "D"},
    {"name": "E"},
  ];

  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        appBar: AntAppBar(
          title: const Text("List"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DemoBlock(
                title: "基本用法",
                child: Container(
                  height: 300,
                  child: AntList(
                    dataSource: list,
                    itemBuilder: (context, item, index) {
                      return AntListItem(
                        style: StateStyle(
                            style: const Style(
                                borderBottom: StyleBorder(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid))),
                        icon: const Icon(Icons.person),
                        title: Text(item["name"]),
                        extra: Icon(Icons.chevron_right_outlined),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

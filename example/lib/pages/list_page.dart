import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ListPage extends StatefulWidget{
  const ListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>{

  List<dynamic> list = [
    {"name":"A"},
    {"name":"B"},
    {"name":"C"},
    {"name":"D"},
    {"name":"E"},
  ];

  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: const Text("List"),
      ),
      body: AntList(
        dataSource: list,
        itemRender: (context,item, index){
          return AntListItem(
            style: const StateStyle(
              backgroundColor: Colors.red,
              fontSize: 20,
            ),
            icon: const Icon(Icons.person),
            title: Text(item["name"]),
            extra: Icon(Icons.arrow_circle_right),
          );
        },
      )
    );
  }

}
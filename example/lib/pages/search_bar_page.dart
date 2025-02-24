import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: Text("SearchBar"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: 10,

          children: [
            AntSearchBar(),
            AntSearchBar(placeholder: "请输入查询条件",),
          ],
        ),
      ),
    );
  }
}

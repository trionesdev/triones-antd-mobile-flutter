import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class BreadcrumbPage extends StatefulWidget {
  const BreadcrumbPage({super.key});

  @override
  State<StatefulWidget> createState() => _BreadcrumbPageState();
}

class _BreadcrumbPageState extends State<BreadcrumbPage> {
  final _breadcrumbs = [
    AntBreadcrumbItemRecord(title: '首页'),
    AntBreadcrumbItemRecord(title: '应用中心'),
    AntBreadcrumbItemRecord(title: '应用列表'),
    AntBreadcrumbItemRecord(title: '书阙'),
    AntBreadcrumbItemRecord(title: '文章'),
  ];

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: const Text('Breadcrumb 面包屑'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DemoBlock(
              title: "基本使用",
              child: AntBreadcrumb(items: _breadcrumbs),
            ),
            DemoBlock(
              title: "自定义分隔符",
              child: AntBreadcrumb(
                  items: _breadcrumbs, separator: const Text('>')),
            ),
            DemoBlock(
              title: "自定义渲染",
              child: Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: AntBreadcrumb(
                  items: _breadcrumbs, separator: const Text('>>'),itemRender: (item,index) {
                  return Text(item.title??'',style: TextStyle(fontSize: 20,color: Colors.blueAccent),);
                },),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

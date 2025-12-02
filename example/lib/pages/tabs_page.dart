import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<AntTabItemStruct> _tabItems = [
    AntTabItemStruct(key: "1", label: Text("Tab1"),content: Text("Tab1 Content")),
    AntTabItemStruct(key: "2", label: Text("Tab2"),content: Text("Tab2 Content")),
    AntTabItemStruct(key: "3", label: Text("Tab3"),content: Text("Tab3 Content")),
  ];

  final List<AntTabItemStruct> _tabItems2 = [
    AntTabItemStruct(key: "1", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab1" ),),content: Text("Tab1 Content 1")),
    AntTabItemStruct(key: "2", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab2" ),),content: Text("Tab1 Content 2")),
    AntTabItemStruct(key: "3", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab3" ),),content: Text("Tab1 Content 3")),
    AntTabItemStruct(key: "4", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab4" ),),content: Text("Tab1 Content 4")),
    AntTabItemStruct(key: "5", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab5" ),),content: Text("Tab1 Content 5")),
    AntTabItemStruct(key: "6", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab6" ),),content: Text("Tab1 Content 6")),
    AntTabItemStruct(key: "7", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab7" ),),content: Text("Tab1 Content 7")),
    AntTabItemStruct(key: "8", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab8" ),),content: Text("Tab1 Content 8")),
    AntTabItemStruct(key: "9", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab9" ),),content: Text("Tab1 Content 9")),
    AntTabItemStruct(key: "10", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab10" ),),content: Text("Tab1 Content 10")),
  ];

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("Tabs 标签页"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本用法",
              child: Container(
                height: 100,
                child: AntTabs(
                  items: _tabItems,
                ),
              ),
            ),
            DemoBlock(
              title: "滚动展示",
              child: Container(
                height: 100,
                child: AntTabs(
                  items: _tabItems2,
                  stretch: false,
                ),
              ),
            ),
            DemoBlock(
              title: "Widget方式",
              child: Container(
                height: 100,
                child: AntTabs(
                  stretch: true,
                  children: [
                    AntTab(
                      antKey: "tab1",
                      label: Text("Tab1"),
                      child: Text("Tab1 Content"),
                    ),
                    AntTab(
                      antKey: "tab2",
                      label: Text("Tab2"),
                      child: Text("Tab2 Content"),
                    ),
                  ],
                ),
              ),
            ),
            DemoBlock(
              title: "默认激活Tab",
              child: Container(
                height: 100,
                child: AntTabs(
                  stretch: true,
                  defaultActiveKey: "tab2",
                  children: [
                    AntTab(
                      antKey: "tab1",
                      label: Text("Tab1"),
                      child: Text("Tab1 Content"),
                    ),
                    AntTab(
                      antKey: "tab2",
                      label: Text("Tab2"),
                      child: Text("Tab2 Content"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<AntTabItem> _tabItems = [
    AntTabItem(key: "1", label: Text("Tab1"),content: Text("Tab1 Content")),
    AntTabItem(key: "2", label: Text("Tab2"),content: Text("Tab2 Content")),
    AntTabItem(key: "3", label: Text("Tab3"),content: Text("Tab3 Content")),
  ];

  final List<AntTabItem> _tabItems2 = [
    AntTabItem(key: "1", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab1" ),),content: Text("Tab1 Content 1")),
    AntTabItem(key: "2", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab2" ),),content: Text("Tab1 Content 2")),
    AntTabItem(key: "3", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab3" ),),content: Text("Tab1 Content 3")),
    AntTabItem(key: "4", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab4" ),),content: Text("Tab1 Content 4")),
    AntTabItem(key: "5", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab5" ),),content: Text("Tab1 Content 5")),
    AntTabItem(key: "6", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab6" ),),content: Text("Tab1 Content 6")),
    AntTabItem(key: "7", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab7" ),),content: Text("Tab1 Content 7")),
    AntTabItem(key: "8", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab8" ),),content: Text("Tab1 Content 8")),
    AntTabItem(key: "9", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab9" ),),content: Text("Tab1 Content 9")),
    AntTabItem(key: "10", label: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text("Tab10" ),),content: Text("Tab1 Content 10")),
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
                      content: Text("Tab1 Content"),
                    ),
                    AntTab(
                      antKey: "tab2",
                      label: Text("Tab2"),
                      content: Text("Tab2 Content"),
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
                      content: Text("Tab1 Content"),
                    ),
                    AntTab(
                      antKey: "tab2",
                      label: Text("Tab2"),
                      content: Text("Tab2 Content"),
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

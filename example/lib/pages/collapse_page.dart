import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CollapsePage extends StatefulWidget {
  const CollapsePage({super.key});

  @override
  State<StatefulWidget> createState() => _CollapsePageState();
}

class _CollapsePageState extends State<CollapsePage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: const Text('折叠面板'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DemoBlock(
                title: '基本用法',
                child: AntCollapse(
                  children: [
                    AntCollapsePanel(
                      antKey: "1",
                      title: Text("第一项"),
                      content: Container(
                          child: Text(
                              "Id magna excepteur ullamco sit magna ullamco nostrud. Quis quis irure anim aliquip consectetur nisi laboris mollit ex labore proident. Anim ad consequat culpa voluptate velit enim anim amet occaecat Lorem mollit ullamco. Commodo velit sit et Lorem eiusmod mollit nulla occaecat fugiat ullamco est ut Lorem excepteur. Laboris deserunt qui ut ex excepteur aliquip occaecat non culpa. Esse nulla et mollit exercitation dolore aliqua culpa aute id voluptate consequat. Sunt aute voluptate mollit qui fugiat ut et consectetur nulla aliqua.")),
                    ),
                    AntCollapsePanel(
                      antKey: "2",
                      title: Text("第二项"),
                      content: Text("这里是第二项"),
                    ),
                    AntCollapsePanel(
                      antKey: "3",
                      title: Text("第三项"),
                      content: Text("这里是第三项"),
                    ),
                  ],
                ),
              ),
              DemoBlock(
                title: '手风琴模式',
                child: AntCollapse(
                  accordion: true,
                  children: [
                    AntCollapsePanel(
                      antKey: "1",
                      title: Text("第一项"),
                      content: Container(
                          child: Text(
                              "Id magna excepteur ullamco sit magna ullamco nostrud. Quis quis irure anim aliquip consectetur nisi laboris mollit ex labore proident. Anim ad consequat culpa voluptate velit enim anim amet occaecat Lorem mollit ullamco. Commodo velit sit et Lorem eiusmod mollit nulla occaecat fugiat ullamco est ut Lorem excepteur. Laboris deserunt qui ut ex excepteur aliquip occaecat non culpa. Esse nulla et mollit exercitation dolore aliqua culpa aute id voluptate consequat. Sunt aute voluptate mollit qui fugiat ut et consectetur nulla aliqua.")),
                    ),
                    AntCollapsePanel(
                      antKey: "2",
                      title: Text("第二项"),
                      content: Text("这里是第二项"),
                    ),
                    AntCollapsePanel(
                      antKey: "3",
                      title: Text("第三项"),
                      content: Text("这里是第三项"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

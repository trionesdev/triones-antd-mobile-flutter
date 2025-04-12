import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class TagPage extends StatefulWidget {
  const TagPage({super.key});

  @override
  State<StatefulWidget> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: Text('Tag'),
        ),
        body: ListView(
          children: [
            DemoBlock(
              title: "基础使用",
              child: Wrap(
                spacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  AntTag(
                    child: Text("Tag1"),
                  ),
                  AntTag(
                    closeable: true,
                    child: Text("Link"),
                  ),
                  AntTag(
                    closeable: true,
                    closeIcon: Icon(Icons.cancel_outlined),
                    child: Text("Default"),
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "类型",
              child: Wrap(
                spacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  AntTag(
                    type: AntTagType.success,
                    child: Text("Tag1"),
                  ),
                  AntTag(
                    type: AntTagType.processing,
                    child: Text("Tag1"),
                  ),
                  AntTag(
                    type: AntTagType.warning,
                    child: Text("Tag1"),
                  ),
                  AntTag(
                    type: AntTagType.error,
                    child: Text("Tag1"),
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "自定义颜色",
              child: Wrap(
                spacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  AntTag(
                    color: Color(0xff2db7f5),
                    child: Text("Tag1"),
                  ),
                  AntTag(
                    color: Color(0xff87d068),
                    child: Text("Tag1"),
                  ),
                  AntTag(
                    color: Color(0xff108ee9),
                    child: Text("Tag1"),
                  ),
                  AntTag(
                    color: Colors.red,
                    child: Text("Tag1"),
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "自定义样式",
              child: Wrap(
                spacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  AntTag(
                    style: StateStyle(
                      style: Style(
                          color: Colors.white,
                          backgroundColor: Color(0xff6c2121),
                          border: StyleBorder(),
                          borderRadius: 0),
                    ),
                    child: Text("Tag1"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

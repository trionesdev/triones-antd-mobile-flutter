import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../demo_block.dart';

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<StatefulWidget> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: const Text('Toast'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          DemoBlock(
              title: "基本使用",
              child: Column(spacing: 10, children: [
                AntButton(
                    text: "轻提示",
                    onPressed: () {
                      AntToast.show(
                          context: context,
                          content: Text("Hello World, This is a long text"));
                    }),
              ])),
          DemoBlock(
            title: "图标",
            child: Wrap(
              spacing: 10,
              children: [
                AntButton(
                  text: "成功",
                  onPressed: () {
                    AntToast.show(
                        context: context,
                        icon: Icon(Icons.check),
                        content: Text("操作成功"));
                  },
                ),
                AntButton(
                  text: "失败",
                  onPressed: () {
                    AntToast.show(
                        context: context,
                        icon: Icon(Icons.close),
                        content: Text("操作失败"));
                  },
                )
              ],
            ),
          ),
          DemoBlock(
            title: "位置",
            child: Wrap(
              spacing: 10,
              children: [
                AntButton(
                  text: "顶部",
                  onPressed: () {
                    AntToast.show(
                        context: context,
                        position: AntToastPosition.top,
                        content: Text("顶部显示"));
                  },
                ),
                AntButton(
                  text: "底部",
                  onPressed: () {
                    AntToast.show(
                        context: context,
                        position: AntToastPosition.bottom,
                        content: Text("底部显示"));
                  },
                ),
              ],
            ),
          )
        ])));
  }
}

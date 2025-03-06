import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import '../demo_block.dart';

class ModalPage extends StatefulWidget {
  const ModalPage({super.key});

  @override
  State<StatefulWidget> createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        appBar: AntAppBar(
          title: const Text('Modal'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          DemoBlock(
              title: "基本使用",
              child: Column(
                spacing: 10,
                children: [
                  AntButton(
                      block: true,
                      text: "最简单的弹窗",
                      onPressed: () {
                        AntModal.alert(
                            context: context, content: Text("人在天边月上明"));
                      }),
                  AntButton(
                      block: true,
                      text: "点击遮罩关闭",
                      onPressed: () {
                        AntModal.alert(
                            context: context,
                            closeOnMaskClick: true,
                            content: Text("人在天边月上明"));
                      }),
                  AntButton(
                      block: true,
                      text: "显示关闭图标",
                      onPressed: () {
                        AntModal.alert(
                            context: context,
                            title: "带关闭图标的弹窗",
                            content: Text("右上角有个关闭的小图标，点击它也可以关闭弹窗"),
                            showCloseButton: true);
                      })
                ],
              )),
          DemoBlock(
            title: "操作按钮",
            child: Column(
              spacing: 10,
              children: [
                AntButton(
                  block: true,
                  text: "自定义按钮",
                  onPressed: () {
                    AntModal.show(
                        context: context,
                        content: Text("人在天边月上明，风初紧，吹入画帘旌"),
                        closeOnAction: true,
                        actions: [
                          AntButton(
                            block: true,
                            type: ButtonType.primary,
                            text: "在线阅读",
                            onPressed: () {
                              print("在线阅读");
                            },
                          ),
                          AntButton(
                            block: true,
                            text: "下载文件",
                            onPressed: () {
                              print("下载文件");
                            },
                          ),
                          AntButton(
                            block: true,
                            text: "分享",
                            onPressed: () {
                              print("分享");
                            },
                          )
                        ]);
                  },
                ),
                AntButton(
                  block: true,
                  text: "无按钮操作",
                  onPressed: () {
                    AntModal.show(
                      context: context,
                      content: Text("人在天边月上明，风初紧，吹入画帘旌,人在天边月上明，风初紧，吹入画帘旌"),
                      closeOnMaskClick: true,
                    );
                  },
                )
              ],
            ),
          ),
          DemoBlock(
            title: "确认",
            child: Column(
              children: [
                AntButton(
                  block: true,
                  text: "确认",
                  onPressed: () {
                    AntModal.confirm(context: context, content: Text("人在天边月上明，风初紧，吹入画帘旌"));
                  },
                )
              ],
            ),
          )
        ])));
  }
}

import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<StatefulWidget> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: Text("Dialog 对话框"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DemoBlock(
                title: "基本使用",
                child: Column(
                  spacing: 8,
                  children: [
                    AntButton(
                      block: true,
                      text: "最简单的小对话框",
                      onPressed: () {
                        AntDialog.alert(
                            context: context,
                            content: Container(
                              alignment: Alignment.center,
                              child: Text("人在天边月上明"),
                            ),
                            onConfirm: () {
                              Navigator.maybePop(context);
                            });
                      },
                    ),
                    AntButton(
                      block: true,
                      text: "点击遮罩层关闭",
                      onPressed: () {
                        AntDialog.alert(
                            context: context,
                            closeOnMaskClick: true,
                            content: Container(
                              alignment: Alignment.center,
                              child: Text("点击遮罩层关闭"),
                            ),
                            onConfirm: () {
                              Navigator.maybePop(context);
                            });
                      },
                    )
                  ],
                ),
              ),
              DemoBlock(
                title: "确认框",
                child: Column(
                  spacing: 8,
                  children: [
                    AntButton(
                      block: true,
                      text: "确定",
                      onPressed: () {
                        AntDialog.confirm(
                            context: context,
                            content: Container(
                              alignment: Alignment.center,
                              child: Text("是否提交申请"),
                            ),
                            onConfirm: () {
                              Navigator.maybePop(context);
                            });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

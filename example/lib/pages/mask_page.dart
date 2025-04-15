import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import '../demo_block.dart';

class MaskPage extends StatefulWidget {
  const MaskPage({super.key});

  @override
  State<StatefulWidget> createState() => _MaskPageState();
}

class _MaskPageState extends State<MaskPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("Mask 背景蒙层"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基础使用",
              child: Column(
                children: [
                  AntButton(
                    text: "显示",
                    block: true,
                    onPressed: () {
                      AntMask.show(
                          context: context,
                          clickMaskClose: true,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.white,
                            child: Text("背景蒙层"),
                          ));
                    },
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "全屏",
              child: Column(
                children: [
                  AntButton(
                    text: "全屏",
                    block: true,
                    onPressed: () {
                      AntMask.show(
                          context: context,
                          clickMaskClose: true,
                          child: AntScaffold(
                            appBar: AntAppBar(
                              title: Text("全屏"),
                            ),
                          ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

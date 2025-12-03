import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({super.key});

  @override
  State<StatefulWidget> createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: const Text("Steps 步骤条")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基础用法",
              child: AntSteps(
                current: 1,
                children: [
                  AntStepItem(title: Text("步骤1")),
                  AntStepItem(title: Text("步骤2"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤3"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤3"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤3"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤3"), subTitle: Text("描述信息")),
                ],
              ),
            ),
            DemoBlock(
              title: "横向步骤条失败",
              child: AntSteps(
                current: 2,
                children: [
                  AntStepItem(title: Text("步骤1")),
                  AntStepItem(title: Text("步骤2"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤3"), subTitle: Text("描述信息"), status: AntStepStatus.error),
                  AntStepItem(title: Text("步骤4"), subTitle: Text("描述信息")),
                ],
              ),
            ),
            DemoBlock(
              title: "纵向步骤条",
              child: AntSteps(
                direction: AntStepsDirection.vertical,
                children: [
                  AntStepItem(title: Text("步骤1")),
                  AntStepItem(title: Text("步骤2"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤3"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤4"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤5"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤6"), subTitle: Text("描述信息")),
                  AntStepItem(title: Text("步骤7"), subTitle: Text("描述信息收拾收拾双手合十试婚纱胡莎莎婚纱啥啥啥是收拾收拾手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手抓手")),
                ],
              ),
            ),
            DemoBlock(
              title: "自定义图标及大小",
              child: AntSteps(
                direction: AntStepsDirection.vertical,
                children: [
                  AntStepItem(title: Text("步骤1"), icon: Icon(Icons.check_circle) ),
                  AntStepItem(title: Text("步骤2"), subTitle: Text("描述信息"),icon: Icon(Icons.check_circle) ),
                  AntStepItem(title: Text("步骤3"), subTitle: Text("描述信息"),icon: Icon(Icons.check_circle) ),
                  AntStepItem(title: Text("步骤4"), subTitle: Text("描述信息"),icon: Icon(Icons.check_circle) ),
                  AntStepItem(title: Text("步骤5"), subTitle: Text("描述信息"),icon: Icon(Icons.check_circle) ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
              title: "基础用法",
              child: AntSteps(
                direction: AntStepsDirection.vertical,
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
          ],
        ),
      ),
    );
  }
}

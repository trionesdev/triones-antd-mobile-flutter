import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../demo_block.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text("Process 进度条")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "进度条",
              child: Column(
                spacing: 4,
                children: [
                  AntProcess(percent: 30),
                  AntProcess(percent: 50, status: AntProcessStatus.active),
                  AntProcess(percent: 70, status: AntProcessStatus.exception),
                  AntProcess(percent: 100),
                  AntProcess(percent: 50, showInfo: false),
                ],
              ),
            ),
            DemoBlock(
              title: "进度圈",
              child: Column(
                spacing: 4,
                children: [
                  AntProcess(percent: 75, type: AntProcessType.circle),
                  AntProcess(
                    percent: 70,
                    type: AntProcessType.circle,
                    status: AntProcessStatus.exception,
                  ),
                  AntProcess(percent: 100, type: AntProcessType.circle),
                ],
              ),
            ),
            DemoBlock(
              title: "小型进度条",
              child: Column(
                spacing: 4,
                children: [
                  AntProcess(percent: 30, size: AntSize.small),
                  AntProcess(
                    percent: 50,
                    size: AntSize.small,
                    status: AntProcessStatus.active,
                  ),
                  AntProcess(
                    percent: 70,
                    size: AntSize.small,
                    status: AntProcessStatus.exception,
                  ),
                  AntProcess(percent: 100, size: AntSize.small),
                  AntProcess(percent: 50, size: AntSize.small, showInfo: false),
                ],
              ),
            ),
            DemoBlock(
              title: "自定义文字格式",
              child: Column(
                children: [
                  AntProcess(
                    percent: 75,
                    type: AntProcessType.circle,
                    format: (percent) => "$percent%",
                  ),
                  AntProcess(
                    percent: 100,
                    type: AntProcessType.circle,
                    format: (percent) => "完成",
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: "改变进度值位置",
              child: Column(
                spacing: 8,
                children: [
                  AntProcess(
                    percent: 0,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                  ),
                  AntProcess(
                    percent: 10,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                  ),
                  AntProcess(
                    percent: 50,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                    positionAlign: AntPercentPositionAlign.start,
                    strokeColor: Colors.green,
                  ),
                  AntProcess(
                    percent: 60,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                    positionAlign: AntPercentPositionAlign.end,
                    strokeColor: Colors.black87,
                  ),
                  AntProcess(
                    percent: 100,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                    positionAlign: AntPercentPositionAlign.center,
                  ),
                  AntProcess(
                    percent: 60,
                    positionType: AntPercentPositionType.outer,
                    positionAlign: AntPercentPositionAlign.start,
                  ),
                  AntProcess(
                    percent: 100,
                    positionType: AntPercentPositionType.outer,
                    positionAlign: AntPercentPositionAlign.start,
                  ),
                  AntProcess(
                    percent: 60,
                    positionType: AntPercentPositionType.outer,
                    positionAlign: AntPercentPositionAlign.center,
                  ),
                  AntProcess(
                    percent: 100,
                    positionType: AntPercentPositionType.outer,
                    positionAlign: AntPercentPositionAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

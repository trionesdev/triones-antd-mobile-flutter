import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../demo_block.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text("Progress 进度条")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "进度条",
              child: Column(
                spacing: 4,
                children: [
                  AntProgress(percent: 30),
                  AntProgress(percent: 50, status: AntProgressStatus.active),
                  AntProgress(percent: 70, status: AntProgressStatus.exception),
                  AntProgress(percent: 100),
                  AntProgress(percent: 50, showInfo: false),
                ],
              ),
            ),
            DemoBlock(
              title: "进度圈",
              child: Column(
                spacing: 4,
                children: [
                  AntProgress(percent: 75, type: AntProgressType.circle),
                  AntProgress(
                    percent: 70,
                    type: AntProgressType.circle,
                    status: AntProgressStatus.exception,
                  ),
                  AntProgress(percent: 100, type: AntProgressType.circle),
                ],
              ),
            ),
            DemoBlock(
              title: "小型进度条",
              child: Column(
                spacing: 4,
                children: [
                  AntProgress(percent: 30, size: AntSize.small),
                  AntProgress(
                    percent: 50,
                    size: AntSize.small,
                    status: AntProgressStatus.active,
                  ),
                  AntProgress(
                    percent: 70,
                    size: AntSize.small,
                    status: AntProgressStatus.exception,
                  ),
                  AntProgress(percent: 100, size: AntSize.small),
                  AntProgress(percent: 50, size: AntSize.small, showInfo: false),
                ],
              ),
            ),
            DemoBlock(
              title: "自定义文字格式",
              child: Column(
                children: [
                  AntProgress(
                    percent: 75,
                    type: AntProgressType.circle,
                    format: (percent) => "$percent%",
                  ),
                  AntProgress(
                    percent: 100,
                    type: AntProgressType.circle,
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
                  AntProgress(
                    percent: 0,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                  ),
                  AntProgress(
                    percent: 10,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                  ),
                  AntProgress(
                    percent: 50,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                    positionAlign: AntPercentPositionAlign.start,
                    strokeColor: Colors.green,
                  ),
                  AntProgress(
                    percent: 60,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                    positionAlign: AntPercentPositionAlign.end,
                    strokeColor: Colors.black87,
                  ),
                  AntProgress(
                    percent: 100,
                    positionType: AntPercentPositionType.inner,
                    height: 20,
                    positionAlign: AntPercentPositionAlign.center,
                  ),
                  AntProgress(
                    percent: 60,
                    positionType: AntPercentPositionType.outer,
                    positionAlign: AntPercentPositionAlign.start,
                  ),
                  AntProgress(
                    percent: 100,
                    positionType: AntPercentPositionType.outer,
                    positionAlign: AntPercentPositionAlign.start,
                  ),
                  AntProgress(
                    percent: 60,
                    positionType: AntPercentPositionType.outer,
                    positionAlign: AntPercentPositionAlign.center,
                  ),
                  AntProgress(
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

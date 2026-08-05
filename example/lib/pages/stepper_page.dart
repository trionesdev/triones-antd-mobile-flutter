import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  num? _controlledValue = 1;
  num? _changeValue = 0;

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text('Stepper 步进器')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: '基本用法（当前值：$_changeValue）',
              child: AntStepper(
                onChange: (val) {
                  setState(() {
                    _changeValue = val;
                  });
                },
              ),
            ),
            DemoBlock(
              title: '步长设置',
              child: AntStepper(step: 10, defaultValue: 10),
            ),
            DemoBlock(
              title: '限制输入范围',
              child: AntStepper(min: 0, max: 10, defaultValue: 5),
            ),
            DemoBlock(
              title: '小数位数',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  AntStepper(step: 0.01, digits: 2, defaultValue: 1.0),
                  AntStepper(step: 0.2, digits: 1, defaultValue: 0.8),
                ],
              ),
            ),
            DemoBlock(
              title: '禁用状态',
              child: AntStepper(disabled: true, defaultValue: 3),
            ),
            DemoBlock(
              title: '输入框只读',
              child: AntStepper(inputReadOnly: true, defaultValue: 2),
            ),
            DemoBlock(
              title: '允许清空',
              child: AntStepper(
                allowEmpty: true,
                defaultValue: null,
                min: 0,
                max: 100,
              ),
            ),
            DemoBlock(
              title: '不同尺寸',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  AntStepper(size: AntSize.small, defaultValue: 1),
                  AntStepper(size: AntSize.medium, defaultValue: 1),
                  AntStepper(size: AntSize.large, defaultValue: 1),
                ],
              ),
            ),
            DemoBlock(
              title: '受控模式（当前值：$_controlledValue）',
              child: AntStepper(
                value: _controlledValue,
                min: 0,
                max: 20,
                onChange: (val) {
                  setState(() {
                    _controlledValue = val;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

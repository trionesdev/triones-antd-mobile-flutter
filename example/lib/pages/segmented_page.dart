import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class SegmentedPage extends StatefulWidget {
  const SegmentedPage({super.key});

  @override
  State<SegmentedPage> createState() => _SegmentedPageState();
}

class _SegmentedPageState extends State<SegmentedPage> {
  dynamic _value = 'daily';

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: const Text('Segmented 分段控制器')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: '基本用法',
              child: AntSegmented(
                options: const [
                  AntSegmentedOption(labelText: 'Daily', value: 'daily'),
                  AntSegmentedOption(labelText: 'Weekly', value: 'weekly'),
                  AntSegmentedOption(labelText: 'Monthly', value: 'monthly'),
                ],
                onChange: (value) {
                  debugPrint('segmented: $value');
                },
              ),
            ),
            DemoBlock(
              title: '受控模式',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  AntSegmented(
                    value: _value,
                    options: const [
                      AntSegmentedOption(labelText: 'Daily', value: 'daily'),
                      AntSegmentedOption(labelText: 'Weekly', value: 'weekly'),
                      AntSegmentedOption(labelText: 'Monthly', value: 'monthly'),
                    ],
                    onChange: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  Text('当前选中: $_value'),
                ],
              ),
            ),
            DemoBlock(
              title: '块级铺满',
              child: AntSegmented(
                block: true,
                options: const [
                  AntSegmentedOption(labelText: 'Daily', value: 'daily'),
                  AntSegmentedOption(labelText: 'Weekly', value: 'weekly'),
                  AntSegmentedOption(labelText: 'Monthly', value: 'monthly'),
                  AntSegmentedOption(labelText: 'Yearly', value: 'yearly'),
                ],
              ),
            ),
            DemoBlock(
              title: '带图标',
              child: AntSegmented(
                options: const [
                  AntSegmentedOption(
                    labelText: 'List',
                    value: 'list',
                    icon: Icon(Icons.list),
                  ),
                  AntSegmentedOption(
                    labelText: 'Kanban',
                    value: 'kanban',
                    icon: Icon(Icons.view_kanban_outlined),
                  ),
                ],
              ),
            ),
            DemoBlock(
              title: '禁用',
              child: Column(
                spacing: 12,
                children: [
                  AntSegmented(
                    disabled: true,
                    defaultValue: 'weekly',
                    options: const [
                      AntSegmentedOption(labelText: 'Daily', value: 'daily'),
                      AntSegmentedOption(labelText: 'Weekly', value: 'weekly'),
                      AntSegmentedOption(labelText: 'Monthly', value: 'monthly'),
                    ],
                  ),
                  AntSegmented(
                    options: const [
                      AntSegmentedOption(labelText: 'Daily', value: 'daily'),
                      AntSegmentedOption(
                        labelText: 'Weekly',
                        value: 'weekly',
                        disabled: true,
                      ),
                      AntSegmentedOption(labelText: 'Monthly', value: 'monthly'),
                    ],
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

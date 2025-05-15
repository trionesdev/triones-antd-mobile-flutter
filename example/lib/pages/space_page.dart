import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class SpacePage extends StatefulWidget {
  const SpacePage({super.key});

  @override
  State<StatefulWidget> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: const Text("Space"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本使用",
              child: Column(
                spacing: 10,
                children: [
                  AntSpace(spacing: 10, children: [
                    AntButton(
                      text: "Button",
                    ),
                    AntButton(
                      text: "Button",
                    )
                  ]),
                ],
              ),
            ),
            DemoBlock(
              title: "纵向排列",
              child: Column(
                children: [
                  AntSpace(
                      spacing: 10,
                      direction: AntSpaceDirection.vertical,
                      children: [
                        AntButton(
                          text: "Button",
                        ),
                        AntButton(
                          text: "Button",
                        )
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

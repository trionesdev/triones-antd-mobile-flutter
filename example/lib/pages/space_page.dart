import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class SpacePage extends StatefulWidget {
  const SpacePage({super.key});

  @override
  State<StatefulWidget> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: const Text("Space"),
      ),
      body: Column(
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
          AntSpace(spacing: 10, direction: SpaceDirection.vertical, children: [
            AntButton(
              text: "Button",
            ),
            AntButton(
              text: "Button",

            )
          ])
        ],
      ),
    );
  }
}

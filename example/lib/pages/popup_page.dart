import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class PopupPage extends StatefulWidget {
  const PopupPage({super.key});

  @override
  State<StatefulWidget> createState() => _PopupPageState();
}

class _PopupPageState extends State<PopupPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text('Popup')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: '基础用法',
              child: Column(
                spacing: 10,
                children: [
                  AntButton(
                    block: true,
                    text: 'Top Popup',
                    onPressed: () {
                      showAntPopup(
                        context: context,
                        position: AntPopupPosition.top,
                        height: 400,
                        child: Text("Top Popup"),
                      );
                      // showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2025));
                    },
                  ),
                  AntButton(
                    block: true,
                    text: 'Bottom Popup',
                    onPressed: () {
                      showAntPopup(
                        context: context,
                        height: 400,
                        child: Text("Bottom Popup"),
                      );
                      // showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2025));
                    },
                  ),
                  AntButton(
                    block: true,
                    text: 'Left Popup',
                    onPressed: () {
                      showAntPopup(
                        context: context,
                        position: AntPopupPosition.left,
                        width: 200,
                        child: Text("Left Popup"),
                      );
                      // showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2025));
                    },
                  ),
                  AntButton(
                    block: true,
                    text: 'Right Popup',
                    onPressed: () {
                      showAntPopup(
                        context: context,
                        position: AntPopupPosition.right,
                        width: 200,
                        child: Text("Right Popup"),
                      );
                      // showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2025));
                    },
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

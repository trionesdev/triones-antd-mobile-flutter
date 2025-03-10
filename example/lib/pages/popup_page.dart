import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class PopupPage extends StatefulWidget {
  const PopupPage({super.key});

  @override
  State<StatefulWidget> createState() => _PopupPageState();
}

class _PopupPageState extends State<PopupPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(title: Text('Popup')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AntButton(text: 'show',onPressed: () {
              AntPopup.show(context: context,maxHeight: 400);
              // showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2025));
            },)
          ],
        ),
      ),
    );
  }
}
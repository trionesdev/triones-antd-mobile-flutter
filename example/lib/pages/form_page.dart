import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart' as antd;

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: antd.Form(
          children: [
            antd.FormItem(
                label: "年龄",
                name: 'age',
                builder: (antd.FormItemState<String> field) {

                  return antd.Input();
                }),
            antd.Button(
              text: "保存",
              onPressed: () => {},
            )
          ],
        ));
  }
}

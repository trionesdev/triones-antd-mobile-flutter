import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart' as antd;

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<antd.FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: antd.Form(
          key: _formKey,
          children: [
            antd.FormItem(

                label: "年龄",
                name: 'age',
                builder: (antd.FormItemState<String> field) {
                  return antd.Input(
                    value: field.value,
                    onChange: field.didChange,
                  );
                }),
            antd.Button(
              text: "保存",
              block: true,
              onPressed: () => {
                _formKey.currentState?.validateFields().then((values) => {
print(values)
                }).catchError((err){

                })
              },
            )
          ],
        ));
  }
}

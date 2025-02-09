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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: antd.Form(
          key: _formKey,
          children: [
            antd.FormItem(
                label: "年龄",
                name: antd.NamePath('age'),
                builder: (antd.FormItemState<String> field) {
                  return antd.Input(
                    value: field.value.toString(),
                    onChange: field.didChange,
                  );
                }),
            antd.FormItem(
                label: "年龄x",
                name: antd.NamePath(['z', 'age']),
                builder: (antd.FormItemState<String> field) {
                  return antd.Input(
                    value: field.value,
                    onChange: field.didChange,
                  );
                }),
            antd.FormItem(
                name: antd.NamePath(['username']),
                builder: (antd.FormItemState<String> field) {
                  return antd.Input(
                    value: field.value,
                    onChange: field.didChange,
                    placeholder: '请输入用户名',
                    prefix: Icon(Icons.person),
                  );
                }),
            antd.FormItem(
                name: antd.NamePath(['password']),
                builder: (antd.FormItemState<String> field) {
                  return antd.Input(
                    value: field.value,
                    onChange: field.didChange,
                    type: antd.InputType.password,
                    placeholder: '请输入密码',
                    prefix: Icon(Icons.lock),
                  );
                }),
            antd.Button(
              text: "保存",
              block: true,
              onPressed: () => {
                _formKey.currentState
                    ?.validateFields()
                    .then((values) => {print(values)})
                    .catchError((err) {})
              },
            ),
            antd.Button(
              text: "赋值",
              block: true,
              onPressed: () => {
                _formKey.currentState?.setFieldsValue({
                  "age": 1,
                  "z": {"age": "1"}
                })
              },
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart' as antd;

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<antd.AntFormState>();
  final _formKey2 = GlobalKey<antd.AntFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: Column(
          children: [
            antd.AntForm(
              key: _formKey,
              children: [
                antd.AntFormItem(
                    label: Text("年龄"),
                    name: antd.NamePath('age'),
                    builder: (antd.AntFormItemState<String> field) {
                      return antd.AntInput(
                        value: field.value.toString(),
                        onChange: field.didChange,
                      );
                    }),
                antd.AntFormItem(
                    label: Text("年龄x"),
                    name: antd.NamePath(['z', 'age']),
                    builder: (antd.AntFormItemState<String> field) {
                      return antd.AntInput(
                        value: field.value,
                        onChange: field.didChange,
                      );
                    }),
                antd.AntFormItem(
                    name: antd.NamePath(['username']),
                    validator: (value) {
                      if (value == null) {
                        return '请输入用户名';
                      }
                      return null;
                    },
                    builder: (antd.AntFormItemState<String> field) {
                      return antd.AntInput(
                        value: field.value,
                        onChange: field.didChange,
                        placeholder: '请输入用户名',
                        prefix: Icon(Icons.person),
                      );
                    }),
                antd.AntFormItem(
                    name: antd.NamePath(['password']),
                    builder: (antd.AntFormItemState<String> field) {
                      return antd.AntInput(
                        value: field.value,
                        onChange: field.didChange,
                        type: antd.InputType.password,
                        placeholder: '请输入密码',
                        prefix: Icon(Icons.lock),
                      );
                    }),
                antd.AntButton(
                  text: "保存",
                  block: true,
                  onPressed: () => {
                    _formKey.currentState
                        ?.validateFields()
                        .then((values) => {print(values)})
                        .catchError((err) => {print(err)})
                  },
                ),
                antd.AntButton(
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
            ),
            antd.AntForm(key: _formKey2,layout: antd.FormLayout.vertical, children: [
              antd.AntFormItem(
                label: Text("用户名"),
                  name: antd.NamePath(['username']),
                  validator: (value) {
                    if (value == null) {
                      return '请输入用户名';
                    }
                    return null;
                  },
                  builder: (antd.AntFormItemState<String> field) {
                    return antd.AntInput(
                      value: field.value,
                      onChange: field.didChange,
                      placeholder: '请输入用户名',
                      prefix: Icon(Icons.person),
                    );
                  }),
              antd.AntButton(
                text: "保存",
                block: true,
                onPressed: () => {
                  _formKey2.currentState
                      ?.validateFields()
                      .then((values) => {print(values)})
                      .catchError((err) => {print(err)})
                },
              )
            ])
          ],
        ));
  }
}

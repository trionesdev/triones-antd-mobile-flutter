import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<AntFormState>();
  final _formKey2 = GlobalKey<AntFormState>();
  final _formKey3 = GlobalKey<AntFormState>();
  final _formKey4 = GlobalKey<AntFormState>();

  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        backgroundColor: Colors.white,
        appBar: AntAppBar(
          title: Text('Form'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DemoBlock(
                title: "基本使用",
                child: AntForm(
                  key: _formKey,
                  children: [
                    AntFormItem(
                        label: Text("年龄"),
                        name: NamePath('age'),
                        builder: (AntFormItemState<String> field) {
                          return AntInput(
                            value: field.value.toString(),
                            onChange: field.didChange,
                          );
                        }),
                    AntFormItem(
                        label: Text("年龄x"),
                        name: NamePath(['z', 'age']),
                        builder: (AntFormItemState<String> field) {
                          return AntInput(
                            value: field.value,
                            onChange: field.didChange,
                          );
                        }),
                    AntFormItem(
                        name: NamePath(['username']),
                        validator: (value) {
                          if (value == null) {
                            return '请输入用户名';
                          }
                          return null;
                        },
                        builder: (AntFormItemState<String> field) {
                          return AntInput(
                            value: field.value,
                            onChange: field.didChange,
                            placeholder: '请输入用户名',
                            prefix: Icon(Icons.person),
                          );
                        }),
                    AntFormItem(
                        name: NamePath(['password']),
                        builder: (AntFormItemState<String> field) {
                          return AntInput(
                            value: field.value,
                            onChange: field.didChange,
                            type: AntInputType.password,
                            placeholder: '请输入密码',
                            prefix: Icon(Icons.lock),
                          );
                        }),
                    Column(
                      spacing: 10,
                      children: [
                        AntButton(
                          text: "保存",
                          block: true,
                          onPressed: () => {
                            _formKey.currentState
                                ?.validateFields()
                                .then((values) => {print(values)})
                                .catchError((err) => {print(err)})
                          },
                        ),
                        AntButton(
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
                    )
                  ],
                ),
              ),
              AntForm(key: _formKey2, layout: AntFormLayout.vertical, children: [
                AntFormItem(
                    label: Text("用户名"),
                    name: NamePath(['username']),
                    validator: (value) {
                      if (value == null) {
                        return '请输入用户名';
                      }
                      return null;
                    },
                    builder: (AntFormItemState<String> field) {
                      return AntInput(
                        value: field.value,
                        onChange: field.didChange,
                        placeholder: '请输入用户名',
                        prefix: Icon(Icons.person),
                      );
                    }),
                AntButton(
                  text: "保存",
                  block: true,
                  onPressed: () => {
                    _formKey2.currentState
                        ?.validateFields()
                        .then((values) => {print(values)})
                        .catchError((err) => {print(err)})
                  },
                )
              ]),
              DemoBlock(
                title: "col flex",
                child: AntForm(
                    key: _formKey3,
                    layout: AntFormLayout.horizontal,
                    children: [
                      AntFormItem(
                          label: Text("用户名"),
                          name: NamePath(['username']),
                          validator: (value) {
                            if (value == null) {
                              return '请输入用户名';
                            }
                            return null;
                          },
                          labelCol: Col(flex: 100),
                          builder: (AntFormItemState<String> field) {
                            return AntInput(
                              value: field.value,
                              onChange: field.didChange,
                              placeholder: '请输入用户名',
                            );
                          }),
                    ]),
              ),
              DemoBlock(
                title: "col span",
                child: AntForm(
                    key: _formKey4,
                    layout: AntFormLayout.horizontal,
                    children: [
                      AntFormItem(
                          label: Text("用户名"),
                          name: NamePath(['username']),
                          validator: (value) {
                            if (value == null) {
                              return '请输入用户名';
                            }
                            return null;
                          },
                          wrapperCol: Col(span: 18),
                          builder: (AntFormItemState<String> field) {
                            return AntInput(
                              value: field.value,
                              onChange: field.didChange,
                              placeholder: '请输入用户名',
                            );
                          }),
                    ]),
              )
            ],
          ),
        ));
  }
}

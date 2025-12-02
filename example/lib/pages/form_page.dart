import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

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
  final _formKey5 = GlobalKey<AntFormState>();
  final _formKey6 = GlobalKey<AntFormState>();
  final _formKey7 = GlobalKey<AntFormState>();

  void setValues() {
    Future.delayed(Duration(milliseconds: 500), () {
      _formKey6.currentState?.setFieldsValue({
        "name": "name",
        "items": ["1"],
      });
    });
  }

  @override
  void initState() {
    setValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      backgroundColor: Colors.white,
      appBar: AntAppBar(title: Text('Form')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本使用",
              child: AntForm(
                key: _formKey,
                child: Column(
                  children: [
                    AntFormItem<String>(
                      labelWidget: Text("年龄"),
                      name: NamePath('age'),
                      builder: (field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                        );
                      },
                    ),
                    AntFormItem(
                      labelWidget: Text("性别"),
                      name: NamePath(['gender']),
                      builder: (AntFieldState field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                        );
                      },
                    ),
                    AntFormItem<String?>(
                      name: NamePath(['username']),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入用户名';
                        }
                        return null;
                      },
                      builder: (AntFieldState field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                          placeholder: '请输入用户名',
                          prefix: Icon(Icons.person),
                        );
                      },
                    ),
                    AntFormItem(
                      name: NamePath(['password']),
                      builder: (AntFieldState field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                          type: AntInputType.password,
                          placeholder: '请输入密码',
                          prefix: Icon(Icons.lock),
                        );
                      },
                    ),
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
                                .catchError((err) => {print(err)}),
                          },
                        ),
                        AntButton(
                          text: "赋值",
                          block: true,
                          onPressed: () => {
                            _formKey.currentState?.setFieldsValue({"age": "1"}),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            DemoBlock(
              title: "垂直布局",
              child: AntForm(
                key: _formKey2,
                layout: AntFormLayout.vertical,
                child: Column(
                  children: [
                    AntFormItem(
                      labelWidget: Text("用户名"),
                      name: NamePath(['username']),
                      validator: (value) {
                        if (value == null) {
                          return '请输入用户名';
                        }
                        return null;
                      },
                      builder: (AntFieldState field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                          placeholder: '请输入用户名',
                          prefix: Icon(Icons.person),
                        );
                      },
                    ),
                    AntButton(
                      text: "保存",
                      block: true,
                      onPressed: () => {
                        _formKey2.currentState
                            ?.validateFields()
                            .then((values) => {print(values)})
                            .catchError((err) => {print(err)}),
                      },
                    ),
                  ],
                ),
              ),
            ),
            DemoBlock(
              title: "col flex",
              child: AntForm(
                key: _formKey3,
                layout: AntFormLayout.horizontal,
                child: Column(
                  children: [
                    AntFormItem(
                      labelWidget: Text("用户名"),
                      name: NamePath(['username']),
                      validator: (value) {
                        if (value == null) {
                          return '请输入用户名';
                        }
                        return null;
                      },
                      labelCol: AntCol(flex: 100),
                      builder: (AntFieldState field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                          placeholder: '请输入用户名',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            DemoBlock(
              title: "col span",
              child: AntForm(
                key: _formKey4,
                layout: AntFormLayout.horizontal,
                child: Column(
                  children: [
                    AntFormItem(
                      labelWidget: Text("用户名"),
                      name: NamePath(['username']),
                      validator: (value) {
                        if (value == null) {
                          return '请输入用户名';
                        }
                        return null;
                      },
                      wrapperCol: AntCol(span: 18),
                      builder: (AntFieldState field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                          placeholder: '请输入用户名',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            DemoBlock(
              title: "标签靠右",
              child: AntForm(
                key: _formKey5,
                labelAlign: AntLabelAlign.right,
                labelCol: AntCol(flex: 50),
                child: Column(
                  children: [
                    AntFormItem(
                      labelWidget: Text("年龄"),
                      name: NamePath('age'),
                      builder: (AntFieldState field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                        );
                      },
                    ),
                    AntFormItem(
                      labelWidget: Text("性别"),
                      name: NamePath(['gender']),
                      builder: (AntFieldState field) {
                        return AntInput(
                          value: field.value,
                          onChange: field.didChange,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            DemoBlock(
              title: "Form List",
              child: AntForm(
                key: _formKey6,
                child: Column(
                  children: [
                    AntFormItem(
                      labelWidget: Text("名称"),
                      name: NamePath(['name']),
                      builder: (AntFieldState state) {
                        return AntInput(
                          value: state.value,
                          onChange: state.didChange,
                        );
                      },
                    ),
                    AntFormList(
                      name: NamePath("items"),
                      builder: (context, fields, operations) {
                        var list = fields.map((field) {
                          return Row(
                            children: [
                              Expanded(
                                child: AntFormItem<String?>(
                                  name: field.name,
                                  labelWidget: Text("Item"),
                                  builder: (AntFieldState state) {
                                    return AntInput(
                                      value: state.value,
                                      onChange: state.didChange,
                                    );
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {operations.remove!(field.index)},
                                child: Icon(Icons.delete),
                              ),
                            ],
                          );
                        }).toList();
                        return Column(
                          children: [
                            ...list,
                            Row(
                              children: [
                                AntButton(
                                  text: "添加",
                                  onPressed: () => {operations.add("")},
                                ),
                                AntButton(
                                  text: "确定",
                                  onPressed: () => {
                                    _formKey6.currentState
                                        ?.validateFields()
                                        .then((values) => {print(values)}),
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    AntFormList(
                      name: NamePath("users"),
                      builder: (context, fields, operations) {
                        return Column(
                          children: [
                            ...fields.map((field) {
                              return AntFormItem<String>(
                                name: NamePath([field.index, "name"]),
                                labelWidget: Text("Item"),
                                builder: (AntFieldState<String?> state) {
                                  return AntInput(
                                    value: state.value?.toString(),
                                    onChange: state.didChange,
                                  );
                                },
                              );
                            }),
                            Row(
                              children: [
                                AntButton(
                                  text: "添加",
                                  onPressed: () {
                                    Map<dynamic, dynamic> user = {"name": null};
                                    operations.add(user);
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            DemoBlock(
              title: "FormList With Sub FormList",
              child: AntForm(
                key: _formKey7,
                child: Column(
                  children: [
                    AntFormItem(
                      labelWidget: Text("名称"),
                      name: NamePath(['name']),
                      builder: (AntFieldState state) {
                        return AntInput(
                          value: state.value,
                          onChange: state.didChange,
                        );
                      },
                    ),
                    AntFormList(
                      name: NamePath("items"),
                      builder: (context, fields, operations) {
                        var list = fields.map((field) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AntFormItem<String>(
                                      name: NamePath([field.index, "itemName"]),
                                      labelWidget: Text("Item"),
                                      builder: ( state) {
                                        return AntInput(
                                          placeholder: "请输入",
                                          value: state.value,
                                          onChange: state.didChange,
                                        );
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      operations.remove(field.index),
                                    },
                                    child: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                              AntFormList(
                                name: NamePath([field.index, "users"]),
                                builder: (context, fields, operationsSub) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ...fields.map((field1) {
                                        return AntFormItem<String>(
                                          name: NamePath([
                                            field1.index,
                                            "name",
                                          ]),
                                          labelWidget: Text("SubItem"),
                                          builder: (  state) {
                                            return AntInput(
                                              value: state.value?.toString(),
                                              onChange: state.didChange,
                                            );
                                          },
                                          // child: AntInput(),
                                        );
                                      }),
                                      Row(
                                        children: [
                                          AntButton(
                                            text: "添加",
                                            onPressed: () {
                                              operationsSub.add({
                                                "name": "subItem",
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                        }).toList();
                        return Column(
                          children: [
                            ...list,
                            Row(
                              children: [
                                AntButton(
                                  text: "添加",
                                  onPressed: () => {
                                    operations.add({
                                      "itemName": "",
                                      "users": [
                                        {"name": "1"},
                                      ],
                                    }),
                                  },
                                ),
                                AntButton(
                                  text: "确定",
                                  onPressed: () => {
                                    _formKey7.currentState?.validateFields().then(
                                      (values) => {
                                        print(
                                          "------------------------values------------------------",
                                        ),
                                        print(values),
                                      },
                                    ),
                                  },
                                ),
                                AntButton(
                                  text: "设置",
                                  onPressed: () => {
                                    _formKey7.currentState?.setFieldsValue({
                                      "name": "test",
                                      "items": [
                                        {
                                          "itemName": "111",
                                          "users": [
                                            {"name": "1"},
                                          ],
                                        },
                                        {
                                          "itemName": "ddddd",
                                          "users": [
                                            {"name": "ssd"},
                                          ],
                                        },
                                      ],
                                    }),
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

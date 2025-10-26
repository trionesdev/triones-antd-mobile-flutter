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

          ],
        ),
      ),
    );
  }
}

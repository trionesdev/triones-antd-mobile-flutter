# Form 表单

## 代码演示

```dart preview:/form
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
                          onPressed: () =>
                          {
                            _formKey.currentState
                                ?.validateFields()
                                .then((values) => {print(values)})
                                .catchError((err) => {print(err)})
                          },
                        ),
                        AntButton(
                          text: "赋值",
                          block: true,
                          onPressed: () =>
                          {
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
                  onPressed: () =>
                  {
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

```

## API

### AntForm

| 属性            | 说明                                    | 类型              | 默认值          |
|---------------|---------------------------------------|-----------------|--------------|
| layout        | 表单布局，可选值为 horizontal（水平） vertical（垂直） | `AntFormLayout` | `horizontal` |
| labelCol      | label 布局                              | `AntFormCol`    |              |
| labelAlign    | label 对其方式                            | `AntLabelAlign` | `left`       |
| wrapperCol    | 内容布局                                  | `AntFormCol`    |              |                                  | `AntFormCol`    |              |
| spacing       | 间隔                                    | double          |              |                                  | `AntFormCol`    |              |
| rowSpacing    | 行间隔                                   | double          |              |                                  | `AntFormCol`    |              |
| columnSpacing | 列间隔                                   | double          |              |                                  | `AntFormCol`    |              |

### AntFormItem

| 属性           | 说明                                    | 类型                                          | 默认值          |
|--------------|---------------------------------------|---------------------------------------------|--------------|
| layout       | 表单布局，可选值为 horizontal（水平） vertical（垂直） | `AntFormLayout`                             | `horizontal` |
| name         | name属性                                | `NamePath`                                  |              |
| label        | 标签                                    | `Widget`                                    |              |
| labelCol     | label 布局,会覆盖Form 的labelCol            | `AntFormCol`                                |              |
| labelAlign   | label 对其方式,会覆盖Form的labelAlign         | `AntLabelAlign`                             | `left`       |
| wrapperCol   | 内容布局                                  | `AntFormCol`                                |              |                                  
| builder      | Item创建函数                              | Widget Function(AntFormItemState\<T> field) |              |                                        
| onSaved      | 保存时回调                                 | void Function(T? newValue)                  |              |                                 
| initialValue | 初始值                                   | dynamic                                     |              |                                
| validator    | 验证函数                                  | String? Function(T? value)                  |              |                                
| required     | 是否必填                                  | bool                                        |              |          |                                
| child        | 子项                                    | Widget                                      |              |          |                                

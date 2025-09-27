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

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      backgroundColor: Colors.white,
      appBar: AntAppBar(title: Text('Form')),
      body: SingleChildScrollView(
        child: Column(
          children: [

            DemoBlock(
              title: "Form List",
              child: AntForm(
                key: _formKey6,
                child: Column(
                  children: [
                    AntFormItem(
                      label: Text("名称"),
                      name: NamePath(['name']),
                      builder: (FieldState<dynamic> state) {
                        return AntInput(onChange: state.didChange);
                      },
                    ),
                    AntFormList(
                      name: NamePath("items"),
                      builder: (context, fields, operations) {
                        var list = fields.map((field) {
                          return AntFormItem(
                            name: field.name,
                            label: Text("Item"),
                            builder: (FieldState<dynamic> state) {
                              return AntInput(onChange: state.didChange);
                            },
                            child: AntInput(),
                          );
                        }).toList();
                        return Column(
                          children: [
                            ...list,
                            Row(
                              children: [
                                AntButton(
                                  text: "添加",
                                  onPressed: () => {operations.add!("")},
                                ),
                                AntButton(
                                  text: "确定",
                                  onPressed: () => {
                                    _formKey6.currentState
                                        ?.validateFields()
                                        .then((values) => {print(values)})
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

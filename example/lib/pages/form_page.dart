import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Input'),
        ),
      body: Center(
        child: Column(children: [
          FormItem(builder: (FormFieldState<String> field) {  },)
        ],),
      ),
    );
  }
}
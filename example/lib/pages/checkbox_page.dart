import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<StatefulWidget> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: Text("Checkbox 复选框"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DemoBlock(
                title: "基础用法",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AntCheckbox(),
                    AntCheckbox(
                      label: Text("有描述的复选框"),
                    ),
                  ],
                ),
              ),
              DemoBlock(
                title: "选项组",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AntCheckboxGroup(
                      defaultValue: ["1","3"],
                      onChange: (val){
                        print("------value changed-------");
                        print(val);
                      },
                      children: [
                        AntCheckbox(
                          value: "1",
                          label: Text("第一项"),
                        ),
                        AntCheckbox(
                          value: "2",
                          label: Text("第二项"),
                        ),
                        AntCheckbox(
                          value: "3",
                          label: Text("第三项"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              DemoBlock(
                title: "沾满整行宽度",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      child: AntCheckbox(
                          block: true,
                          label: Container(

                            color: Colors.grey,
                            child: Text(
                              "块级元素",
                            ),
                          )),
                    ),
                    AntCheckbox(
                      label: Container(
                        color: Colors.grey,
                        child: Text(
                          "非块级元素",
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<StatefulWidget> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: Text("Radio 单选框"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DemoBlock(
                title: "基础用法",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AntRadio(),
                    AntRadio(
                      label: Text("有描述的单选框"),
                    ),
                  ],
                ),
              ),
              DemoBlock(
                title: "选项组",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AntRadioGroup(
                      defaultValue: "1",
                      onChange: (val){
                        print(val);
                      },
                      children: [
                        AntRadio(
                          value: "1",
                          label: Text("第一项"),
                        ),
                        AntRadio(
                          value: "2",
                          label: Text("第二项"),
                        ),
                        AntRadio(
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
                    AntRadio(
                        block: true,
                        label: Container(
                          color: Colors.grey,
                          child: Text(
                            "块级元素",
                          ),
                        )),
                    AntRadio(
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

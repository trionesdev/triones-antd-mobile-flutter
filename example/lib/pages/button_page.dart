import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<StatefulWidget> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        appBar: AntAppBar(
          title: Text('Button'),
        ),
        body: ListView(children: [
          DemoBlock(
            title: "普通使用",
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 4.0,
              runSpacing: 4.0,
              children: [
                AntButton(
                  type: ButtonType.primary,
                  text: 'Primary',
                  onPressed: () {
                    print('ElevatedButton');
                  },
                ),
                AntButton(
                  text: 'Default',
                  onPressed: () {
                    print('ElevatedButton');
                  },
                ),
                AntButton(
                  type: ButtonType.text,
                  text: 'Text',
                  onPressed: () {
                    print('ElevatedButton');
                  },
                ),
                AntButton(
                  type: ButtonType.link,
                  text: 'Link',
                  onPressed: () {
                    print('ElevatedButton');
                  },
                ),
              ],
            ),
          ),
          DemoBlock(
            title: "类型",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    text: 'Primary',
                    color: Color(0xff000000),
                    variant: ButtonVariant.solid,
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.outlined,
                    color: Color(0xff000000),
                    text: 'Outlined',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.filled,
                    color: Color(0xff000000),
                    text: 'Filled',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.text,
                    color: Color(0xff000000),
                    text: 'Text',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.link,
                    color: Color(0xff000000),
                    text: 'Link',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                ]),
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    text: 'Primary',
                    variant: ButtonVariant.solid,
                    color: Color(0xff1677FF),
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.outlined,
                    color: Color(0xff1677FF),
                    text: 'Outlined',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.filled,
                    color: Color(0xff1677FF),
                    text: 'Filled',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.text,
                    color: Color(0xff1677FF),
                    text: 'Text',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.link,
                    color: Color(0xff1677FF),
                    text: 'Link',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                ]),
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    text: 'Primary',
                    variant: ButtonVariant.solid,
                    color: Color(0xffFF4D4F),
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.outlined,
                    color: Color(0xffFF4D4F),
                    text: 'Outlined',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.filled,
                    color: Color(0xffFF4D4F),
                    text: 'Filled',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.text,
                    color: Color(0xffFF4D4F),
                    text: 'Text',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.link,
                    color: Color(0xffFF4D4F),
                    text: 'Link',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                ]),
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    text: 'Primary',
                    variant: ButtonVariant.solid,
                    color: Color(0xffEB2F96),
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.outlined,
                    color: Color(0xffEB2F96),
                    text: 'Outlined',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.filled,
                    color: Color(0xffEB2F96),
                    text: 'Filled',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.text,
                    color: Color(0xffEB2F96),
                    text: 'Text',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    variant: ButtonVariant.link,
                    color: Color(0xffEB2F96),
                    text: 'Link',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                ]),
              ],
            ),
          ),
          DemoBlock(
            title: "大小",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    AntButton(
                      text: 'Large',
                      size: ButtonSize.large,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      size: ButtonSize.large,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      shape: ButtonShape.circle,
                      size: ButtonSize.large,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      text: 'Middle',
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      text: 'Middle',
                      icon: Icon(Icons.add),
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      color: Color(0xffEB2F96),
                      shape: ButtonShape.circle,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      text: 'Small',
                      size: ButtonSize.small,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      size: ButtonSize.small,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      size: ButtonSize.small,
                      shape: ButtonShape.circle,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          DemoBlock(
            title: "图形",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(spacing: 4, runSpacing: 4, children: [
                  AntButton(
                    shape: ButtonShape.circle,
                    icon: Icon(Icons.add),
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  AntButton(
                    shape: ButtonShape.round,
                    icon: Icon(Icons.add),
                  )
                ]),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    AntButton(
                      text: 'Middle',
                      shape: ButtonShape.circle,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      shape: ButtonShape.round,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      shape: ButtonShape.circle,
                      size: ButtonSize.small,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      shape: ButtonShape.circle,
                      size: ButtonSize.middle,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      shape: ButtonShape.circle,
                      size: ButtonSize.large,
                      color: Color(0xffEB2F96),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                    AntButton(
                      text: 'Middle',
                      icon: Icon(Icons.add),
                      shape: ButtonShape.circle,
                      color: Color(0xffEB2F96),
                      onPressed: () {
                        print('ElevatedButton');
                      },
                    ),
                  ],
                ),
              ],

            ),
          ),
          DemoBlock(title: "自定义样式",child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  AntButton(
                    style: StateStyle(
                      style: Style(borderColor: Colors.amber)
                    ),
                    text: "Button",
                  )
                ],
              )
            ],),)
        ]));
  }
}

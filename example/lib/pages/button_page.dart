import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';

class ButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Button'),
        ),
        body: Center(
            child: Column(

            children: [
          Row(
            children: [
              Button(
                type: ButtonType.primary,
                text: 'Primary',
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
              Button(
                type: ButtonType.dashed,
                text: 'Default',
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
              Button(
                type: ButtonType.link,
                text: 'Link',
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
              Button(
                type: ButtonType.text,
                text: 'Text',
                onPressed: () {
                  print('ElevatedButton');
                },
              )
            ],
          ),
              Row(
                children: [
                  Button(
                    text: 'Primary',
                    variant: ButtonVariant.solid,
                    color: ButtonColor.primary,
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                  Button(
                    type: ButtonType.dashed,
                    text: 'Default',
                    onPressed: () {
                      print('ElevatedButton');
                    },
                  ),
                ]
              )
        ])));
  }
}

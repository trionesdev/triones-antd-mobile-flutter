import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';
import 'package:widgets_easier/widgets_easier.dart';

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
            child: Column(children: [
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
                text: 'Default',
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
              Button(
                type: ButtonType.dashed,
                text: 'Dashed',
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
              ),
              Button(
                type: ButtonType.link,
                text: 'Link',
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
            ],
          ),
          Row(children: [
            Button(
              text: 'Primary',
              color: Color(0xff000000),
              variant: ButtonVariant.solid,
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.outlined,
              color: Color(0xff000000),
              text: 'Outlined',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.dashed,
              color: Color(0xff000000),
              text: 'Dashed',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.filled,
              color: Color(0xff000000),
              text: 'Filled',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.text,
              color: Color(0xff000000),
              text: 'Text',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.link,
              color: Color(0xff000000),
              text: 'Link',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
          ]),
          Row(children: [
            Button(
              text: 'Primary',
              variant: ButtonVariant.solid,
              color: Color(0xff1677FF),
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.outlined,
              color: Color(0xff1677FF),
              text: 'Outlined',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.dashed,
              color: Color(0xff1677FF),
              text: 'Dashed',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.filled,
              color: Color(0xff1677FF),
              text: 'Filled',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.text,
              color: Color(0xff1677FF),
              text: 'Text',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.link,
              color: Color(0xff1677FF),
              text: 'Link',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
          ]),
          Row(children: [
            Button(
              text: 'Primary',
              variant: ButtonVariant.solid,
              color: Color(0xffFF4D4F),
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.outlined,
              color: Color(0xffFF4D4F),
              text: 'Outlined',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.dashed,
              color: Color(0xffFF4D4F),
              text: 'Dashed',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.filled,
              color: Color(0xffFF4D4F),
              text: 'Filled',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.text,
              color: Color(0xffFF4D4F),
              text: 'Text',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.link,
              color: Color(0xffFF4D4F),
              text: 'Link',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
          ]),
          Row(children: [
            Button(
              text: 'Primary',
              variant: ButtonVariant.solid,
              color: Color(0xffEB2F96),
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.outlined,
              color: Color(0xffEB2F96),
              text: 'Outlined',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.dashed,
              color: Color(0xffEB2F96),
              text: 'Dashed',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.filled,
              color: Color(0xffEB2F96),
              text: 'Filled',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.text,
              color: Color(0xffEB2F96),
              text: 'Text',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
            Button(
              variant: ButtonVariant.link,
              color: Color(0xffEB2F96),
              text: 'Link',
              onPressed: () {
                print('ElevatedButton');
              },
            ),
          ]),
          Row(
            children: [
              Button(
                text: 'Large',
                size: ButtonSize.large,
                color: Color(0xffEB2F96),
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
              Button(
                text: 'Middle',
                color: Color(0xffEB2F96),
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
              Button(
                text: 'Small',
                size: ButtonSize.small,
                color: Color(0xffEB2F96),
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
            ],
          ),
              Row(children: [
                Button(
                  text: 'Middle',
                  shape: ButtonShape.circle,
                  color: Color(0xffEB2F96),
                  onPressed: () {
                    print('ElevatedButton');
                  },
                ),
              ],)
        ])));
  }
}

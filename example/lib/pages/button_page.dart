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
          Wrap(
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
          Wrap(
            spacing: 4,
            runSpacing: 4,
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            children: [
              AntButton(
                text: 'MaterialButton',
                icon: Icon(Icons.add),
                shape: ButtonShape.round,
                color: Color(0xffEB2F96),
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
              AntButton(
                icon: Icon(Icons.add),
                color: Color(0xffEB2F96),
                onPressed: () {
                  print('ElevatedButton');
                },
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(color: Colors.red, width: 1),
                  ),
                  color: Colors.white,
                  onPressed: null,
                  child: Text("TextButton"))
            ],
          ),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  print('ElevatedButton');
                },
                // padding: EdgeInsets.all(0),
                color: Color(0xffEB2F96),
                minWidth: 10,
                shape: CircleBorder(side: BorderSide(color: Colors.red)),
                child: Icon(Icons.add),
              ),
              MaterialButton(
                onPressed: () {
                  print('ElevatedButton');
                },
                // minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(color: Colors.red, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.add), Text('MaterialButton')],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  print('ElevatedButton');
                },
                // minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(color: Colors.red, width: 1),
                ),
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.add), Text('MaterialButton')],
                ),
              ),
            ],
          ),
        ]));
  }
}

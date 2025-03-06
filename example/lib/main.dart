import 'package:antd_flutter_example/pages/app_bar_page.dart';
import 'package:antd_flutter_example/pages/button_page.dart';
import 'package:antd_flutter_example/pages/calendar_picker_page.dart';
import 'package:antd_flutter_example/pages/cascader_picker_page.dart';
import 'package:antd_flutter_example/pages/form_page.dart';
import 'package:antd_flutter_example/pages/grid_page.dart';
import 'package:antd_flutter_example/pages/input_page.dart';
import 'package:antd_flutter_example/pages/list_page.dart';
import 'package:antd_flutter_example/pages/modal_page.dart';
import 'package:antd_flutter_example/pages/picker_page.dart';
import 'package:antd_flutter_example/pages/popup_page.dart';
import 'package:antd_flutter_example/pages/search_bar_page.dart';
import 'package:antd_flutter_example/pages/space_page.dart';
import 'package:antd_flutter_example/pages/tab_bar_page.dart';
import 'package:antd_flutter_example/pages/tag_page.dart';
import 'package:antd_flutter_example/pages/toast_page.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AntApp(
      title: 'Flutter Demo',
      theme: AntThemeData(),
      routes: {
        '/button': (context) => ButtonPage(),
        '/input': (context) => InputPage(),
        '/form': (context) => FormPage(),
        '/app-bar': (context) => AppBarPage(),
        '/grid': (context) => GridPage(),
        '/tab-bar': (context) => TabBarPage(),
        '/list': (context) => ListPage(),
        '/space': (context) => SpacePage(),
        '/search-bar': (context) => SearchBarPage(),
        '/tag': (context) => TagPage(),
        '/popup': (context) => PopupPage(),
        '/picker': (context) => PickerPage(),
        '/cascader-picker': (context) => CascaderPickerPage(),
        '/calendar-picker': (context) => CalendarPickerPage(),
        '/modal': (context) => ModalPage(),
        '/toast': (context) => ToastPage(),
      },
      home: const MyHomePage(title: 'Ant Mobile Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return material.Scaffold(
      backgroundColor: material.Colors.white,
      appBar: material.AppBar(
        backgroundColor: material.Colors.white,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          material.ListTile(
            title: Text('Button 按钮'),
            onTap: () {
              Navigator.pushNamed(context, '/button');
            },
          ),
          material.ListTile(
            title: Text('Input 输入框'),
            onTap: () {
              Navigator.pushNamed(context, '/input');
            },
          ),
          material.ListTile(
            title: Text('Form 表单'),
            onTap: () {
              Navigator.pushNamed(context, '/form');
            },
          ),
          material.ListTile(
            title: Text('AppBar '),
            onTap: () {
              Navigator.pushNamed(context, '/app-bar');
            },
          ),
          material.ListTile(
            title: Text('Grid 栅格'),
            onTap: () {
              Navigator.pushNamed(context, '/grid');
            },
          ),
          material.ListTile(
            title: Text('TabBar'),
            onTap: () {
              Navigator.pushNamed(context, '/tab-bar');
            },
          ),
          material.ListTile(
            title: Text('List 列表'),
            onTap: () {
              Navigator.pushNamed(context, '/list');
            },
          ),
          material.ListTile(
            title: Text('Space 间距'),
            onTap: () {
              Navigator.pushNamed(context, '/space');
            },
          ),
          material.ListTile(
            title: Text('SearchBar 搜索栏'),
            onTap: () {
              Navigator.pushNamed(context, '/search-bar');
            },
          ),
          material.ListTile(
            title: Text('Tag 标签'),
            onTap: () {
              Navigator.pushNamed(context, '/tag');
            },
          ),
          material.ListTile(
            title: Text('Popup 弹框'),
            onTap: () {
              Navigator.pushNamed(context, '/popup');
            },
          ),
          material.ListTile(
            title: Text('Picker 选择器'),
            onTap: () {
              Navigator.pushNamed(context, '/picker');
            },
          ),
          material.ListTile(
            title: Text('CascasderPicker 级联选择器'),
            onTap: () {
              Navigator.pushNamed(context, '/cascader-picker');
            },
          ),
          material.ListTile(
            title: Text('CalendarPicker 日历选择器'),
            onTap: () {
              Navigator.pushNamed(context, '/calendar-picker');
            },
          ),
          material.ListTile(
            title: Text('Modal 模态框'),
            onTap: () {
              Navigator.pushNamed(context, '/modal');
            },
          ),
          material.ListTile(
            title: Text('Toast 轻提示'),
            onTap: () {
              Navigator.pushNamed(context, '/toast');
            },
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

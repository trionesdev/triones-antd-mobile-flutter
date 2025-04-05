import 'package:antd_flutter_example/pages/action_sheet_page.dart';
import 'package:antd_flutter_example/pages/alert_page.dart';
import 'package:antd_flutter_example/pages/app_bar_page.dart';
import 'package:antd_flutter_example/pages/avatar_page.dart';
import 'package:antd_flutter_example/pages/badge_page.dart';
import 'package:antd_flutter_example/pages/breadcrumb_page.dart';
import 'package:antd_flutter_example/pages/button_page.dart';
import 'package:antd_flutter_example/pages/calendar_datetime_picker_page.dart';
import 'package:antd_flutter_example/pages/calendar_picker_page.dart';
import 'package:antd_flutter_example/pages/cascader_picker_page.dart';
import 'package:antd_flutter_example/pages/divider_page.dart';
import 'package:antd_flutter_example/pages/empty_page.dart';
import 'package:antd_flutter_example/pages/form_page.dart';
import 'package:antd_flutter_example/pages/grid_page.dart';
import 'package:antd_flutter_example/pages/images_wall_page.dart';
import 'package:antd_flutter_example/pages/input_page.dart';
import 'package:antd_flutter_example/pages/list_page.dart';
import 'package:antd_flutter_example/pages/mask_page.dart';
import 'package:antd_flutter_example/pages/modal_page.dart';
import 'package:antd_flutter_example/pages/picker_page.dart';
import 'package:antd_flutter_example/pages/popup_page.dart';
import 'package:antd_flutter_example/pages/radio_page.dart';
import 'package:antd_flutter_example/pages/search_bar_page.dart';
import 'package:antd_flutter_example/pages/space_page.dart';
import 'package:antd_flutter_example/pages/switch_page.dart';
import 'package:antd_flutter_example/pages/tab_bar_page.dart';
import 'package:antd_flutter_example/pages/tabs_page.dart';
import 'package:antd_flutter_example/pages/tag_page.dart';
import 'package:antd_flutter_example/pages/timeline_page.dart';
import 'package:antd_flutter_example/pages/toast_page.dart';
import 'package:antd_flutter_example/pages/upload_page.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

void main() {
  // debugPaintSizeEnabled = true;
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
        '/avatar': (context) => AvatarPage(),
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
        '/calendar-datetime-picker': (context) => CalendarDatetimePickerPage(),
        '/modal': (context) => ModalPage(),
        '/toast': (context) => ToastPage(),
        '/divider': (context) => DividerPage(),
        '/alert': (context) => AlertPage(),
        '/switch': (context) => SwitchPage(),
        '/mask': (context) => MaskPage(),
        '/badge': (context) => BadgePage(),
        '/upload': (context) => UploadPage(),
        '/images-wall': (context) => ImagesWallPage(),
        '/action-sheet': (context) => ActionSheetPage(),
        '/timeline': (context) => TimelinePage(),
        '/empty': (context) => EmptyPage(),
        '/breadcrumb': (context) => BreadcrumbPage(),
        '/tabs': (context) => TabsPage(),
        '/radio': (context) => RadioPage(),
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
            title: Text('Avatar 头像'),
            onTap: () {
              Navigator.pushNamed(context, '/avatar');
            },
          ),
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
            title: Text('CalendarDatetimePicker 日历时间选择器'),
            onTap: () {
              Navigator.pushNamed(context, '/calendar-datetime-picker');
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
          material.ListTile(
            title: Text('Divider 分割线'),
            onTap: () {
              Navigator.pushNamed(context, '/divider');
            },
          ),
          material.ListTile(
            title: Text('Alert 告警提示'),
            onTap: () {
              Navigator.pushNamed(context, '/alert');
            },
          ),
          material.ListTile(
            title: Text('Switch 开关'),
            onTap: () {
              Navigator.pushNamed(context, '/switch');
            },
          ),
          material.ListTile(
            title: Text('Mask 背景蒙层'),
            onTap: () {
              Navigator.pushNamed(context, '/mask');
            },
          ),
          material.ListTile(
            title: Text('Badge 徽标'),
            onTap: () {
              Navigator.pushNamed(context, '/badge');
            },
          ),
          material.ListTile(
            title: Text('Upload 上传'),
            onTap: () {
              Navigator.pushNamed(context, '/upload');
            },
          ),
          material.ListTile(
            title: Text('ImagesWall 图片墙'),
            onTap: () {
              Navigator.pushNamed(context, '/images-wall');
            },
          ),
          material.ListTile(
            title: Text('ActionSheet 操作面板'),
            onTap: () {
              Navigator.pushNamed(context, '/action-sheet');
            },
          ),
          material.ListTile(
            title: Text('Timeline 时间轴'),
            onTap: () {
              Navigator.pushNamed(context, '/timeline');
            },
          ),
          material.ListTile(
            title: Text('Empty 空状态'),
            onTap: () {
              Navigator.pushNamed(context, '/empty');
            },
          ),
          material.ListTile(
            title: Text('Breadcrumb 面包屑'),
            onTap: () {
              Navigator.pushNamed(context, '/breadcrumb');
            },
          ),
          material.ListTile(
            title: Text('Tabs 标签页'),
            onTap: () {
              Navigator.pushNamed(context, '/tabs');
            },
          ),
          material.ListTile(
            title: Text('Radio 单选框'),
            onTap: () {
              Navigator.pushNamed(context, '/radio');
            },
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

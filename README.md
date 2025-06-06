# Antd 风格的 Flutter组件库

[![pub package](https://img.shields.io/pub/v/trionesdev_antd_mobile.svg)](https://pub.dev/packages/trionesdev_antd_mobile)

## 组件目录
- [x] Scaffold 脚手架
- [x] Button 按钮
- [x] Collapse 折叠面板
- [x] Dialog 对话框
- [x] Divider 分割线
- [x] Grid 栅格
- [x] Space 间距
- [x] AppBar 导航栏
- [x] TabBar 标签栏
- [x] Tabs 标签页
- [x] Avatar 头像
- [x] Card 卡片
- [x] List 列表
- [x] Tag 标签
- [x] Cascader 级联选择
- [x] Checkbox 复选框
- [x] Form 表单
- [x] Input 输入框
- [x] Picker 选择器
- [x] CalendarPicker 日历选择器
- [x] CalendarDatetimePicker 日历时间选择器
- [x] Radio 单选框
- [x] Rate 评分
- [x] SearchBar 搜索框
- [x] Switch 开关
- [x] TextArea 文本域
- [x] ActionSheet 操作面板
- [x] Empty 空状态
- [x] Modal 弹窗
- [x] Popup 弹出层
- [x] Toast 请提示
- [x] Badge 徽标
- [x] Image 图片
- [x] ImagesWall 图片墙
- [x] Alert 告警提示
- [x] Mask 背景蒙层
- [x] Timeline 时间轴
- [x] Breadcrumb 面包屑
- [x] InputNumber 数字输入框

## 直接使用
```dart
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
      theme: AntThemeData(
        // colorPrimary: material.Colors.amber,
      ),
      routes: {

      },
      home: const MyHomePage(title: 'Ant Mobile Flutter Demo Home Page'),
    );
  }
}
```

## 使用Getx
1. 直接使用Getx
```dart
AntThemeData antThemeData = AntThemeData();
AntTheme(
  data: antThemeData,
  child: GetMaterialApp(
        title: 'TrionesDev',
        theme: antThemeData.toMaterialThemeData(),
        getPages: Routes.routes,
        home: const HomePage(),
        onInit: ()  {
        
        },
        onReady: () {},
    )
)
```
2. 使用封装的AntGetx组件
地址: https://github.com/trionesdev/triones-get-antd

使用方法
```dart
  runApp(GetAntApp(
    title: 'TrionesDev',
    theme: AntThemeData(),
    getPages: Routes.routes,
    home: const HomeLayout(),
    onInit: ()  async {

    },
    onReady: () {},
  ));
```

#### 互相吹捧，共同进步
> 留言回复不及时，可以通过关注公众号联系我们
<div style="width: 100%;text-align: center;">
   <img src="images/shuque_wx.jpg" width="200px" alt="">
</div>

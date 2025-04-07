# Avatar 头像

## 代码演示

```dart preview:/avatar
import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({super.key});

  @override
  State<StatefulWidget> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text('Avatar 头像'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(title: "基本使用", child: Column(
              spacing: 10,
              children: [
                AntSpace(children: [
                  AntAvatar(shape: AntAvatarShape.circle, size: 64, icon: Icon(Icons.person),),
                  AntAvatar(shape: AntAvatarShape.circle, size: 40, icon: Icon(Icons.person),),
                  AntAvatar(shape: AntAvatarShape.circle, size: 32, icon: Icon(Icons.person),),
                ],),
                AntSpace(children: [
                  AntAvatar(shape: AntAvatarShape.square, size: 64, icon: Icon(Icons.person),),
                  AntAvatar(shape: AntAvatarShape.square, size: 40, icon: Icon(Icons.person),),
                  AntAvatar(shape: AntAvatarShape.square, size: 32, icon: Icon(Icons.person),),
                ],)
              ],
            ),)
          ],
        ),
      ),
    );
  }

}
```

## API

| 属性         | 说明   | 类型                                  | 默认值      |
|------------|------|-------------------------------------|----------|
| style      | 按钮样式 | StateStyle                          |          |
| decoration | 背景渲染 | BoxDecoration                       |          |
| shape      | 头像形状 | AntAvatarShape:`circle` \| `square` | `circle` |
| size       | 头像大小 | double                              | 32       |
| src        | 网络地址 | string                              |          |
| icon       | 图标   | Widget                              |          |
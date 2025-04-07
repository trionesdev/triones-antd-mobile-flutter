# TabBar 标签栏

## 代码演示

```dart preview:/tab-bar
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
        appBar: AntAppBar(
          title: Text("TabBar"),
        ),
        bottomNavigationBar: AntTabBar(items: [
          AntTabBarItem(
              icon: Icons.home,
              label: "首页",
              id: 'index',
              activeColor: Color(0xff1677FF),
              onPressed: (String id) {
                print(id);
              }),
          AntTabBarItem(
            icon: Icons.search,
            label: "搜索",
            id: 'search',
          )
        ]));
  }
}

```

## API

### AntTabBar

属性说明如下

| 参数          | 说明      | 类型                    | 默认值          |
|-------------|---------|-----------------------|--------------|
| style       | 样式      | StateStyle            |              |
| decoration  | 背景渲染    | BoxDecoration         |              |
| padding     | 衬垫      | EdgeInsetsGeometry    |              |
| height      | 高度      | double                | 54           |
| color       | 未选中颜色   | Color                 | black        |
| activeColor | 选中颜色    | Color                 | primaryColor |
| activeColor | 选中颜色    | Color                 | primaryColor |
| onChange    | 激活项变更事件 | Function(String key)? |              |
| children    | tab项    | List\<AntTabBarItem>  | []           |

### AntTabBarItem

属性说明如下

| 参数              | 说明     | 类型                    | 默认值          |
|-----------------|--------|-----------------------|--------------|
| tabKey          | String | 标识                    |              |
| icon            | 图标     | Widget                |              |
| label           | 文本     | Widget                |              |
| color           | 未选中颜色  | Color                 | black        |
| activeColor     | 选中颜色   | Color                 | primaryColor |
| onPressed       | 点击事件   | Function(String key)? |              |
| stopPropagation | 停止冒泡   | bool                  | true         |
# TabBar 标签栏

标签栏组件，通常用于应用底部导航。

## 何时使用

当需要在应用底部提供主要页面间的导航时使用。

## 代码演示

```dart src=../example/lib/pages/tab_bar_page.dart preview=/tab-bar
```

## API

### AntTabBar

标签栏的属性说明如下：

| 属性               | 说明          | 类型                    | 默认值  |
|------------------|-------------|-----------------------|------|
| style            | 样式          | StateStyle?           | null |
| decoration       | 装饰          | BoxDecoration?        | null |
| padding          | 边距          | EdgeInsetsGeometry?   | null |
| height           | 高度          | double?               | 54   |
| color            | 颜色          | Color?                | null |
| activeColor      | 激活颜色        | Color?                | null |
| activeKey        | 当前激活的 tabKey（受控） | String?               | null |
| defaultActiveKey | 默认激活的 tabKey（非受控） | String?               | null |
| onChange         | 切换回调，参数为 key 与索引 | `Function(String key, int index)?` | null |
| children         | 子组件         | `List<Widget>?`         | null |

### AntTabBarItem

标签项的属性说明如下：

| 属性              | 说明     | 类型                    | 默认值  |
|-----------------|--------|-----------------------|------|
| antKey          | 标识（必填） | String                | -    |
| child           | 自定义子组件（设置后忽略 icon/label） | Widget?               | null |
| icon            | 图标     | Widget?               | null |
| activeIcon      | 激活态图标  | Widget?               | null |
| label           | 标签     | Widget?               | null |
| labelText       | 标签文本   | String?               | null |
| labelTextStyle  | 标签文本样式 | TextStyle?            | null |
| onPressed       | 点击事件   | Function(String key)? | null |
| color           | 颜色     | Color?                | null |
| activeColor     | 激活颜色   | Color?                | null |
| stopPropagation | 保留字段（兼容） | bool                  | true |
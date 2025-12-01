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
| activeKey        | 当前激活的tabKey | String?               | null |
| defaultActiveKey | 默认激活的tabKey | String?               | null |
| onChange         | 切换回调        | Function(String key)? | null |
| children         | 子组件         | List<Widget>?         | null |

### AntTabBarItem

标签项的属性说明如下：

| 属性              | 说明     | 类型                    | 默认值  |
|-----------------|--------|-----------------------|------|
| antKey          | 标识（必填） | String                | -    |
| child           | 子组件    | Widget?               | null |
| icon            | 图标     | Widget?               | null |
| label           | 标签     | Widget?               | null |
| onPressed       | 点击事件   | Function(String key)? | null |
| color           | 颜色     | Color?                | null |
| activeColor     | 激活颜色   | Color?                | null |
| stopPropagation | 是否阻止冒泡 | bool                  | true |
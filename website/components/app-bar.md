# AppBar 导航栏

## 代码演示

```dart src=../example/lib/pages/tab_bar_page.dart preview=/app-bar

```

## API

| 参数            | 说明       | 类型                             | 默认值                    |
|---------------|----------|--------------------------------|------------------------|
| style         | 按钮样式     | StateStyle                     |                        |
| title         | 标题       | Widget                         |                        |
| back          | 是否显示返回按钮 | bool                           | true                   |
| backIcon      | 返回按钮图标   | Widget                         | Icon(Icons.arrow_back) |
| backText      | 返回按钮文字   | Widget                         |                        |
| onBack        | 返回按钮点击事件 | Function(BuildContext context) |                        |
| left          | 左侧按钮     | List\<Widget>                  |                        |
| right         | 右侧按钮     | List\<Widget>                  |                        |
| decoration    | 背景装饰     | BoxDecoration                  |                        |
| bottom        | 底部组件     | Widget                         |                        |
| bottomHeight  | 底部组件高度   | double                         | 0                      |
| toolbarHeight | 工具栏组件高度  | double                         | 0                      |
| child         | 子组件      | Widget                         |                        |

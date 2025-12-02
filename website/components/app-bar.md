# AppBar 导航栏

AppBar 是页面顶部导航栏组件，通常包含返回按钮、页面标题和操作按钮。

## 何时使用

- 位于页面顶部，用于页面间导航
- 需要提供返回操作的页面
- 需要在顶部展示操作按钮的页面
- 需要展示页面标题和副标题的场景

## 代码演示

```dart src=../example/lib/pages/tab_bar_page.dart preview=/app-bar

```

## API

| 参数                   | 说明                | 类型                    | 默认值  |
|----------------------|-------------------|-----------------------|------|
| backIcon             | 返回图标              | Widget?               | null |
| back                 | 返回图标后面的内容(Widget) | Widget?               | null |
| backText             | 显示返回图标的文本         | String?               | null |
| showBack             | 是否显示返回图标          | bool                  | true |
| onBack               | 返回时回调             | Function?             | null |
| leading              | 左侧返回图标后面的内容       | Widget?               | null |
| title                | 标题                | Widget?               | null |
| titleText            | 显示标题的文本           | String?               | null |
| actions              | 右侧操作按钮            | `List<Widget>?`         | null |
| toolbarHeight        | 顶部导航栏高度           | double?               | null |
| bottom               | 底部内容              | PreferredSizeWidget?  | null |
| centerTitle          | 是否居中显示            | bool?                 | true |
| backgroundColor      | 背景颜色              | Color?                | null |
| decoration           | 装饰                | BoxDecoration?        | null |
| systemUiOverlayStyle | 系统状态栏样式           | SystemUiOverlayStyle? | null |
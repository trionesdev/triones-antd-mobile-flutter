# AppBar 导航栏

## 代码演示

```dart src=../example/lib/pages/tab_bar_page.dart preview=/app-bar

```

## API

| 参数            | 说明          | 类型                     | 默认值  |
|---------------|-------------|------------------------|------|
| backIcon      | 返回图标        | Widget?                | -    |
| backText      | 返回文本        | Widget?                | -    |
| back          | 是否展示返回图标    | bool                   | true |
| onBack        | 返回时回调       | `Function?`            | true |
| leading       | 左侧返回图标后面的内容 | Widget?                | -    |
| actions       | 右侧操作按钮      | `List<Widget>?`        | -    |
| toolbarHeight | 工具栏高度       | double?                | 56   |
| bottom        | 底部布局(带高度)   | `PreferredSizeWidget?` |      |
| centerTitle   | 标题是否居中显示    | bool                   | true |
| decoration    | 组件背景样式      | `BoxDecoration?`       |      |

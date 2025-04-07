# Button 按钮

按钮用于开始一个即时操作。

## 何时使用

标记了一个（或封装一组）操作命令，响应用户点击行为，触发相应的业务逻辑。

## 代码演示

```dart src=../example/lib/pages/button_page.dart preview=/button
```

## API

按钮的属性说明如下：

| 属性        | 说明      | 类型                                              | 默认值    |
|-----------|---------|-------------------------------------------------|--------|
| style     | 按钮样式    | StateStyle                                      |        |
| type      | 按钮类型    | AntButtonType:primary,text,link                 |        |
| variant   | 设置按钮的变体 | AntButtonVariant:outline,solid,filled,text,link |        |
| text      | 按钮文字    | String                                          |        |
| icon      | 按钮图标    | Icon                                            |        |
| color     | 按钮颜色    | Color                                           |        |
| shape     | 按钮形状    | AntButtonShape:circle,round                     | round  |
| size      | 按钮大小    | AntButtonSize:small,middle,large                | middle |
| onPressed | 点击事件    | Function                                        |        |
| disabled  | 是否禁用    | bool                                            | false  |
| block     | 是否块级元素  | bool                                            | false  |
| danger    | 是否危险按钮  | bool                                            | false  |


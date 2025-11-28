# Button 按钮

按钮用于开始一个即时操作。

## 何时使用

标记了一个（或封装一组）操作命令，响应用户点击行为，触发相应的业务逻辑。

## 代码演示

```dart src=../example/lib/pages/button_page.dart preview=/button
```

## API

按钮的属性说明如下：

| 属性        | 说明      | 类型                | 默认值    |
|-----------|---------|-------------------|--------|
| style     | 按钮样式    | StateStyle?       | null   |
| type      | 按钮类型    | AntButtonType?    | null   |
| variant   | 设置按钮的变体 | AntButtonVariant? | null   |
| text      | 按钮文字    | String?           | null   |
| icon      | 按钮图标    | Widget?           | null   |
| color     | 按钮颜色    | Color?            | null   |
| shape     | 按钮形状    | AntButtonShape    | round  |
| size      | 按钮大小    | AntSize           | middle |
| onPressed | 点击事件    | VoidCallback?     | null   |
| disabled  | 是否禁用    | bool?             | false  |
| block     | 是否块级元素  | bool?             | false  |
| danger    | 是否危险按钮  | bool?             | false  |
| child     | 子组件     | Widget?           | null   |

### AntButtonType 枚举值

| 值       | 说明   |
|---------|------|
| primary | 主要按钮 |
| text    | 文本按钮 |
| link    | 链接按钮 |

### AntButtonVariant 枚举值

| 值        | 说明   |
|----------|------|
| outlined | 描边按钮 |
| solid    | 实心按钮 |
| filled   | 填充按钮 |
| text     | 文本按钮 |
| link     | 链接按钮 |

### AntButtonShape 枚举值

| 值      | 说明   |
|--------|------|
| circle | 圆形   |
| round  | 圆角矩形 |

### AntSize 枚举值

| 值      | 说明  | 尺寸    |
|--------|-----|-------|
| small  | 小尺寸 | 高24px |
| middle | 中尺寸 | 高32px |
| large  | 大尺寸 | 高48px |

### 优先级说明

1. child 和 text 属性中，优先使用 child 属性作为按钮内容。
2. 当 icon 和 text 都存在时，按钮会同时显示图标和文字。
3. 当只有 icon 且没有 text 和 child 时，按钮表现为图标按钮。
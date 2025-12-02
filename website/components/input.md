# Input 输入框

输入框用于接收用户输入的内容。

## 何时使用

当需要用户输入内容时使用，支持文本、密码和数字类型的输入。

## 代码演示

```dart src=../example/lib/pages/input_page.dart preview=/input
```

## API

输入框的属性说明如下：

| 属性           | 说明     | 类型                      | 默认值    |
|--------------|--------|-------------------------|--------|
| size         | 组件大小   | AntSize                 | middle |
| height       | 输入框高度  | double?                 | null   |
| placeholder  | 提示文本   | String?                 | null   |
| type         | 输入框类型  | AntInputType?           | text   |
| prefix       | 前缀     | Widget?                 | null   |
| suffix       | 后缀     | Widget?                 | null   |
| value        | 当前值    | String?                 | null   |
| defaultValue | 默认值    | String?                 | null   |
| disabled     | 是否禁用   | bool                    | false  |
| onChange     | 值改变回调  | `ValueChanged<String>?` | null   |
| decoration   | 输入框装饰  | BoxDecoration?          | null   |
| style        | 样式     | StateStyle?             | null   |
| onBlur       | 失去焦点回调 | `ValueGetter<void>?`    | null   |
| onFocus      | 获得焦点回调 | `ValueGetter<void>?`    | null   |

### AntInputType 枚举值

| 值        | 说明   |
|----------|------|
| text     | 文本输入 |
| password | 密码输入 |
| number   | 数字输入 |

### AntSize 枚举值

| 值      | 说明  | 尺寸    |
|--------|-----|-------|
| small  | 小尺寸 | 高24px |
| middle | 中尺寸 | 高32px |
| large  | 大尺寸 | 高48px |
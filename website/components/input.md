# Input 输入框

输入框用于接收用户输入的内容。

## 何时使用

当需要用户输入内容时使用，支持文本、密码和数字类型的输入。

## 代码演示

```dart src=../example/lib/pages/input_page.dart preview=/input
```

## API

输入框的属性说明如下：

|属性           | 说明         | 类型                      | 默认值     |
|--------------|------------|-------------------------|----------|
| size         |组件大小       | AntSize                 | middle   |
| readOnly     | 是否只读       | bool                    | false    |
| height       | 输入框高度      | double?                 | null     |
| placeholder  | 提示文本       | String?                 | null     |
| type         | 输入框类型      | AntInputType?           | text     |
| prefix       | 前缀         | Widget?                 | null     |
| suffix       |后缀         | Widget?                 | null     |
| value        | 当前值        | String?                 | null     |
| defaultValue | 默认值        | String?                 | null     |
| disabled     | 是否禁用       | bool                    | false    |
| onChange     | 值改变回调      | `ValueChanged<String>?` | null     |
| decoration   | 输入框装饰      | BoxDecoration?          | null     |
| padding      |内边距        | EdgeInsetsGeometry?     | null     |
| style        |样式         | StateStyle?             | null     |
| onBlur       | 失去焦点回调     | `ValueGetter<void>?`    | null     |
| onFocus      |获得焦点回调     | `ValueGetter<void>?`    | null     |
| align        | 对齐方式       | AntInputAlign?          | null     |
| variant      | 输入框样式      | AntInputVariant?        | borderless |
| borderRadius | 边框圆角       | BorderRadius?           | null     |
| border       |边框         | BorderSide?             | null     |
| focusedBorder| 选中时的边框     | BorderSide?             | null     |

### AntInputType枚举值

| 值        | 说明   |
|----------|------|
| text     | 文本输入 |
| password |密码输入 |
| number   | 数字输入 |

### AntInputAlign枚举值

|值     | 说明   |
|-------|------|
| left  |左齐  |
| right |右齐  |

### AntInputVariant枚举值

|值          | 说明     |
|------------|--------|
| outlined   |描样式   |
| borderless | 无边框样式  |
| filled     |样式   |
| underlined | 下划线样式  |

### AntSize枚举值

|值 | 说明  |尺寸    |
|--------|-----|-------|
| small  |小尺寸 | 高24px |
| middle | 中尺寸 | 高32px |
| large  |大尺寸 | 高40px |
# Input 输入框

## 代码演示

```dart src=../example/lib/pages/input_page.dart preview=/input

```

## API

| 属性          | 说明     | 类型                                | 默认值 |
|-------------|--------|-----------------------------------|-----|
| style       | 按钮样式   | StateStyle                        |     |
| decoration  | 背景渲染   | BoxDecoration                     |     |
| type        | 输入框类型  | AntInputType: `text`\| `password` |     |
| prefix      | 前缀     | Widget                            |     |
| suffix      | 后缀     | Widget                            |     |
| placeholder | 占位     | String                            |     |
| value       | 值      | String                            |     |
| onChange    | 值变化回调  | Function(String val)              |     |
| onBlur      | 失去焦点回调 | Function(String val)              |     |
| onFocus     | 获得焦点回调 | Function(String val)              |     |
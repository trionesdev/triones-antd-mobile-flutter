# TextArea 文本域

## 代码演示

```dart src=../example/lib/pages/text_area_page.dart preview=/text-area

```

## API

| 属性         | 说明                  | 类型                   | 默认值 |
|------------|---------------------|----------------------|-----|
| style      | 样式                  | `StateStyle`         | -   |
| decoration | 边框样式,优先级别高于 `style` | `BoxDecoration`      | -   |
| value      | 输入框的值               | String               | -   |
| onChange   | 变化回调                | Function(String val) | -   |
| minLines   | 最小行数                | int                  | 2   |
| maxLines   | 最大行数                | int                  | -   |
| onBlur     | 失去焦点回调              | Function()           | -   |
| onFocus    | 获得焦点回调              | Function()           | -   |
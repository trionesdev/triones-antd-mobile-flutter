# CalendarPicker 日历选择器

## 代码演示

```dart src=../example/lib/pages/calendar_picker_page.dart preview=/calendar-picker

```

## API

### 日历选择器 `showAntCalendarPicker`

| 属性    | 说明     | 类型                          | 默认值            |
|-------|--------|-----------------------------|----------------|
| value | 当前值    | `DateTime? `                | DateTime.now() |
| onOk  | 确定按钮回调 | `ValueChanged<DateTime?>? ` |                |

### 日历区间选择器 `showAntCalendarRangePicker`

| 属性    | 说明     | 类型                                | 默认值 |
|-------|--------|-----------------------------------|-----|
| value | 当前值    | `List<DateTime>?`                 |     |
| onOk  | 确定按钮回调 | `ValueChanged<List<DateTime?>?>?` |     |
# CalendarDatetimePicker 日历时间选择器

日历时间选择器是一个组合组件，允许用户选择日期和时间。

## 何时使用

- 需要用户选择具体的日期和时间时
- 表单中需要输入日期时间字段时
- 需要安排未来某个具体时间点的任务时

## 代码演示

```dart src=../example/lib/pages/calendar_datetime_picker_page.dart preview=/calendar-datetime-picker
```

## API

### AntCalendarDatetimePicker.show 方法

| 属性      | 说明     | 类型                       | 默认值            |
|---------|--------|--------------------------|----------------|
| context | 上下文    | BuildContext             | -              |
| value   | 当前值    | DateTime?                | DateTime.now() |
| onOk    | 确定按钮回调 | ValueChanged<DateTime?>? | null           |

### AntCalendarDatetimePickerView 组件

| 属性    | 说明     | 类型                       | 默认值  |
|-------|--------|--------------------------|------|
| value | 当前值    | DateTime?                | null |
| onOk  | 确定按钮回调 | ValueChanged<DateTime?>? | null |

### 组件特性

1. 组合了日历选择和时间选择功能
2. 时间选择器包含小时和分钟两列
3. 通过顶部标签在日期和时间选择视图之间切换
4. 支持默认值设置和确认回调
5. 使用弹出层展示选择器界面

### 使用说明

- 通过 `AntCalendarDatetimePicker.show` 静态方法显示选择器
- 选择完成后通过 `onOk` 回调获取结果
- 组件会自动处理日期和时间的选择与合并
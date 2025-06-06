# Calendar 日历

## 代码演示

```dart src=../example/lib/pages/calendar_page.dart preview=/calendar

```

## API

### AntCalendar 日历组件

| 属性         | 说明              | 类型                         | 默认值            |
|------------|-----------------|----------------------------|----------------|
| mouth      | 月份              | `DateTime? `               | DateTime.now() |
| value      | 选中日期            | `DateTime?`                | null           |
| onChange   | 选中日期变化回调        | `ValueChanged<DateTime?>?` | null           |
| onRendered | 渲染完成回调，返回当前组件高度 | `ValueChanged<double?>?`   | null           |

### AntCalendarRange 日历范围组件

| 属性         | 说明              | 类型                               | 默认值            |
|------------|-----------------|----------------------------------|----------------|
| mouth      | 月份              | `DateTime?`                      | DateTime.now() |
| value      | 选中日期            | `List<DateTime?>?`               | null           |
| onChange   | 选中日期变化回调        | `ValueChanged<List<DateTime>?>?` | null           |
| onRendered | 渲染完成回调，返回当前组件高度 | `ValueChanged<double?>?`         | null           |

### AntCalendarGrid 日历网格组件

| 属性         | 说明              | 类型                               | 默认值            |
|------------|-----------------|----------------------------------|----------------|
| mouth      | 月份              | `DateTime?`                      | DateTime.now() |
| value      | 选中日期            | `List<DateTime?>?`               | null           |
| onChange   | 选中日期变化回调        | `ValueChanged<List<DateTime>?>?` | null           |
| onRendered | 渲染完成回调，返回当前组件高度 | `ValueChanged<double?>?`         | null           |
| range      | 是否是范围模式         | `bool`                           | false          |

### AntCalendarGridTouchable 日历网格可滑动切换月份组件

| 属性            | 说明              | 类型                               | 默认值            |
|---------------|-----------------|----------------------------------|----------------|
| mouth         | 月份              | `DateTime?`                      | DateTime.now() |
| value         | 选中日期            | `List<DateTime?>?`               | null           |
| onChange      | 选中日期变化回调        | `ValueChanged<List<DateTime>?>?` | null           |
| onRendered    | 渲染完成回调，返回当前组件高度 | `ValueChanged<double?>?`         | null           |
| range         | 是否是范围模式         | `bool`                           | false          |
| onMouthChange | 月份变化回调          | `ValueChanged<DateTime>?`        | null           |
# Calendar 日历

日历组件用于让用户选择日期或者日期范围。

## 何时使用

- 需要用户选择单个日期时
- 需要用户选择日期范围时
- 需要在日历上展示特定日期信息时

## 代码演示

```dart src=../example/lib/pages/calendar_page.dart preview=/calendar
```

## API

### AntCalendar 日历组件

| 属性         | 说明              | 类型                       | 默认值  |
|------------|-----------------|--------------------------|------|
| mouth      | 选中月份            | DateTime?                | null |
| value      | 选中日期            | DateTime?                | null |
| onChange   | 选中日期变化回调        | ValueChanged<DateTime?>? | null |
| onRendered | 渲染完成回调，返回当前组件高度 | ValueChanged<double?>?   | null |

### AntCalendarRange 日历范围组件

| 属性         | 说明              | 类型                              | 默认值  |
|------------|-----------------|---------------------------------|------|
| mouth      | 选中月份            | DateTime?                       | null |
| value      | 选中日期            | `List<DateTime?>?`                | null |
| onChange   | 选中日期变化回调        | `ValueChanged<List<DateTime?>?>?` | null |
| onRendered | 渲染完成回调，返回当前组件高度 | ValueChanged<double?>?          | null |

### 组件特性

1. **AntCalendar**：用于选择单个日期
2. **AntCalendarRange**：用于选择日期范围
3. 支持通过手势滑动切换月份
4. 支持通过顶部导航控件切换月份和年份
5. 日期范围选择时，会高亮显示选中范围内的日期

### 使用说明

- 当使用范围选择时，value是一个包含开始和结束日期的列表
- onChange回调会在用户选择日期时触发
- onRendered回调会在组件渲染完成后触发，可用于获取组件高度
- 组件会自动处理月份切换的动画和逻辑
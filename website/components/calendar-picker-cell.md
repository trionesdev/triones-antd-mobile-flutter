# CalendarPickerCell 日历选择器单元格

CalendarPickerCell 是一个结合了单元格和日历选择器功能的组件，常用于表单中需要选择日期的场景。

## 代码演示

```dart src=../example/lib/pages/calendar_picker_cell_page.dart preview=/calendar-picker-cell
```

## API

### AntCalendarPickerCell 组件参数

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| placeholder | 占位符 | Text? | null |
| placeholderText | 占位符文本 | String? | null |
| label | 标签 | Widget? | null |
| labelText | 标签文本 | String? | null |
| labelCol | 标签列 | AntCol? | null |
| labelAlign | 标签对齐方式 | AntLabelAlign? | AntLabelAlign.left |
| wrapperAlign | 内容对齐方式 | AntAlign? | AntAlign.right |
| title | 模态框标题 | Widget? | null |
| titleText | 模态框标题文本 | String? | null |
| value | 当前值 | DateTime? | null |
| format | 日期格式 | String? | null |

## 使用示例

### 基础用法

```dart
// 基本日历选择
AntCalendarPickerCell(
  labelText: "选择日期",
  placeholderText: "请选择日期",
  value: DateTime(2026, 1, 15),
)

// 自定义格式的日历选择
AntCalendarPickerCell(
  labelText: "生日",
  format: "yyyy年MM月dd日",
  value: DateTime(1990, 5, 15),
)
```

### 带标题的使用

```dart
AntCalendarPickerCell(
  labelText: "选择日期",
  titleText: "请选择您的出生日期",
  value: DateTime(1990, 5, 15),
  format: "yyyy-MM-dd",
)
```

### 自定义对齐方式

```dart
AntCalendarPickerCell(
  labelText: "选择日期",
  labelAlign: AntLabelAlign.left,
  wrapperAlign: AntAlign.left,
  value: DateTime(2026, 1, 15),
)
```

### 在表单中使用

```dart
AntForm(
  children: [
    AntCalendarPickerCell(
      labelText: "开始日期",
      placeholderText: "请选择开始日期",
      value: _startDate,
      format: "yyyy-MM-dd",
    ),
    AntCalendarPickerCell(
      labelText: "结束日期",
      placeholderText: "请选择结束日期",
      value: _endDate,
      format: "yyyy年MM月dd日",
    ),
  ],
)
```

## 注意事项

1. `format` 参数用于控制显示的日期格式，遵循 `intl` 包的格式规范
2. 组件会根据父容器的布局自动适应宽度
3. 支持国际化，会根据系统语言显示相应的日期格式
4. 点击单元格会弹出日历选择器模态框
5. 选择完成后会自动更新显示内容
6. 组件基于 AntCell 构建，继承了 Cell 的所有样式和行为

## 常见日期格式

- `yyyy-MM-dd` - 2026-01-15
- `yyyy年MM月dd日` - 2026年01月15日
- `MM/dd/yyyy` - 01/15/2026
- `dd/MM/yyyy` - 15/01/2026
- `EEEE, MMMM dd, yyyy` - Monday, January 15, 2026

## 与 DatePickerCell 的区别

- CalendarPickerCell 使用日历视图进行日期选择
- DatePickerCell 使用轮播选择器进行日期选择
- CalendarPickerCell 更适合需要直观查看日期的场景
- DatePickerCell 更适合快速选择日期的场景
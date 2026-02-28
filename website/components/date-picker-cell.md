# DatePickerCell 日期选择器单元格

DatePickerCell 是一个结合了单元格和日期选择器功能的组件，常用于表单中需要选择日期的场景。

## 代码演示

```dart src=../example/lib/pages/date_picker_cell_page.dart preview=/date-picker-cell
```

## API

### AntDatePickerCell 组件参数

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| placeholder | 占位符 | Text? | null |
| placeholderText | 占位符文本 | String? | null |
| label | 标签 | Widget? | null |
| labelText | 标签文本 | String? | null |
| labelCol | 标签列 | AntCol? | null |
| labelAlign | 标签对齐方式 | AntLabelAlign? | AntLabelAlign.left |
| wrapperAlign | 内容对齐方式 | AntAlign? | AntAlign.right |
| format | 日期格式 | String? | null |
| title | 模态框标题 | Widget? | null |
| titleText | 模态框标题文本 | String? | null |
| mode | 日期选择模式 | AntDatePickerMode | AntDatePickerMode.date |
| showTime | 是否显示时间 | bool | false |
| timeFormat | 时间格式 | String? | null |
| value | 当前值 | DateTime? | null |
| onCancel | 取消回调 | Function? | null |
| minDate | 最小日期 | DateTime? | null |
| maxDate | 最大日期 | DateTime? | null |

### AntDatePickerMode 枚举值

| 值 | 说明 |
| --- | --- |
| date | 日期模式 |
| time | 时间模式 |

## 使用示例

### 基础用法

```dart
// 基本日期选择
AntDatePickerCell(
  labelText: "选择日期",
  placeholderText: "请选择日期",
  value: DateTime(2026, 1),
)

// 带时间的日期选择
AntDatePickerCell(
  labelText: "选择日期时间",
  placeholderText: "请选择日期时间",
  showTime: true,
  value: DateTime(2026, 1, 15, 14, 30),
)
```

### 不同模式

```dart
// 日期模式（默认）
AntDatePickerCell(
  labelText: "选择日期",
  mode: AntDatePickerMode.date,
  value: DateTime(2026, 1, 15),
)

// 时间模式
AntDatePickerCell(
  labelText: "选择时间",
  mode: AntDatePickerMode.time,
  timeFormat: "HH:mm",
  value: DateTime(2026, 1, 1, 14, 30),
)
```

### 自定义格式

```dart
// 自定义日期格式
AntDatePickerCell(
  labelText: "生日",
  format: "yyyy年MM月dd日",
  value: DateTime(1990, 5, 15),
)

// 自定义时间格式
AntDatePickerCell(
  labelText: "会议时间",
  mode: AntDatePickerMode.time,
  timeFormat: "HH:mm:ss",
  value: DateTime(2026, 1, 1, 14, 30, 45),
)
```

### 限制日期范围

```dart
AntDatePickerCell(
  labelText: "选择日期",
  minDate: DateTime(2024, 1, 1),
  maxDate: DateTime(2026, 12, 31),
  value: DateTime(2025, 6, 15),
)
```

### 回调处理

```dart
AntDatePickerCell(
  labelText: "选择日期",
  value: _selectedDate,
  onChanged: (DateTime? newValue) {
    setState(() {
      _selectedDate = newValue;
    });
    print('选择的日期: $newValue');
  },
  onCancel: () {
    print('用户取消选择');
  },
)
```

## 注意事项

1. `format` 参数仅在 `mode` 为 `date` 时生效
2. `timeFormat` 参数仅在 `mode` 为 `time` 或 `showTime` 为 `true` 时生效
3. 日期格式遵循 `intl` 包的格式规范
4. 组件会根据父容器的布局自动适应宽度
5. 支持国际化，会根据系统语言显示相应的日期格式
6. 点击单元格会弹出日期选择器模态框
7. 选择完成后会自动更新显示内容并触发回调

## 常见日期格式

- `yyyy-MM-dd` - 2026-01-15
- `yyyy年MM月dd日` - 2026年01月15日
- `MM/dd/yyyy` - 01/15/2026
- `dd/MM/yyyy` - 15/01/2026
- `EEEE, MMMM dd, yyyy` - Monday, January 15, 2026

## 常见时间格式

- `HH:mm` - 14:30
- `HH:mm:ss` - 14:30:45
- `hh:mm a` - 02:30 PM
- `HH时mm分` - 14时30分
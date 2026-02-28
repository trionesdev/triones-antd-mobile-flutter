# DatePicker 日期选择器

DatePicker 是一个底部弹出的日期时间选择器组件，支持多种日期和时间选择模式。

## 代码演示

```dart src=../../example/lib/pages/date_picker_page.dart preview=/date-picker
```

## API

### showAntDatePicker 方法参数

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| context | 构建上下文 | BuildContext | 必填 |
| mode | 日期选择模式 | AntDatePickerMode | AntDatePickerMode.date |
| title | 标题Widget | Widget? | null |
| titleText | 标题文字 | String? | null |
| showTime | 是否显示时间，仅在mode为AntDatePickerMode.date时有效 | bool | false |
| timeFormat | 时间格式，仅在mode为AntDatePickerMode.date且showTime=true，或mode为AntDatePickerMode.time时有效 | String? | null |
| value | 默认值 | DateTime? | null |
| onOk | 点击确定按钮回调 | ValueChanged<DateTime?>? | null |
| minDate | 最小日期 | DateTime? | null |
| maxDate | 最大日期 | DateTime? | null |

### DatePicker.showD 静态方法参数

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| context | 构建上下文 | BuildContext | 必填 |
| mode | 日期选择模式 | AntDatePickerMode | AntDatePickerMode.date |
| title | 标题Widget | Widget? | null |
| titleText | 标题文字 | String? | null |
| showTime | 是否显示时间，仅在mode为AntDatePickerMode.date时有效 | bool | false |
| timeFormat | 时间格式，仅在mode为AntDatePickerMode.date且showTime=true，或mode为AntDatePickerMode.time时有效 | String? | null |
| value | 默认值 | DateTime? | null |
| onOk | 点击确定按钮回调 | ValueChanged<DateTime?>? | null |
| minDate | 最小日期 | DateTime? | null |
| maxDate | 最大日期 | DateTime? | null |

### AntDatePickerMode 枚举值

| 值 | 说明 |
| --- | --- |
| date | 日期模式（默认） |
| time | 时间模式 |

## 使用示例

### 基础用法

```dart
// 基本日期选择
AntButton(
  text: "基本用法",
  onPressed: () {
    DatePicker.showD(
      context: context,
      onOk: (value) {
        print(value);
      },
    );
  },
)
```

### 带时间的日期选择

```dart
// 带时间的日期选择
AntButton(
  text: "带时间的日期选择",
  onPressed: () {
    DatePicker.showD(
      context: context,
      showTime: true,
      onOk: (value) {
        print(value);
      },
    );
  },
)
```

### 时间模式

```dart
// 时间模式
AntButton(
  text: "时间模式",
  onPressed: () {
    DatePicker.showD(
      context: context,
      mode: AntDatePickerMode.time,
      onOk: (value) {
        print(value);
      },
    );
  },
)
```

### 自定义时间格式

```dart
// 自定义时间格式
AntButton(
  text: "自定义时间格式",
  onPressed: () {
    DatePicker.showD(
      context: context,
      mode: AntDatePickerMode.time,
      timeFormat: "HH:mm",
      onOk: (value) {
        print(value);
      },
    );
  },
)
```

### 设置默认值和范围

```dart
// 设置默认值和范围
AntButton(
  text: "设置默认值和范围",
  onPressed: () {
    DatePicker.showD(
      context: context,
      value: DateTime(2026, 6, 15),
      minDate: DateTime(2024, 1, 1),
      maxDate: DateTime(2028, 12, 31),
      onOk: (value) {
        print(value);
      },
    );
  },
)
```

## 注意事项

1. `showTime` 参数仅在 `mode` 为 `AntDatePickerMode.date` 时生效
2. `timeFormat` 参数仅在 `mode` 为 `AntDatePickerMode.time` 或 `showTime` 为 `true` 时生效
3. 使用 `minDate` 和 `maxDate` 可以限制可选的日期范围
4. `showD` 静态方法和 `showAntDatePicker` 函数功能相同，可根据使用习惯选择
5. 日期格式遵循 `intl` 包的格式规范
6. 选择完成后会通过 `onOk` 回调返回所选的 DateTime 对象
7. 点击遮罩层或取消按钮会关闭选择器而不触发任何回调
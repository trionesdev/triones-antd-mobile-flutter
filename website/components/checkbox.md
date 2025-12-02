# Checkbox 复选框

复选框用于在一组可选项中进行多项选择。

## 何时使用

- 需要在多个选项中选择一个或多个选项时
- 表单中需要进行多选操作时
- 需要开启或关闭某个功能时

## 代码演示

```dart src=../example/lib/pages/checkbox_page.dart preview=/checkbox
```

## API

### AntCheckbox 组件参数

| 属性             | 说明       | 类型                  | 默认值   |
|----------------|----------|---------------------|-------|
| label          | 标签       | Widget?             | null  |
| labelText      | 标签文本     | String?             | null  |
| block          | 是否块级     | bool                | false |
| checked        | 是否选中     | bool?               | null  |
| defaultChecked | 是否选中(默认) | bool                | false |
| disabled       | 是否禁用     | bool?               | false |
| checkedIcon    | 选中图标     | Widget?             | null  |
| uncheckedIcon  | 未选中图标    | Widget?             | null  |
| onChange       | 选中状态变化回调 | `ValueChanged<bool>?` | null  |
| onTap          | 点击回调     | `ValueChanged<void>?` | null  |
| value          | 值        | dynamic             | null  |
| iconSize       | 图标大小     | double?             | null  |
| spacing        | 间距       | double?             | 4     |

### AntCheckboxGroup 组件参数

| 属性           | 说明       | 类型                            | 默认值  |
|--------------|----------|-------------------------------|------|
| layout       | 布局方向     | AntLayout                     | `AntLayout.vertical`     |
| defaultValue | 默认值      | `List<dynamic>?`                | null |
| value        | 当前值      | `List<dynamic>?`                | null |
| disabled     | 是否禁用     | bool                          | false |
| iconSize     | 图标大小     | double?                       | null |
| onChange     | 选中状态变化回调 | `ValueChanged<List<dynamic>?>?` | null |
| children     | 子组件      | `List<AntCheckbox>?`            | null |

### 组件特性

1. 支持单个复选框和复选框组两种使用方式
2. 支持自定义选中和未选中图标
3. 支持水平和垂直布局
4. 支持禁用状态
5. 支持设置图标大小和间距
6. 支持标签文本和自定义标签Widget
7. 支持块级显示模式

### 使用说明

- 单个复选框可以通过[value]和[checked]属性控制选中状态
- 复选框组通过[value]属性控制整体选中状态，组内每个复选框通过[value]标识
- [onChange]回调在选中状态改变时触发
- [onTap]回调在点击复选框时触发
- 可以通过[disabled]属性禁用复选框
- 支持通过[label]或[labelText]设置标签
- [block]属性控制复选框是否为块级元素
# InputNumber 数字输入框

数字输入框组件，支持通过加减按钮或键盘输入来调整数值。

## 何时使用

当需要获取用户输入的数字，并对输入值有一定控制要求时（如限制最大最小值、指定步长等），应该使用数字输入框。

## 代码演示

```dart src=../example/lib/pages/input_number_page.dart preview=/input-number
```

## API

数字输入框的属性说明如下：

| 属性           | 说明     | 类型                 | 默认值    |
|--------------|--------|--------------------|--------|
| size         | 组件大小   | AntSize            | middle |
| step         | 步长     | num                | 1      |
| min          | 最小值    | double?            | null   |
| max          | 最大值    | double?            | null   |
| keyboard     | 是否使用键盘 | bool               | true   |
| defaultValue | 默认值    | num?               | null   |
| value        | 当前值    | num?               | null   |
| disabled     | 是否禁用   | bool               | false  |
| onChange     | 值改变回调  | Function(num val)? | null   |

### AntSize 枚举值

| 值      | 说明  | 尺寸    |
|--------|-----|-------|
| small  | 小尺寸 | 高24px |
| middle | 中尺寸 | 高32px |
| large  | 大尺寸 | 高48px |
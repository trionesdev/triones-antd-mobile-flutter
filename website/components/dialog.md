# Dialog 对话框

## 代码演示

```dart src=../example/lib/pages/dialog_page.dart preview=/dialog

```

## API

### 提示对话框 `showAntAlertDialog`

| 属性               | 说明        | 类型         | 默认值   |
|------------------|-----------|------------|-------|
| maxWidth         | 最大宽度      | double     | -     |
| content          | 内容        | Widget     |       | 
| onConfirm        | 确认按钮回调    | `Function` | true  |
| closeOnMaskClick | 点击遮罩层是否关闭 | `bool`     | false | 
| confirmText      | 确认文本      | `String`   | -     |

### 确认对话框 `showAntConfirmDialog`

| 属性               | 说明        | 类型         | 默认值   |
|------------------|-----------|------------|-------|
| maxWidth         | 最大宽度      | double     | -     |
| content          | 内容        | Widget     |       | 
| onConfirm        | 确认按钮回调    | `Function` |       |
| onCancel         | 取消按钮回调    | `Function` |       |
| closeOnMaskClick | 点击遮罩层是否关闭 | `bool`     | false | 
| cancelText       | 取消文本      | `String`   | -     |
| confirmText      | 确认文本      | `String`   | -     |
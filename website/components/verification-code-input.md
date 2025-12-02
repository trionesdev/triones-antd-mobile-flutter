# VerificationCodeInput 验证码输入框

验证码输入框是一个专门用于输入验证码的组件，通常用于手机或邮箱验证场景。

## 何时使用

- 用户注册或登录时需要输入短信验证码
- 重要操作前需要进行身份验证
- 需要防止机器人操作的场景

## 代码演示

```dart src=../example/lib/pages/verification_code_input_page.dart preview=/verification-code-input
```

## API

### AntVerificationCodeInput 组件参数

| 属性              | 说明         | 类型                      | 默认值               |
|-----------------|------------|-------------------------|-------------------|
| style           | 样式         | StateStyle?             | null              |
| size            | 大小         | AntSize                 | AntSize.middle    |
| height          | 高度         | double?                 | null              |
| placeholder     | 占位符        | String?                 | null              |
| type            | 输入框类型      | AntInputType?           | AntInputType.text |
| prefix          | 前缀         | Widget?                 | null              |
| value           | 值          | String?                 | null              |
| defaultValue    | 默认值        | String?                 | null              |
| onChange        | 值改变回调      | ValueChanged<String>?   | null              |
| decoration      | 输入框样式      | BoxDecoration?          | null              |
| sendText        | 发送按钮文本     | String?                 | "获取验证码"           |
| resendText      | 重新发送按钮文本   | String?                 | "重新发送"            |
| intervalSeconds | 验证码发送间隔(秒) | int?                    | 60                |
| onBlur          | 失去焦点回调     | ValueGetter<void>?      | null              |
| onFocus         | 获得焦点回调     | ValueGetter<void>?      | null              |
| onSend          | 发送验证码回调    | AsyncValueGetter<bool>? | null              |

### 组件特性

1. 集成倒计时功能，防止用户频繁发送验证码
2. 支持自定义发送按钮文本和重新发送按钮文本
3. 基于AntInput组件构建，继承了其所有功能
4. 支持异步发送回调，可根据发送结果控制倒计时启动
5. 倒计时期间按钮不可点击，显示剩余秒数

### 使用说明

- 点击发送按钮触发`onSend`回调（如果提供）
- 如果`onSend`回调返回true或者未提供，则启动倒计时
- 倒计时期间按钮显示剩余秒数，倒计时结束后显示重新发送文本
- 组件继承自AntInput，支持所有AntInput的属性和功能
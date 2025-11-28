# Alert 警告提示

Alert组件用于展示需要引起用户关注的信息。

## 何时使用

- 当需要向用户展示提示信息时
- 当需要展示成功、警告、错误等状态信息时
- 当需要用户对某些操作进行确认时

## 代码演示

```dart src=../example/lib/pages/alert_page.dart preview=/alert
```

## API

| 参数 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| closable | 是否可以关闭 | bool? | null |
| message | 消息,与messageText二选一，优选使用message | Text? | null |
| messageText | 消息文本,与message二选一，优选使用message | String? | null |
| description | 描述,与descriptionText二选一，优选使用description | Text? | null |
| descriptionText | 描述文本,与description二选一，优选使用description | String? | null |
| icon | 图标 | Widget? | null |
| showIcon | 显示图标 | bool? | null |
| type | 类型(info,success,warning,error) | AntAlertType? | AntAlertType.info |
| onClose | 关闭回调 | Function? | null |
| style | 样式 | StateStyle? | null |
| decoration | 装饰 | BoxDecoration? | null |
/# Space 间距

设置组件之间的间距。

## 何时使用

当需要在多个组件之间添加统一的间距时使用，可以快速实现水平或垂直排列布局。

## 代码演示

```dart src=../example/lib/pages/space_page.dart preview=/space
```

## API

间距组件的属性说明如下：

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| style | 样式 | StateStyle? | null |
| decoration | 装饰 | BoxDecoration? | null |
| direction | 排列方向 | AntSpaceDirection? | horizontal |
| children | 子项 | List<Widget>? | null |
| spacing | 间隔 | double? | 2 |
| split | 分割线 | Widget? | null |

### AntSpaceDirection 枚举值

| 值 | 说明 |
| --- | --- |
| vertical | 垂直排列 |
| horizontal | 水平排列 |
# Badge 徽标

Badge组件用于在元素角落显示徽标或计数，常用于消息提醒、未读数量等场景。

## 何时使用

- 显示消息通知数量
- 标记重要信息或状态
- 显示未读消息数
- 用于图标或按钮上的状态标记

## 代码演示

```dart src=../example/lib/pages/badge_page.dart preview=/badge
```

## API

| 属性              | 说明     | 类型         | 默认值  |
|-----------------|--------|------------|------|
| backgroundColor | 背景色    | Color?     | null |
| label           | 徽标内容   | Widget?    | null |
| labelText       | 徽标内容文本 | String?    | null |
| count           | 徽标数字   | int?       | null |
| maxCount        | 最大数    | int?       | 999  |
| alignment       | 对齐方式   | Alignment? | null |
| offset          | 偏移     | Offset?    | null |
| textStyle       | 文本样式   | TextStyle? | null |
| visible         | 是否可见   | bool?      | true |
| child           | 子组件    | Widget?    | null |

### 优先级说明

1. label、labelText、count三个属性中，按顺序优先使用第一个有值的属性：
    - 如果设置了[label]，则直接使用该Widget作为徽标内容
    - 否则如果设置了[labelText]，则使用该文本创建Text作为徽标内容
    - 否则如果设置了[count]，则显示数字，超过[maxCount]时显示"{maxCount}+"
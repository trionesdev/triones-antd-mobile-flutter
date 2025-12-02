# Card 卡片

卡片是一种通用容器，用于承载和组织相关内容和操作。它可以包含标题、内容和底部操作区域。

## 何时使用

- 需要将相关内容组织在一起展示时
- 构建信息展示面板时
- 创建内容卡片布局时
- 需要分区域展示头部、内容和底部操作时

## 代码演示

```dart src=../example/lib/pages/card_page.dart preview=/card
```

## API

### AntCard 组件参数

| 属性               | 说明     | 类型             | 默认值  |
|------------------|--------|----------------|------|
| titleStyle       | 标题样式   | TextStyle?     | null |
| title            | 标题     | Widget?        | null |
| titleText        | 标题文字   | String?        | null |
| extraStyle       | 额外信息样式 | TextStyle?     | null |
| extra            | 额外信息   | Widget?        | null |
| extraText        | 额外信息文字 | String?        | null |
| child            | 内容     | Widget?        | null |
| footer           | 底部     | Widget?        | null |
| decoration       | 卡片样式   | BoxDecoration? | null |
| headerDecoration | 卡片头部样式 | BoxDecoration? | null |
| bodyDecoration   | 卡片内容样式 | BoxDecoration? | null |
| footerDecoration | 卡片底部样式 | BoxDecoration? | null |
| style            | 卡片样式   | StateStyle?    | null |
| styles           | 卡片样式集合 | AntCardStyles? | null |

### AntCardStyles 对象属性

| 属性     | 说明   | 类型          | 默认值  |
|--------|------|-------------|------|
| header | 头部样式 | StateStyle? | null |
| body   | 内容样式 | StateStyle? | null |
| footer | 底部样式 | StateStyle? | null |

### 组件特性

1. 支持自定义标题和额外信息展示
2. 支持分别设置头部、内容和底部区域的样式
3. 支持整体样式和分区域样式的组合配置
4. 自动根据内容显示相应的区域
5. 提供默认的样式和间距设置

### 使用说明

- 通过 title 或 titleText 设置卡片标题
- 通过 extra 或 extraText 设置卡片右上角的额外信息
- 通过 child 设置卡片的主要内容区域
- 通过 footer 设置卡片底部操作区域
- 可以使用 decoration 设置整体卡片样式，或使用 headerDecoration、bodyDecoration、footerDecoration
  分别设置各区域样式
- styles 属性允许更精细地控制各区域的 StateStyle 样式
- 当只设置 child 时，卡片只会显示内容区域
- 当设置 title 或 extra 时，会自动显示头部区域
- 当设置 footer 时，会自动显示底部区域
# Empty 空状态

空状态组件用于在没有数据或内容时展示提示信息，通常在列表为空或页面无内容时使用。

## 何时使用

- 列表数据为空时提供友好的提示
- 页面初始化但无内容时展示占位符
- 搜索无结果时显示提示信息
- 网络错误或加载失败时展示错误状态

## 代码演示

```dart src=../example/lib/pages/empty_page.dart preview=/empty
```

## API

### AntEmpty 组件参数

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| image | 图片 | Widget? | null |
| description | 描述 | Text? | null |
| descriptionText | 描述文本 | String? | null |

### 组件特性

1. 支持自定义图片和描述信息
2. 提供默认的空状态图标和"暂无数据"文本
3. 支持通过 description 或 descriptionText 设置描述文本
4. 图片和描述均支持自定义
5. 默认使用垂直布局展示图片和描述

### 使用说明

- 当 image 未设置时，使用默认的空状态图标
- 当 description 和 descriptionText 均未设置时，显示默认的"暂无数据"文本
- 优先使用 description 属性，如果未设置则使用 descriptionText
- 可以通过 image 属性完全自定义空状态的图片部分
- 组件会自动居中显示内容
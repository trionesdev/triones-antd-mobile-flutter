# Cell 单元格

单元格用于展示列表项信息，通常用于设置页、表单页等需要展示和收集信息的场景。

## 何时使用

- 需要展示列表项信息时
- 设置页面中展示各项配置选项
- 表单页面中展示和收集用户信息
- 需要点击跳转到其他页面的列表项

## 代码演示

```dart src=../example/lib/pages/cell_page.dart preview=/cell
```

## API

### AntCellGroup 组件参数

| 属性          | 说明      | 类型             | 默认值            |
|-------------|---------|----------------|----------------|
| size        | 大小      | AntSize?       | AntSize.middle |
| title       | 标题      | Widget?        | null           |
| titleText   | 标题文本    | String?        | null           |
| titleAlign  | 标题对齐    | AntLabelAlign? | null           |
| titleStyle  | 样式      | TextStyle?     | null           |
| labelCol    | 左侧标签列   | AntCol?        | null           |
| labelAlign  | 左侧标签对齐  | AntLabelAlign? | null           |
| children    | 子组件     | List<Widget>?  | null           |
| showDivider | 是否显示分割线 | bool           | false          |
| arrow       | 是否显示箭头  | bool           | true           |

### AntCell 组件参数

| 属性              | 说明     | 类型             | 默认值  |
|-----------------|--------|----------------|------|
| size            | 大小     | AntSize?       | null |
| placeholder     | 占位符    | Text?          | null |
| placeholderText | 占位符文本  | String?        | null |
| arrow           | 是否显示箭头 | bool?          | true |
| icon            | 图标     | Widget?        | null |
| label           | 标签     | Widget?        | null |
| labelText       | 标签文本   | String?        | null |
| labelStyle      | 样式     | TextStyle?     | null |
| labelCol        | 左侧标签列  | AntCol?        | null |
| labelAlign      | 左侧标签对齐 | AntLabelAlign? | null |
| value           | 值      | dynamic?       | null |
| child           | 子组件    | Widget?        | null |
| onTap           | 点击回调   | Function?      | null |

### 组件特性

1. 支持单元格组和单独单元格两种使用方式
2. 支持自定义大小（large、middle、small）
3. 支持自定义标签和值的展示
4. 支持显示或隐藏箭头图标
5. 支持自定义图标
6. 支持点击事件处理
7. 支持设置占位符文本
8. 支持在组内显示分割线

### 使用说明

- AntCellGroup 用于包裹一组 AntCell，可以统一设置大小、标签对齐等属性
- AntCell 用于展示单个列表项，支持标签、值、图标等元素
- 可通过 labelCol 设置标签列的宽度和布局方式
- 可通过 onTap 设置点击事件处理函数
- 支持通过 value 属性直接设置显示值，或通过 child 属性自定义内容
- 当 value 为空时，可以通过 placeholder 或 placeholderText 设置占位符
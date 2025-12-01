# Tabs 标签页

标签页组件，用于组织和展示多个相关页面内容，用户可以通过点击标签在不同页面间切换。

## 何时使用

当需要展示多个平级页面内容，且希望用户能够在这些页面间自由切换时使用。

## 代码演示

```dart src=../example/lib/pages/tabs_page.dart preview=/tabs
```

## API

### AntTabs

标签页的属性说明如下：

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| defaultActiveKey | 默认激活的tabKey | String? | null |
| activeKey | 当前激活的tabKey | String? | null |
| items | 子项 | List<AntTabItemStruct>? | null |
| stretch | 是否拉伸 | bool | true |
| children | 子项 | List<AntTab>? | null |
| decoration | 装饰 | BoxDecoration? | null |
| tabDecoration | tab项的样式 | BoxDecoration? | null |
| style | 样式 | StateStyle? | null |
| styles | 自定义样式 | AntTabStyles? | null |
| itemBuilder | 自定义tab项 | Widget Function(AntTabItemStruct item)? | null |

### AntTabItemStruct

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| key | 标识（必填） | String | - |
| labelText | 标签文本 | String? | null |
| label | 标签 | Widget? | null |
| content | 页面内容 | Widget? | null |

### AntTab

标签项的属性说明如下：

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| antKey | 标识（必填） | String | - |
| labelText | 标签文本 | String? | null |
| label | 标签 | Widget? | null |
| child | 子组件 | Widget? | null |
| decoration | 装饰 | BoxDecoration? | null |
| onTab | tab点击事件 | Function(AntTabState? state)? | null |
| style | 样式 | StateStyle? | null |
| activeStyle | 激活样式 | StateStyle? | null |
| bodyStyle | 内容样式 | StateStyle? | null |
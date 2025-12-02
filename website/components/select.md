# Select 选择器

选择器用于从一组选项中选择一个或多个选项。

## 何时使用

- 需要从一组选项中进行单项或多项选择时
- 表单中需要用户进行选择操作时
- 需要提供搜索功能以快速定位选项时
- 需要自定义选项显示内容时

## 代码演示

```dart src=../example/lib/pages/select_page.dart preview=/select
```

## API

### AntSelect 组件参数

| 属性 | 说明 | 类型 | 默认值                      |
| --- | --- | --- |--------------------------|
| cellLabel | 显示的标签 | Widget? | null                     |
| cellLabelText | 显示的标签文本 | String? | null                     |
| mode | 选择模式(是否可以多选) | AntSelectMode? | null                     |
| pickerMode | 选择器模式 | AntSelectPickerMode | AntSelectPickerMode.popup |
| showSearch | 是否显示搜索框 | bool | false                    |
| appBar | 顶部栏 | PreferredSizeWidget? | null                     |
| title | 标题 | String? | null                     |
| placeholder | 占位符 | String? | null                     |
| searchPlaceholder | 搜索框占位符 | String? | null                     |
| arrow | 是否显示箭头 | bool | false                    |
| fieldsNames | 字段名 | `AntFieldsNames?` | `AntFieldsNames(label: NamePath("label"),value: NamePath("value"))`                         |
| options | 选项数据源 | `List<dynamic>` | []                       |
| optionBuilder | 选项构建器 | `AntSelectOptionBuilder?` | null                     |
| onSearch | 搜索框回调 | `ValueChanged<dynamic>?` | null                     |
| value | 值 | dynamic | null                     |
| valueOption | 值选项 | dynamic | null                     |
| onChange | 值改变回调 | `AntSelectValueChanged?` | null                     |
| onRefresh | 刷新事件 | `AsyncCallback?` | null                     |
| onScrollToLower | 滚动到底部事件 | `AsyncCallback?` | null                     |
| onOpenChange | 打开状态改变回调 | `ValueChanged<bool>?` | null                     |

### AntSelectMode 枚举值

| 值 | 说明 |
| --- | --- |
| multiple | 多选模式 |
| tags | 标签模式 |

### AntSelectPickerMode 枚举值

| 值 | 说明 |
| --- | --- |
| popup | 弹出层模式 |
| page | 页面模式 |

### AntFieldsNames 属性

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| label | 标签字段名 | `NamePath?` | `NamePath("label")` |
| value | 值字段名 | `NamePath?` | `NamePath("value")` |

### 组件特性

1. 支持单选和多选模式
2. 支持两种选择器模式：弹出层模式和页面模式
3. 支持搜索功能，便于在大量选项中快速查找
4. 支持自定义选项显示内容
5. 支持下拉刷新和上拉加载更多
6. 支持监听选择器打开状态变化

### 使用说明

- 通过 `mode` 属性控制选择模式，设置为 `AntSelectMode.multiple` 为多选，`AntSelectMode.tags` 为标签模式，不设置或设为 `null` 为单选
- 通过 `pickerMode` 属性控制选择器展示模式，`popup` 为底部弹出层，`page` 为新页面展示
- `options` 属性用于设置选项数据源，应为包含对象的数组
- `fieldsNames` 属性用于指定选项中标签和值的字段名，默认使用 `label` 和 `value` 字段
- `optionBuilder` 属性允许自定义选项的显示内容
- `showSearch` 属性控制是否显示搜索框，适用于选项较多的场景
- `onChange` 回调在选择值发生变化时触发，会传递选中的值和选项对象
- `onRefresh` 和 `onScrollToLower` 可用于实现下拉刷新和上拉加载更多功能
- `cellLabel` 属性用于设置标签组件
- `cellLabelText` 属性用于设置标签文本
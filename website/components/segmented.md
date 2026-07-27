# Segmented 分段控制器

分段控制器用于在多个选项中进行切换选择。

参考实现：[triones-antd-taro Segmented](https://github.com/trionesdev/triones-antd-taro/tree/develop/packages/antd-mobile-base-react/src/Segmented)

## 何时使用

- 用于展示多个互斥选项，并在其中快速切换
- 相比 Tabs 更轻量，适合筛选、视图模式切换等场景

## 代码演示

```dart src=../example/lib/pages/segmented_page.dart preview=/segmented
```

## API

### AntSegmented

| 参数 | 说明 | 类型 | 默认值 |
|------|------|------|--------|
| options | 选项列表 | `List<AntSegmentedOption>` | — |
| block | 将宽度调整为父元素宽度 | bool | false |
| disabled | 是否禁用 | bool | false |
| defaultValue | 默认选中的值 | dynamic | null |
| value | 当前选中的值（受控） | dynamic | null |
| onChange | 选中值变化回调 | `ValueChanged<dynamic>?` | null |

### AntSegmentedOption

| 参数 | 说明 | 类型 | 默认值 |
|------|------|------|--------|
| label | 分段项显示内容 | Widget? | null |
| labelText | 分段项显示文本 | String? | null |
| value | 分段项的值 | dynamic | — |
| icon | 分段项图标 | Widget? | null |
| disabled | 是否禁用该项 | bool | false |

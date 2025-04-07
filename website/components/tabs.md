# Tabs 标签页

## 代码演示

```dart src=../example/lib/pages/tabs_page.dart preview=/tabs

```

## API

| 参数               | 说明        | 类型                              | 默认值  |
|------------------|-----------|---------------------------------|------|
| style            | 样式        | StateStyle                      |      |
| decoration       | 背景渲染      |                                 |      |
| styles           | 样式对象      | AntTabStyles                    |      |
| defaultActiveKey | 默认激活页     |                                 |      |
| activeKey        | 激活页       |                                 |      |
| stretch          | 是否拉伸      | bool                            | true |
| tabDecoration    | tab子项背景渲染 | Function(AntTabItemRecord item) |      |
| itemRender       | tab子项渲染   | Function(AntTabItemRecord item) |      |

### AntTabItemRecord

| 参数      | 说明    | 类型     | 默认值 |
|---------|-------|--------|-----|
| key     | 标识    | String |     |
| label   | tab文本 | Widget |     |
| content | 页面内容  | Widget |     |
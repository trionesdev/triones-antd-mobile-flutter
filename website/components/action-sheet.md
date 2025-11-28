# ActionSheet 动作面板

动作面板用于从底部弹出的模态框，提供一组与当前场景相关的操作选项。

## 何时使用

- 需要提供与当前场景相关的多个操作选项时
- 用户需要从多个选项中选择一个操作时
- 需要临时中断用户操作，提供重要信息确认时

## 代码演示

```dart src=../example/lib/pages/action_sheet_page.dart preview=/action-sheet

```

## API

### AntActionSheet.show 方法参数

| 参数               | 说明       | 类型                              | 默认值   |
|------------------|----------|---------------------------------|-------|
| context          | 上下文      | BuildContext                    | -     |
| closeOnMaskClick | 是否点击遮罩关闭 | bool?                           | false |
| title            | 标题       | Widget?                         | null  |
| titleText        | 标题文本     | String?                         | null  |
| actions          | 动作列表     | List<AntActionSheetItemStruct>? | null  |
| showCancelButton | 是否显示取消按钮 | bool?                           | true  |
| cancel           | 取消按钮     | Widget?                         | null  |
| itemStyle        | 动作样式     | StateStyle?                     | null  |

### AntActionSheetItemStruct 构造函数参数

| 参数        | 说明       | 类型        | 默认值  |
|-----------|----------|-----------|------|
| labelText | 标签文本     | String?   | null |
| label     | 标签Widget | Widget?   | null |
| onPressed | 点击事件     | Function? | null |

### AntActionSheetView 构造函数参数

| 参数               | 说明       | 类型                              | 默认值  |
|------------------|----------|---------------------------------|------|
| actions          | 动作列表     | List<AntActionSheetItemStruct>? | null |
| showCancelButton | 是否显示取消按钮 | bool?                           | true |
| titleText        | 标题文本     | String?                         | null |
| title            | 标题       | Widget?                         | null |
| cancel           | 取消按钮     | Widget?                         | null |
| itemStyle        | 动作样式     | StateStyle?                     | null |
| decoration       | 容器样式     | BoxDecoration?                  | null |
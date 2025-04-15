# ActionSheet 动作面板

## 代码演示

```dart src=../example/lib/pages/action_sheet_page.dart preview=/action-sheet

```

## API

| 属性               | 说明        | 类型                    | 默认值   |
|------------------|-----------|-----------------------|-------|
| title            | 标题        | String                | -     |
| closeOnMaskClick | 点击遮罩层是否关闭 | bool                  | false | 
| showCancelButton | 是否展示取消按钮  | bool                  | true  |
| actions          | 动作列表      | `List<AntActionType>` | true  |
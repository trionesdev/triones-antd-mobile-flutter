# Form 表单

> 参考Antd Form实现的表单

## 代码演示

```dart src=../example/lib/pages/form_page.dart preview=/form
```

## API

### AntForm

| 属性            | 说明                                    | 类型              | 默认值          |
|---------------|---------------------------------------|-----------------|--------------|
| layout        | 表单布局，可选值为 horizontal（水平） vertical（垂直） | `AntFormLayout` | `horizontal` |
| labelCol      | label 布局                              | `AntCol`        |              |
| labelAlign    | label 对其方式                            | `AntLabelAlign` | `left`       |
| wrapperCol    | 内容布局                                  | `AntCol`        |              |
| spacing       | 间隔                                    | double          |              |
| rowSpacing    | 行间隔                                   | double          |              |
| columnSpacing | 列间隔                                   | double          |              |
| size          | 表单大小                                  | `AntSize`       | `middle`     |

### AntFormItem

| 属性           | 说明                                    | 类型                                     | 默认值          |
|--------------|---------------------------------------|----------------------------------------|--------------|
| layout       | 表单布局，可选值为 horizontal（水平） vertical（垂直） | `AntFormLayout`                        | `horizontal` |
| name         | name属性                                | `NamePath`                             |              |
| label        | 标签                                    | `Widget`                               |              |
| labelText    | 标签文本                                  | `String`                               |              |
| labelCol     | label 布局,会覆盖Form 的labelCol            | `AntCol`                               |              |
| labelAlign   | label 对其方式,会覆盖Form的labelAlign         | `AntLabelAlign`                        | `left`       |
| wrapperCol   | 内容布局                                  | `AntCol`                               |              |
| builder      | Item创建函数                              | `Widget Function(AntFieldState field)` |              |
| onSaved      | 保存时回调                                 | `void Function(dynamic? newValue)`      |              |
| initialValue | 初始值                                   | dynamic                                |              |
| validator    | 验证函数                                  | `String? Function(dynamic? value)`      |              |
| required     | 是否必填                                  | bool                                   |              |
| style        | 组件样式                                  | `StateStyle`                           |              |
| notifier     | 值变化通知器                               | `ValueNotifier`                        |              |
| hidden       | 是否隐藏                                  | bool                                   | false        |
| noStyle      | 是否无样式                                 | bool                                   | false        |

### Field

| 属性           | 说明         | 类型                        | 默认值   |
|--------------|------------|---------------------------|-------|
| isList       | 是否为列表      | bool                      |       |
| name         | 字段名       | `NamePath`                |       |
| child        | 子组件       | `Widget`                  |       |
| onSaved      | 保存回调      | `FormItemSetter`          |       |
| validator    | 验证器       | `FormItemValidator`       |       |
| notifier     | 值变化通知器   | `ValueNotifier`           |       |
| value        | 值          | T                         |       |
| initialValue | 初始值       | T                         |       |
| restorationId| 恢复ID      | `String`                  |       |

### AntFormList

| 属性      | 说明       | 类型                                                                                                     | 默认值 |
|---------|----------|--------------------------------------------------------------------------------------------------------|-----|
| name    | name属性   | `NamePath`                                                                                             |     |
| builder | List创建函数 | `Widget Function(BuildContext context,List<AntFormListField> fields,AntFormListOperations operations)` |     |

### AntFormListOperations

| 属性   | 说明     | 类型              | 默认值 |
|------|--------|-----------------|-----|
| add  | 添加项    | `AddFunction`   |     |
| remove | 删除项    | `RemoveFunction`|     |

### 枚举类型

#### AntFormLayout

| 值          | 说明   |
|------------|------|
| horizontal | 水平布局 |
| vertical   | 垂直布局 |

#### AntFormLabelVerticalAlign

| 值     | 说明   |
|-------|------|
| start | 开始对齐 |
| center| 居中对齐 |
| end   | 结束对齐 |
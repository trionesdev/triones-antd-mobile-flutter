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

### AntFormItem

| 属性           | 说明                                    | 类型                                     | 默认值          |
|--------------|---------------------------------------|----------------------------------------|--------------|
| layout       | 表单布局，可选值为 horizontal（水平） vertical（垂直） | `AntFormLayout`                        | `horizontal` |
| name         | name属性                                | `NamePath`                             |              |
| label        | 标签                                    | `Widget`                               |              |
| labelCol     | label 布局,会覆盖Form 的labelCol            | `AntCol`                               |              |
| labelAlign   | label 对其方式,会覆盖Form的labelAlign         | `AntLabelAlign`                        | `left`       |
| wrapperCol   | 内容布局                                  | `AntCol`                               |              |                                  
| builder      | Item创建函数                              | `Widget Function(AntFieldState field)` |              |                                        
| onSaved      | 保存时回调                                 | `void Function(dynamic? newValue)`     |              |                                 
| initialValue | 初始值                                   | dynamic                                |              |                                
| validator    | 验证函数                                  | `String? Function(dynamic? value)`     |              |                                
| required     | 是否必填                                  | bool                                   |              |          |                                

### AntFormList

| 属性      | 说明       | 类型                                                                                                     | 默认值 |
|---------|----------|--------------------------------------------------------------------------------------------------------|-----|
| name    | name属性   | `NamePath`                                                                                             |     |
| builder | List创建函数 | `Widget Function(BuildContext context,List<AntFormListField> fields,AntFormListOperations operations)` |     |
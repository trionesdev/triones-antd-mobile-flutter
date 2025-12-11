# Steps 步骤条

步骤条用于引导用户按照流程完成任务的导航条，可以显示当前步骤和整体流程。

## 何时使用

- 当任务复杂或者存在先后关系时，将其分解成一系列步骤
- 向用户显示当前操作在整体流程中的位置
- 引导用户按顺序完成复杂的表单或任务

## 代码演示

```dart src=../example/lib/pages/steps_page.dart preview=/steps
```

## API

### AntSteps 组件参数

| 属性              | 说明                                             | 类型                         | 默认值                          |
|-----------------|------------------------------------------------|----------------------------|------------------------------|
| direction       | 步骤条方向                                          | AntStepsDirection          | AntStepsDirection.horizontal |
| current         | 指定当前步骤，从 0 开始记数。在子 Step 元素中，可以通过 status 属性覆盖状态 | int?                       | 0                            |
| iconSize        | 指定图标大小                                         | double?                    | null                         |
| defaultIconSize | 默认图标大小                                         | double                     | 24                           |
| stretch         | 是否拉伸，只对 direction='horizontal' 的有效             | bool                       | true                         |
| itemMinWidth    | 步骤条子项最小宽度, 仅在 direction='horizontal' 时有效       | double?                    | null                         |
| items           | 步骤条子项                                          | `List<AntStepItemStruct>?` | null                         |
| children        | 步骤条子项                                          | `List<AntStepItem>?`       | null                         |

### AntStepItem 组件参数

| 属性       | 说明                                                                          | 类型            | 默认值                |
|----------|-----------------------------------------------------------------------------|---------------|--------------------|
| disabled | 是否禁用                                                                        | bool          | false              |
| icon     | 图标                                                                          | Widget?       | null               |
| iconSize | 指定图标大小                                                                      | double?       | null               |
| status   | 指定状态。当不配置该属性时，会使用 Steps 的 current 来自动指定状态；如果该属性与 current 指定的状态不匹配会覆盖自动匹配的状态 | AntStepStatus | AntStepStatus.wait |
| title    | 标题                                                                          | Widget?       | null               |
| subTitle | 子标题                                                                         | Widget?       | null               |
| child    | 子组件                                                                         | Widget?       | null               |

### AntStepsDirection 枚举值

| 值          | 说明   |
|------------|------|
| horizontal | 水平方向 |
| vertical   | 垂直方向 |

### AntStepStatus 枚举值

| 值       | 说明   |
|---------|------|
| wait    | 等待进行 |
| process | 正在进行 |
| finish  | 已完成  |
| error   | 出错   |

### AntStepItemStruct 属性

| 属性       | 说明   | 类型            | 默认值                   |
|----------|------|---------------|-----------------------|
| disabled | 是否禁用 | bool          | false                 |
| icon     | 图标   | Widget?       | null                  |
| iconSize | 图标大小 | double?       | null                  |
| status   | 状态   | AntStepStatus | AntStepStatus.process |
| title    | 标题   | Widget?       | null                  |
| subTitle | 子标题  | Widget?       | null                  |
| child    | 子组件  | Widget?       | null                  |

### 组件特性

1. 支持水平和垂直两种展示方向
2. 支持自定义图标和图标大小
3. 支持步骤状态显示（等待、进行中、已完成、出错）
4. 支持拉伸和固定宽度模式（水平方向）
5. 支持禁用特定步骤项

### 使用说明

- 通过 `direction` 属性控制步骤条的方向，可选水平(horizontal)或垂直(vertical)
- 通过 `current` 属性指定当前进行到第几步，从 0 开始计数
- 通过 `status` 属性可以在子项中覆盖自动分配的状态
- 在水平方向上，可通过 `stretch` 控制是否拉伸步骤项
- 可通过 `icon` 属性自定义每个步骤的图标
- 可通过 `iconSize` 和 `defaultIconSize` 控制图标大小
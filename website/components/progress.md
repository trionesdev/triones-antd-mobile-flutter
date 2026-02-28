# Progress 进度条

展示操作的当前进度。

## 何时使用

当需要展示操作的当前进度或任务完成情况时使用。

## 代码演示

```dart src=../example/lib/pages/progress_page.dart preview=/progress
```

## API

### AntProgress

进度条的属性说明如下：

| 属性                   | 说明                                 | 类型                      | 默认值                      |
|----------------------|------------------------------------|-------------------------|--------------------------|
| format               | 格式化进度百分比                           | Format?                 | (percent) => percent + % |
| type                 | 进度条类型                              | AntProgressType         | line                     |
| percent              | 进度百分比                              | double                  | 0                        |
| railColor            | 未完成的分段的颜色                          | Color?                  | null                     |
| showInfo             | 是否显示进度数值或状态图标                      | bool                    | true                     |
| status               | 进度条的状态                             | AntProgressStatus?      | null                     |
| strokeColor          | 进度条的色彩                             | Color?                  | null                     |
| size                 | 进度条的大小                             | AntSize                 | middle                   |
| height               | 进度条的高度，只对type="line"有效，将覆盖size效果   | double?                 | null                     |
| diameter             | 进度条的直径，只对type="circle"有效，将覆盖size效果 | double?                 | null                     |
| percentPositionAlign | 进度百分比的位置对齐方式，只对type="line"有效       | AntPercentPositionAlign | end                      |
| percentPositionType  | 进度百分比的位置类型，只对type="line"有效         | AntPercentPositionType  | outer                    |
| strokeWidth          | 进度条的宽度，只对type="circle"有效           | double                  | 6                        |

### AntProgressType 枚举值

| 值      | 说明    |
|--------|-------|
| line   | 线性进度条 |
| circle | 环形进度条 |

### AntProgressStatus 枚举值

| 值         | 说明   |
|-----------|------|
| success   | 成功状态 |
| exception | 异常状态 |
| normal    | 普通状态 |
| active    | 活跃状态 |

### AntPercentPositionAlign 枚举值

| 值      | 说明   |
|--------|------|
| start  | 开始位置 |
| center | 居中位置 |
| end    | 结束位置 |

### AntPercentPositionType 枚举值

| 值     | 说明   |
|-------|------|
| inner | 内部显示 |
| outer | 外部显示 |

### AntSize 枚举值

| 值      | 说明  | 尺寸                    |
|--------|-----|-----------------------|
| small  | 小尺寸 | 高6px(线性)或直径60px(环形)   |
| middle | 中尺寸 | 高8px(线性)或直径120px(环形)  |
| large  | 大尺寸 | 高12px(线性)或直径160px(环形) |
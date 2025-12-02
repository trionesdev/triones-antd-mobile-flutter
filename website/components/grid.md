# Grid 栅格

栅格布局组件，用于创建响应式的网格布局。

## 何时使用

当需要将页面内容按规则的网格排列时使用，可以方便地创建各种复杂的网格布局。

## 代码演示

```dart src=../example/lib/pages/grid_page.dart preview=/grid
```

## API

### AntGrid 属性

| 属性         | 说明   | 类型                   | 默认值  |
|------------|------|----------------------|------|
| columns    | 列数   | int?                 | 1    |
| spacing    | 子项间距 | double?              | 0    |
| children   | 子项   | `List<AntGridItem>?` | null |
| decoration | 装饰   | `BoxDecoration?`     | null |

### AntGridItem 属性

| 属性         | 说明  | 类型             | 默认值  |
|------------|-----|----------------|------|
| span       | 跨列数 | int?           | 1    |
| child      | 子组件 | Widget?        | null |
| decoration | 装饰  | BoxDecoration? | null |
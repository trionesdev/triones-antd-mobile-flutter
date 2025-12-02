# Breadcrumb 面包屑

Breadcrumb组件用于显示当前页面在系统层级结构中的位置，并能向上返回。

## 何时使用

- 当系统拥有超过两级以上的层级结构时
- 需要告知用户当前所在位置时
- 需要提供快速返回上级层级功能时
- 移动端页面导航路径展示

## 代码演示

```dart src=../example/lib/pages/breadcrumb_page.dart preview=/breadcrumb
```

## API

### AntBreadcrumb 组件参数

| 属性         | 说明    | 类型                                                         | 默认值  |
|------------|-------|------------------------------------------------------------|------|
| items      | 面包屑项  | `List<AntBreadcrumbItemStruct>?`                             | null |
| separator  | 分隔符   | Widget?                                                    | null |
| itemRender | 自定义渲染 | Widget? Function(AntBreadcrumbItemStruct item, int index)? | null |

### AntBreadcrumbItemStruct 结构体参数

| 属性    | 说明   | 类型               | 默认值  |
|-------|------|------------------|------|
| title | 标题   | String?          | null |
| onTap | 点击事件 | void Function()? | null |

### 使用说明

1. `items` 属性用于定义面包屑的各个层级项
2. `separator` 属性可以自定义分隔符，默认为 "/"
3. `itemRender` 属性允许自定义每个面包屑项的渲染方式
4. 最后一项（当前页面）默认没有点击事件且颜色为默认文字颜色，其他项默认有点击效果且颜色为边框色
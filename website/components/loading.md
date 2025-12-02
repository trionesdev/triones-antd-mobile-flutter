# Loading 加载中

加载中组件，用于表示正在进行的操作或加载过程。

## 何时使用

当页面或某个区域正在加载数据、执行耗时操作时使用，向用户提供视觉反馈，表明系统正在处理中。

## 代码演示

```dart src=../example/lib/pages/loading_page.dart preview=/loading
```

## API

加载中的属性说明如下：

| 属性              | 说明   | 类型     | 默认值         |
|-----------------|------|--------|-------------|
| color           | 颜色   | Color? | Colors.grey |
| backgroundColor | 背景颜色 | Color? | null        |
| size            | 大小   | double? | 48.0       |
| strokeWidth     | 线条宽度 | double? | 4.0        |
# Popup 弹出层

弹出层组件，用于展示弹窗、信息提示、选择操作等。

## 代码演示

```dart src=../example/lib/pages/popup_page.dart preview=/popup
```

## API

### AntPopup.show()

静态方法，用于显示弹出层。

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| context | 上下文 | BuildContext | - |
| color | 背景颜色 | Color? | Colors.white |
| position | 弹出位置 | AntPopupPosition | AntPopupPosition.bottom |
| width | 宽度，仅在position为left/right时有效 | double? | null |
| height | 高度，仅在position为top/bottom时有效 | double? | null |
| round | 是否圆角 | bool | true |
| child | 弹窗内容 | Widget? | null |

### showAntPopup()

函数式调用方式显示弹出层。

| 属性 | 说明 | 类型 | 默认值 |
| --- | --- | --- | --- |
| context | 上下文 | BuildContext | - |
| color | 背景颜色 | Color? | Colors.white |
| position | 弹出位置 | AntPopupPosition | AntPopupPosition.bottom |
| width | 宽度，仅在position为left/right时有效 | double? | null |
| height | 高度，仅在position为top/bottom时有效 | double? | null |
| round | 是否圆角 | bool | true |
| child | 弹窗内容 | Widget? | null |

### AntPopupPosition 枚举

| 值 | 说明 |
| --- | --- |
| top | 从顶部弹出 |
| bottom | 从底部弹出 |
| left | 从左侧弹出 |
| right | 从右侧弹出 |
| center | 从中心弹出 |

## 使用示例

### 基础用法

```dart
// 底部弹出（默认）
showAntPopup(
  context: context,
  height: 400,
  child: Text("Bottom Popup"),
);

// 顶部弹出
showAntPopup(
  context: context,
  position: AntPopupPosition.top,
  height: 400,
  child: Text("Top Popup"),
);

// 左侧弹出
showAntPopup(
  context: context,
  position: AntPopupPosition.left,
  width: 200,
  child: Text("Left Popup"),
);

// 右侧弹出
showAntPopup(
  context: context,
  position: AntPopupPosition.right,
  width: 200,
  child: Text("Right Popup"),
);

// 中心弹出
showAntPopup(
  context: context,
  position: AntPopupPosition.center,
  child: Container(
    width: 200,
    height: 200,
    child: Text("Center Popup"),
  ),
);
```

### 自定义样式

```dart
// 自定义背景色
showAntPopup(
  context: context,
  color: Colors.blue[100],
  height: 300,
  child: Text("Custom Color Popup"),
);

// 无圆角
showAntPopup(
  context: context,
  round: false,
  height: 300,
  child: Text("No Round Popup"),
);
```

### 复杂内容

```dart
showAntPopup(
  context: context,
  height: 500,
  child: Column(
    children: [
      Container(
        height: 50,
        color: Colors.blue,
        child: Center(child: Text("Header")),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Item $index"),
              onTap: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    ],
  ),
);
```

## 注意事项

1. `width` 参数仅在 `position` 为 `left` 或 `right` 时生效
2. `height` 参数仅在 `position` 为 `top` 或 `bottom` 时生效
3. 中心弹出时，宽高由子组件决定
4. 弹出层会自动添加背景遮罩，点击遮罩可关闭弹窗
5. 支持主题定制，圆角大小跟随主题设置
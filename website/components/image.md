# Image 图片

图片组件，用于展示图片，支持网络图片、默认图片和错误图片显示，同时支持图片预览功能。

## 何时使用

当需要在应用中展示图片时使用，组件内置了加载失败和默认图片的处理逻辑，同时支持点击预览功能。

## 代码演示

```dart src=../example/lib/pages/image_page.dart preview=/image
```

## API

图片的属性说明如下：

| 属性      | 说明       | 类型      | 默认值  |
|---------|----------|---------|------|
| src     | 图片地址     | String? | null |
| width   | 图片宽度     | double? | null |
| height  | 图片高度     | double? | null |
| preview | 是否开启图片预览 | bool    | true |

## 使用示例

### 基础用法

显示网络图片：

```dart
AntImage
(
src: 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
width: 200,
)
```

### 默认图片

当未指定图片地址时，会显示默认图片：

```dart
AntImage(width:200,)
```

### 加载失败处理

当网络图片加载失败时，会自动显示错误图片：

```dart
AntImage
(
src: 'https://zos.alipayobjects.com/rmsportal/1.png',
width: 200,
)
```

### 禁用预览

可以通过设置 preview 为 false 来禁用图片预览功能：

```dart
AntImage
(
src: 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
width: 200,
preview:
false
,
)
```
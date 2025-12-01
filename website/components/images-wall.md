# ImagesWall 图片墙

图片墙组件，用于实现图片上传、预览和管理功能，支持多种图片源和自定义上传逻辑。

## 何时使用

当需要实现图片上传功能，允许用户从相册选择图片或拍照上传，并对已上传的图片进行预览、删除等操作时使用。

## 代码演示

```dart src=../example/lib/pages/images_wall_page.dart preview=/images-wall
```

## API

图片墙的属性说明如下：

| 属性             | 说明         | 类型                                                                 | 默认值   |
|----------------|------------|--------------------------------------------------------------------|-------|
| value          | 当前值        | List<AntImagesWallItemStruct>?                                     | null  |
| maxCount       | 最大图片数量     | int?                                                               | null  |
| disabled       | 是否禁用       | bool                                                               | false |
| crossAxisCount | 列数         | int?                                                               | 5     |
| onChange       | 值改变回调      | ValueChanged<List<AntImagesWallItemStruct>>?                       | null  |
| uploadRequest  | 上传请求       | Future<String?> Function(Uint8List fileContent, String? fileName)? | null  |
| multiSelect    | 是否多选       | bool?                                                              | true  |
| maxSize        | 图片最大大小(MB) | int?                                                               | null  |

### AntImagesWallItemStruct 属性

| 属性           | 说明   | 类型              | 默认值  |
|--------------|------|-----------------|------|
| uid          | 唯一标识 | String?         | null |
| status       | 图片状态 | AntImageStatus? | done |
| image        | 图片组件 | Image?          | null |
| path         | 图片路径 | String?         | null |
| type         | 图片类型 | AntImageType?   | null |
| fileName     | 文件名  | String?         | null |
| errorMessage | 错误信息 | String?         | null |

### AntImageStatus 枚举值

| 值         | 说明   |
|-----------|------|
| done      | 已完成  |
| uploading | 上传中  |
| error     | 上传错误 |
| removed   | 已移除  |

### AntImageType 枚举值

| 值       | 说明   |
|---------|------|
| asset   | 本地资源 |
| network | 网络图片 |
| file    | 文件图片 |
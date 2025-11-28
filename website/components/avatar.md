# Avatar 头像

Avatar组件用于展示用户头像或品牌标识，支持图片、图标或默认占位符形式。

## 何时使用

- 展示用户头像或品牌标识
- 用户列表或用户信息展示
- 需要统一头像样式和尺寸的场景
- 需要圆形或方形头像展示的场景

## 代码演示

```dart src=../example/lib/pages/avatar_page.dart preview=/avatar
```

## API

| 属性         | 说明   | 类型              | 默认值                   |
|------------|------|-----------------|-----------------------|
| src        | 图片地址 | String?         | null                  |
| icon       | 图标   | Widget?         | null                  |
| shape      | 形状   | AntAvatarShape? | AntAvatarShape.square |
| size       | 大小   | AntSize?        | AntSize.middle        |
| style      | 样式   | StateStyle?     | null                  |
| decoration | 装饰   | BoxDecoration?  | null                  |

### AntAvatarShape 枚举值

| 值      | 说明 |
|--------|----|
| circle | 圆形 |
| square | 方形 |

### AntSize 枚举值

| 值      | 说明  | 尺寸    |
|--------|-----|-------|
| small  | 小尺寸 | 24x24 |
| middle | 中尺寸 | 32x32 |
| large  | 大尺寸 | 48x48 |
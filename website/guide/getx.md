# 使用Getx
> Getx 默认值支持sdk自带的MaterialApp,如果我们要使用Getx，需要做一些处理。

## 直接使用Getx
本质上该组件库也是对MaterialApp的封装，所以，我们可以使用GetMaterialApp作物内部的一个Widget.
```dart
AntThemeData antThemeData = AntThemeData();
AntTheme(
  data: antThemeData,
  child: GetMaterialApp(
        title: 'TrionesDev',
        theme: antThemeData.toMaterialThemeData(),
        getPages: Routes.routes,
        home: const HomePage(),
        onInit: ()  {
        
        },
        onReady: () {},
    )
)
```

## 使用AntGetx
为了方便使用，我们提供了AntGetx组件，该组件内部已经封装了GetMaterialApp，所以，我们可以直接使用AntGetx组件。

使用方法
```dart
  runApp(GetAntApp(
    title: 'TrionesDev',
    theme: AntThemeData(),
    getPages: Routes.routes,
    home: const HomeLayout(),
    onInit: ()  async {

    },
    onReady: () {},
  ));
```
# AppBar 导航栏

## 代码演示

```dart preview:/app-bar
import 'package:flutter/material.dart';

import '../../../antd.dart';

class AntAppBar extends StatefulWidget implements PreferredSizeWidget {
  AntAppBar({super.key,
    this.title,
    this.back = true,
    this.backIcon,
    this.backText,
    this.onBack,
    this.left,
    this.right,
    this.decoration,
    this.bottom,
    this.child,
    this.childHeight = 0,
    this.bottomHeight = 0,
    this.toolbarHeight})
      : preferredSize =
  _PreferredAppBarSize(toolbarHeight, childHeight, bottomHeight);

  final Widget? title;
  final bool? back;
  final Widget? backIcon;
  final Widget? backText;
  final Function(BuildContext context)? onBack;
  final List<Widget>? left;
  final List<Widget>? right;
  final BoxDecoration? decoration;
  final Widget? child;
  final double? childHeight;
  final Widget? bottom;
  final double? bottomHeight;
  final double? toolbarHeight;

  @override
  State<StatefulWidget> createState() => _AntAppBarState();

  @override
  final Size preferredSize;
}

class _AntAppBarState extends State<AntAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    List<Widget> toolbarWidgets = [
      Center(
        child: widget.title,
      ),
    ];
    if ((widget.left != null && widget.left!.isNotEmpty) ||
        widget.back == true) {
      List<Widget> leftWidgets = [];
      if (widget.back == true) {
        leftWidgets.add(GestureDetector(
          onTap: () {
            if (widget.onBack != null) {
              widget.onBack!.call(context);
            } else {
              Navigator.pop(context);
            }
          },
          child: Row(children: [
            widget.backIcon ?? Icon(Icons.arrow_back),
            if(widget.backText != null) widget.backText!
          ],),
        ));
      }
      if (leftWidgets.isNotEmpty) {
        toolbarWidgets.add(Positioned(
          left: 8,
          child: Row(
            children: leftWidgets,
          ),
        ));
      }
    }
    if (widget.right != null && widget.right!.isNotEmpty) {
      toolbarWidgets.add(Positioned(
        right: 8,
        child: Row(
          children: widget.right!,
        ),
      ));
    }

    if (toolbarWidgets.isNotEmpty) {
      widgets.add(SizedBox(
        height: widget.toolbarHeight ?? kToolbarHeight,
        child: Stack(alignment: Alignment.center, children: toolbarWidgets),
      ));
    }
    if (widget.child != null) {
      widgets.add(widget.child!);
    }

    return SafeArea(
        child: Container(
          decoration: widget.decoration,
          height: widget.preferredSize.height,
          child: Column(
            children: widgets,
          ),
        ));
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.childHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) +
      (childHeight ?? 0) +
      (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? childHeight;
  final double? bottomHeight;
}

```

## API

| 参数            | 说明       | 类型                             | 默认值                    |
|---------------|----------|--------------------------------|------------------------|
| style         | 按钮样式     | StateStyle                     |                        |
| title         | 标题       | Widget                         |                        |
| back          | 是否显示返回按钮 | bool                           | true                   |
| backIcon      | 返回按钮图标   | Widget                         | Icon(Icons.arrow_back) |
| backText      | 返回按钮文字   | Widget                         |                        |
| onBack        | 返回按钮点击事件 | Function(BuildContext context) |                        |
| left          | 左侧按钮     | List\<Widget>                  |                        |
| right         | 右侧按钮     | List\<Widget>                  |                        |
| decoration    | 背景装饰     | BoxDecoration                  |                        |
| bottom        | 底部组件     | Widget                         |                        |
| bottomHeight  | 底部组件高度   | double                         | 0                      |
| toolbarHeight | 工具栏组件高度  | double                         | 0                      |
| child         | 子组件      | Widget                         |                        |

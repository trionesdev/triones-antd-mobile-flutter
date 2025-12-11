import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../trionesdev_antd_mobile.dart';

///@component AppBar 顶部导航栏
class AntAppBar extends StatelessWidget implements PreferredSizeWidget {
  AntAppBar({
    super.key,
    this.backIcon,
    this.back,
    this.backText,
    this.showBack = true,
    this.onBack,
    this.leading,
    this.title,
    this.titleText,
    this.actions,
    this.toolbarHeight,
    this.bottom,
    this.centerTitle = true,
    this.backgroundColor,
    this.decoration,
    this.systemUiOverlayStyle,
  }) : preferredSize = _PreferredAppBarSize(
         toolbarHeight,
         bottom?.preferredSize.height,
       );

  /// @description 返回图标
  /// @default null
  final Widget? backIcon;

  /// @description 返回图标后面的内容(Widget)
  /// @default null
  final Widget? back;

  /// @description 显示返回图标的文本
  /// @default null
  final String? backText;

  /// @description 是否显示返回图标
  /// @default true
  final bool showBack;
  final Function? onBack;

  /// @description 左侧返回图标后面的内容
  /// @default null
  final Widget? leading;

  /// @description 标题
  /// @default null
  final Widget? title;

  /// @description 显示标题的文本
  /// @default null
  final String? titleText;

  /// @description 右侧操作按钮
  /// @default null
  final List<Widget>? actions;

  /// @description 顶部导航栏高度
  /// @default null
  final double? toolbarHeight;

  /// @description 底部内容
  /// @default null
  final PreferredSizeWidget? bottom;

  /// @description 是否居中显示
  /// @default true
  final bool? centerTitle;

  /// @description 背景颜色
  /// @default null
  final Color? backgroundColor;

  /// @description 装饰
  /// @default null
  final BoxDecoration? decoration;

  /// @description 系统状态栏样式
  /// @default null
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  bool get showBackText {
    return backText != null || back != null;
  }

  Widget get finalBackText {
    if (back != null) {
      return back!;
    }
    if (backText != null) {
      return Text(backText!);
    }
    return Container();
  }

  Widget leadingWidget(BuildContext context) {
    List<Widget> leadingChildren = [];
    if (showBack) {
      leadingChildren.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (onBack != null) {
              onBack?.call();
              return;
            }
            Navigator.maybePop(context);
          },
          child: Row(
            spacing: 4,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8),
                child: backIcon ?? Icon(AntIcons.leftOutline, size: 16),
              ),
              if (showBackText) finalBackText,
            ],
          ),
        ),
      );
    }
    if (leading != null) {
      leadingChildren.add(leading!);
    }
    return Row(children: leadingChildren);
  }

  Widget? titleWidget(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    if (title != null && title is Text) {
      Text source = title as Text;
      return WidgetUtils.textMerge(
        Text(source.data!, style: TextStyle(fontSize: themeData.fontSizeLG)),
        source,
      );
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return AppBar(
      leading: leadingWidget(context),
      automaticallyImplyLeading: false,
      title: titleWidget(context),
      actions: actions,
      bottom: bottom,
      backgroundColor: backgroundColor ?? themeData.colorBgBase,
      centerTitle: centerTitle,
      flexibleSpace: Container(decoration: decoration),
      actionsPadding: EdgeInsets.only(right: 8),
      systemOverlayStyle: systemUiOverlayStyle,
    );
  }

  @override
  final Size preferredSize;
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
    : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

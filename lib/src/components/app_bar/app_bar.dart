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

  /// @description 返回时回调
  /// @default null
  final VoidCallback? onBack;

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

  @override
  final Size preferredSize;

  Widget? _backLabel() {
    if (back != null) {
      return back;
    }
    if (backText != null) {
      return Text(backText!);
    }
    return null;
  }

  bool get _hasBackLabel => showBack && (back != null || backText != null);

  double? get _leadingWidth {
    if (!showBack && leading == null) {
      return null;
    }
    // 带返回文案时加宽，避免默认 56 装不下；纯图标保持默认宽度
    if (_hasBackLabel || leading != null) {
      return 96;
    }
    return null;
  }

  Widget? _leadingWidget(BuildContext context) {
    final List<Widget> children = [];
    if (showBack) {
      final Widget? backLabel = _backLabel();
      children.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (onBack != null) {
              onBack!();
              return;
            }
            Navigator.maybePop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Center(
                    child: backIcon ??
                        const Icon(AntIcons.leftOutline, size: 16),
                  ),
                ),
                if (backLabel != null) ...[
                  const SizedBox(width: 4),
                  backLabel,
                ],
              ],
            ),
          ),
        ),
      );
    }
    if (leading != null) {
      children.add(leading!);
    }
    if (children.isEmpty) {
      return null;
    }
    // FittedBox 吸收亚像素取整导致的 0.5px 溢出
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget? _titleWidget(BuildContext context) {
    final AntThemeData themeData = AntTheme.of(context);
    final Widget? resolvedTitle =
        title ?? (titleText != null ? Text(titleText!) : null);
    if (resolvedTitle is Text) {
      return WidgetUtils.textMerge(
        Text(
          resolvedTitle.data ?? '',
          style: TextStyle(fontSize: themeData.fontSizeLG),
        ),
        resolvedTitle,
      );
    }
    return resolvedTitle;
  }

  @override
  Widget build(BuildContext context) {
    final AntThemeData themeData = AntTheme.of(context);
    return AppBar(
      leading: _leadingWidget(context),
      leadingWidth: _leadingWidth,
      automaticallyImplyLeading: false,
      title: _titleWidget(context),
      actions: actions,
      bottom: bottom,
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
      backgroundColor: backgroundColor ?? themeData.colorBgBase,
      centerTitle: centerTitle,
      flexibleSpace:
          decoration != null ? Container(decoration: decoration) : null,
      actionsPadding: const EdgeInsets.only(right: 8),
      systemOverlayStyle:
          systemUiOverlayStyle ?? themeData.appBarTheme.systemOverlayStyle,
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
    : super.fromHeight(
        (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0),
      );

  final double? toolbarHeight;
  final double? bottomHeight;
}

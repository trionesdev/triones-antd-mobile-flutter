import 'package:flutter/material.dart';

import '../../../antd.dart';

class AntAppBar extends StatelessWidget implements PreferredSizeWidget {
  AntAppBar(
      {super.key,
      this.backIcon,
      this.backText,
      this.back = true,
      this.onBack,
      this.leading,
      this.title,
      this.actions,
      this.toolbarHeight,
      this.bottom,
      this.centerTitle = true,
      this.decoration})
      : preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
  final Widget? backIcon;
  final Widget? backText;
  final bool back;
  final Function? onBack;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final BoxDecoration? decoration;

  Widget leadingWidget(BuildContext context) {
    List<Widget> leadingChildren = [];
    if (back) {
      leadingChildren.add(GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (onBack != null) {
            onBack?.call();
            return;
          }
          Navigator.maybePop(context);
        },
        child: Row(children: [
          Container(
            padding: EdgeInsets.only(left: 8),
            child: backIcon ?? Icon(Icons.arrow_back),
          ),
          if (backText != null) backText!
        ]),
      ));
    }
    if (leading != null) {
      leadingChildren.add(leading!);
    }
    return Row(
      children: leadingChildren,
    );
  }

  Widget? titleWidget(BuildContext context) {
    if (title != null && title is Text) {
      Text source = title as Text;
      return WidgetUtils.textMerge(
          Text(
            source.data!,
            style: TextStyle(fontSize: 16),
          ),
          source);
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
      backgroundColor: themeData.colorPrimary,
      centerTitle: centerTitle,
      flexibleSpace: Container(decoration: decoration),
    );
  }

  @override
  final Size preferredSize;
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

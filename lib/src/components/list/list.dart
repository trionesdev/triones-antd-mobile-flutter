import 'package:flutter/cupertino.dart';
import 'package:trionesdev_antd_mobile/antd.dart';


typedef ListItemRenderCallback = Widget Function(
    BuildContext context, dynamic item, int index);

class AntList extends StatefulWidget {
  const AntList(
      {super.key,
      this.separator,
      this.dataSource,
      this.itemRender,
      this.children});

  final List<Widget>? children;
  final Widget? separator;
  final List<dynamic>? dataSource;
  final ListItemRenderCallback? itemRender;

  @override
  State<StatefulWidget> createState() => _AntListState();
}

class _AntListState extends State<AntList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (widget.children != null) {
      children.addAll(widget.children!);
    }
    if (widget.dataSource != null && widget.itemRender != null) {
      for (int i = 0; i < widget.dataSource!.length; i++) {
        children.add(widget.itemRender!(context, widget.dataSource![i], i));
        if (widget.separator != null) {
          children.add(widget.separator!);
        }
      }
    }
    return ListView(
      children: children,
    );
  }
}

class AntListItem extends StatefulWidget {
  const AntListItem(
      {super.key, this.icon, this.title, this.extra, this.style, this.onTap});

  final StateStyle? style;
  final Widget? icon;
  final Widget? title;
  final Widget? extra;
  final GestureTapCallback? onTap;

  @override
  State<StatefulWidget> createState() => _AntListItemState();
}

class _AntListItemState extends State<AntListItem> {
  @override
  Widget build(BuildContext context) {

    StateStyle style = _AntListItemStyle(context,widget);
style = style.merge(widget.style);

    List<Widget> children = [];
    if (widget.icon != null) {
      children.add(widget.icon!);
    }
    if (widget.title != null) {
      children.add(Expanded(child: widget.title!));
    }
    if (widget.extra != null) {
      children.add(widget.extra!);
    }
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        decoration: style.resolve(const <WidgetState>{})?.decoration,
        padding: style.resolve(const <WidgetState>{})?.edgeInsets,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 2,
          children: children,
        ),
      ),
    );
  }
}

class _AntListItemStyle extends StateStyle {
  const _AntListItemStyle(this.context, this.listItem);
  final BuildContext context;
  final AntListItem listItem;


  @override
  Style get style{
    return Style(
      padding: StylePadding(
        top: 8,
        bottom: 8,
        left: 8,
        right: 8,
      )
    );
  }

}

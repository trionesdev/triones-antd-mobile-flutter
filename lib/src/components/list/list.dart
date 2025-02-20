import 'package:flutter/cupertino.dart';

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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

typedef AntListItemRenderCallback = Widget Function(
    BuildContext context, dynamic item, int index);

class AntList extends StatefulWidget {
  const AntList({super.key,
    this.separator,
    this.dataSource,
    this.itemRender,
    this.children,
    this.style,
    this.controller,
    this.loading = false});

  final StateStyle? style;
  final bool loading;
  final List<Widget>? children;
  final Widget? separator;
  final List<dynamic>? dataSource;
  final AntListItemRenderCallback? itemRender;
  final ScrollController? controller;

  @override
  State<StatefulWidget> createState() => _AntListState();
}

class _AntListState extends State<AntList> with MaterialStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntListStyle(context, widget);
    stateStyle = stateStyle.merge(widget.style);

    List<Widget> children = [];
    if (widget.children != null) {
      children.addAll(widget.children!);
    }
    if (widget.dataSource != null && widget.itemRender != null) {
      for (int i = 0; i < widget.dataSource!.length; i++) {
        children.add(widget.itemRender!(context, widget.dataSource![i], i));
        if (widget.separator != null && i < widget.dataSource!.length - 1) {
          children.add(widget.separator!);
        }
      }
    }
    return Stack(
      children: [
        Container(
          decoration: stateStyle
              .resolve(materialStates)
              ?.decoration,
          padding: stateStyle
              .resolve(materialStates)
              ?.computedPadding,
          child: children.isNotEmpty
              ? ListView(
            controller: widget.controller,
            children: children,
          )
              : Container(
            width: double.infinity,
            decoration: stateStyle
                .resolve(materialStates)
                ?.decoration,
            child: AntEmpty(),
          ),
        ),
        if (widget.loading) Positioned.fill(child: Align(
          child: AntSpinLoading(),
        ))
      ],
    );
  }
}

class _AntListStyle extends StateStyle {
  const _AntListStyle(this.context, this.list);

  final BuildContext context;
  final AntList list;

  @override
  Style get style {
    return Style(
      backgroundColor: Colors.white,
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

class _AntListItemState extends State<AntListItem> with MaterialStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntListItemStyle(context, widget);
    stateStyle = stateStyle.merge(widget.style);

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
        decoration: stateStyle
            .resolve(materialStates)
            ?.decoration,
        padding: stateStyle
            .resolve(materialStates)
            ?.computedPadding,
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
  Style get style {
    return Style(
        padding: StylePadding(
          top: 8,
          bottom: 8,
          left: 8,
          right: 8,
        ));
  }
}

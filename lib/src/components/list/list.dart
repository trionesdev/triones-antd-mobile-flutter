import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

typedef AntListItemBuilder<T> =
Widget Function(BuildContext context, T item, int index)?;

class AntList<T> extends StatefulWidget {
  const AntList({
    super.key,
    this.separator,
    this.empty,
    this.dataSource,
    this.itemBuilder,
    this.children,
    this.style,
    this.controller,
    this.loading = false,
    this.shrinkWrap = false,
    this.pending,
    this.physics,
    //距底部多远时（单位px），触发 scrolltolower 事件
    this.lowerThreshold = 50,
    this.onScrollToLower,
  });

  final StateStyle? style;
  final bool loading;
  final List<Widget>? children;
  final Widget? separator;
  final Widget? empty;
  final List<T>? dataSource;
  final AntListItemBuilder<T>? itemBuilder;
  final ScrollController? controller;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? pending;
  final ScrollPhysics? physics;
  final int lowerThreshold;
  final AsyncCallback? onScrollToLower;

  @override
  State<StatefulWidget> createState() => _AntListState<T>();
}

class _AntListState<T> extends State<AntList<T>> with MaterialStateMixin {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    if (widget.controller != null) {
      _scrollController = widget.controller!;
    }
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - widget.lowerThreshold) {
        widget.onScrollToLower?.call();
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(AntList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntListStyle(context, widget);
    stateStyle = stateStyle.merge(widget.style);

    List<Widget> children = [];
    if (widget.children != null) {
      for (int i = 0; i < widget.children!.length; i++) {
        children.add(widget.children![i]);
        if (widget.separator != null && i < widget.children!.length - 1) {
          children.add(widget.separator!);
        }
      }
    } else {
      if (widget.dataSource != null && widget.itemBuilder != null) {
        for (int i = 0; i < widget.dataSource!.length; i++) {
          children.add(widget.itemBuilder!(context, widget.dataSource![i], i));
          if (widget.separator != null && i < widget.dataSource!.length - 1) {
            children.add(widget.separator!);
          }
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
          child:
          children.isNotEmpty
              ? ListView(
            padding: widget.pending,
            controller: _scrollController,
            shrinkWrap: widget.shrinkWrap,
            physics: widget.physics,
            children: children,
          )
              : (widget.empty ?? Align(
            alignment: Alignment(0.0, -0.8),
            child: AntEmpty(),
          )),
        ),
        if (widget.loading)
          Positioned.fill(child: Align(child: AntSpinLoading())),
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
    return Style(backgroundColor: Colors.white);
  }
}

class AntListItem extends StatefulWidget {
  const AntListItem({
    super.key,
    this.icon,
    this.title,
    this.extra,
    this.style,
    this.onTap,
  });

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
    return Style(padding: StylePadding(top: 8, bottom: 8, left: 8, right: 8));
  }
}

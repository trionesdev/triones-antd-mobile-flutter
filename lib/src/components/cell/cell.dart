import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/src/components/types.dart';
import 'package:trionesdev_antd_mobile/src/icons/icons.dart';

class AntCellGroup extends StatefulWidget {
  const AntCellGroup({
    super.key,
    this.size,
    this.title,
    this.titleAlign,
    this.titleStyle,
    this.labelCol,
    this.labelAlign,
    this.children,
    this.showDivider = true,
    this.arrow = true,
  });

  final AntSize? size;
  final String? title;
  final AntLabelAlign? titleAlign;
  final TextStyle? titleStyle;
  final AntCol? labelCol;
  final AntLabelAlign? labelAlign;
  final List<Widget>? children;
  final bool showDivider;
  final bool arrow;

  static AntCellGroupState? maybeOf(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_CellGroupScope>();
    return scope?.groupState;
  }

  @override
  State<StatefulWidget> createState() => AntCellGroupState();
}

class _CellGroupScope extends InheritedWidget {
  const _CellGroupScope({
    required this.groupState,
    required this.generation,
    required super.child,
  });

  final AntCellGroupState groupState;
  final int generation;

  @override
  bool updateShouldNotify(_CellGroupScope oldWidget) {
    return oldWidget.generation != generation;
  }
}

class AntCellGroupState extends State<AntCellGroup> {
  int _generation = 0;

  Widget get cells {
    List<Widget> children = [];
    if (widget.children != null) {
      for (int i = 0; i < widget.children!.length; i++) {
        children.add(widget.children!.elementAt(i));
        if (widget.showDivider) {
          if (i != widget.children!.length - 1) {
            children.add(Divider(height: 0));
          }
        }
      }
      return Column(children: children);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: _CellGroupScope(
        groupState: this,
        generation: _generation,
        child: Column(
          children: [
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  widget.title ?? '',
                  style:
                  widget.titleStyle ??
                      TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            if (widget.children != null) cells,
          ],
        ),
      ),
    );
  }
}

class AntCell extends StatefulWidget {
  const AntCell({
    super.key,
    this.size,
    this.arrow  ,
    this.placeholderWidget,
    this.placeholder,
    this.icon,
    this.labelWidget,
    this.label,
    this.labelStyle,
    this.labelCol,
    this.labelAlign,
    this.value,
    this.child,
    this.onTap,
  });

  final AntSize? size;
  final Text? placeholderWidget;
  final String? placeholder;
  final bool? arrow;
  final Widget? icon;
  final Widget? labelWidget;
  final String? label;
  final TextStyle? labelStyle;
  final AntCol? labelCol;
  final AntLabelAlign? labelAlign;
  final dynamic? value;
  final Widget? child;
  final Function? onTap;

  @override
  State<StatefulWidget> createState() => _AntCellState();
}

class _AntCellState extends State<AntCell> {
  double get height {
    AntCellGroupState? groupState = AntCellGroup.maybeOf(context);
    AntSize size = widget.size ?? groupState?.widget.size ?? AntSize.middle;
    switch (size) {
      case AntSize.large:
        return 48;
      case AntSize.middle:
        return 32;
      case AntSize.small:
        return 24;
    }
  }

  Widget get child {
    if (widget.child != null) {
      return widget.child!;
    }
    if (widget.value != null) {
      return Text(widget.value?.toString() ?? '', style: TextStyle(color: Colors.black));
    } else {
      return Text(
        widget.placeholder ?? '',
        style: TextStyle(color: Colors.grey),
      );
    }
  }

  Alignment get labelAlign {
    AntCellGroupState? groupState = AntCellGroup.maybeOf(context);
    if (widget.labelAlign == AntLabelAlign.right) {
      return Alignment.centerRight;
    }
    if (groupState != null &&
        groupState.widget.labelAlign == AntLabelAlign.right) {
      return Alignment.centerRight;
    }
    return Alignment.centerLeft;
  }

  Widget get label {
    AntCellGroupState? groupState = AntCellGroup.maybeOf(context);
    AntCol? labelCol = widget.labelCol ?? groupState?.widget.labelCol;

    Widget labelWidget =
        widget.labelWidget ??
            Text(widget.label ?? '', style: widget.labelStyle);

    if (labelCol?.flex != null) {
      return Container(
        height: height,
        width: labelCol!.flex!,
        alignment: labelAlign,
        child: labelWidget,
      );
    } else if (labelCol?.span != null) {
      return Expanded(
        flex: labelCol!.span!,
        child: Container(
            height: height,
            alignment: labelAlign, child: labelWidget),
      );
    }
    return Container(height: height, alignment: labelAlign, child: labelWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) label,
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height), child: Row(
                children: [
                  Expanded(child: child),
                  if (widget.arrow == true)
                    widget.icon ??
                        Icon(
                          AntIcons.rightOutline,
                          size: 16,
                          color: Colors.grey,
                        ),
                ],
              ),),
            ),
          ),
        ],
      )
    );
  }
}

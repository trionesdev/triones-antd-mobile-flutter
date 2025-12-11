import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/src/components/types.dart';
import 'package:trionesdev_antd_mobile/src/icons/icons.dart';

/// @component AntCellGroup 单元格组
class AntCellGroup extends StatefulWidget {
  const AntCellGroup({
    super.key,
    this.size,
    this.title,
    this.titleAlign,
    this.titleStyle,
    this.titleText,
    this.labelCol,
    this.labelAlign,
    this.children,
    this.showDivider = false,
    this.arrow = true,
    this.valueTextStyle,
  });

  /// @description 大小
  /// @default middle
  final AntSize? size;

  /// @description 标题
  /// @default null
  final Widget? title;

  /// @description 标题文本
  /// @default null
  final String? titleText;

  /// @description 标题对齐
  /// @default null
  final AntLabelAlign? titleAlign;

  /// @description 样式
  /// @default null
  final TextStyle? titleStyle;

  /// @description 左侧标签列
  /// @default null
  final AntCol? labelCol;

  /// @description 左侧标签对齐
  /// @default null
  final AntLabelAlign? labelAlign;

  /// @description 子组件
  /// @default null
  final List<Widget>? children;

  /// @description 是否显示分割线
  /// @default false
  final bool showDivider;

  /// @description 是否显示箭头
  /// @default true
  final bool arrow;
  final TextStyle? valueTextStyle;

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
                child:
                    widget.title ??
                    Text(
                      widget.titleText ?? '',
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

/// @component AntCell 单元格
class AntCell extends StatefulWidget {
  const AntCell({
    super.key,
    this.size,
    this.arrow,
    this.placeholderText,
    this.placeholder,
    this.icon,
    this.label,
    this.labelText,
    this.labelStyle,
    this.labelCol,
    this.labelAlign,
    this.value,
    this.child,
    this.onTap,
  });

  /// @description 大小
  /// @default middle
  final AntSize? size;

  /// @description 占位符
  /// @default null
  final Text? placeholder;

  /// @description 占位符文本
  /// @default null
  final String? placeholderText;

  /// @description 是否显示箭头
  /// @default true
  final bool? arrow;

  /// @description 图标
  /// @default null
  final Widget? icon;

  /// @description 标签
  /// @default null
  final Widget? label;

  /// @description 标签文本
  /// @default null
  final String? labelText;

  /// @description 样式
  /// @default null
  final TextStyle? labelStyle;

  /// @description 左侧标签列
  /// @default null
  final AntCol? labelCol;

  /// @description 左侧标签对齐
  /// @default null
  final AntLabelAlign? labelAlign;

  /// @description 值
  /// @default null
  final dynamic? value;

  /// @description 子组件
  final Widget? child;

  /// @description 点击回调
  /// @default null
  final Function? onTap;

  @override
  State<StatefulWidget> createState() => _AntCellState();
}

class _AntCellState extends State<AntCell> {
  _CellGroupScope? _cellGroupScope;

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
      return Text(
        widget.value?.toString() ?? '',
        style: TextStyle(color: Colors.black),
      );
    } else {
      if (widget.placeholder != null) {
        return widget.placeholder!;
      }
      return Text(
        widget.placeholderText ?? '',
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
        widget.label ?? Text(widget.labelText ?? '', style: widget.labelStyle);

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
          alignment: labelAlign,
          child: labelWidget,
        ),
      );
    }
    return Container(height: height, alignment: labelAlign, child: labelWidget);
  }

  @override
  void didChangeDependencies() {
    _cellGroupScope =
        context.dependOnInheritedWidgetOfExactType<_CellGroupScope>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null || widget.labelText != null) label,
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height),
                child: Row(
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/src/components/constants.dart';
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
    this.labelTextStyle,
    this.labelCol,
    this.labelAlign,
    this.contentAlign = AntAlign.left,
    this.children,
    this.showDivider = false,
    this.arrow = true,
    this.arrowIcon,
    this.contentTextStyle,
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

  /// @description 标签样式
  /// @default null
  final TextStyle? labelTextStyle;

  /// @description 左侧标签对齐
  /// @default null
  final AntLabelAlign? labelAlign;
  final AntAlign? contentAlign;

  /// @description 子组件
  /// @default null
  final List<Widget>? children;

  /// @description 是否显示分割线
  /// @default false
  final bool showDivider;

  /// @description 是否显示箭头
  /// @default true
  final bool arrow;

  /// @description 箭头图标
  /// @default null
  final Widget? arrowIcon;

  /// @description 值样式
  /// @default null
  final TextStyle? contentTextStyle;

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

  bool get _hasTitle =>
      widget.title != null || (widget.titleText?.isNotEmpty ?? false);

  Alignment get _titleAlignment {
    switch (widget.titleAlign) {
      case AntLabelAlign.right:
        return Alignment.centerRight;
      case AntLabelAlign.left:
      case null:
        return Alignment.centerLeft;
    }
  }

  Widget get _titleWidget {
    return Align(
      alignment: _titleAlignment,
      child: widget.title ??
          Text(
            widget.titleText ?? '',
            style: widget.titleStyle ??
                const TextStyle(fontSize: 14, color: Colors.grey),
          ),
    );
  }

  Widget get _cells {
    final children = widget.children;
    if (children == null || children.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Widget> items = [];
    for (int i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (widget.showDivider && i != children.length - 1) {
        items.add(const Divider(height: 0));
      }
    }
    return Column(children: items);
  }

  bool _labelColChanged(AntCol? a, AntCol? b) {
    if (identical(a, b)) return false;
    if (a == null || b == null) return true;
    return a.flex != b.flex || a.span != b.span;
  }

  @override
  void didUpdateWidget(AntCellGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.size != widget.size ||
        _labelColChanged(oldWidget.labelCol, widget.labelCol) ||
        oldWidget.labelAlign != widget.labelAlign ||
        oldWidget.labelTextStyle != widget.labelTextStyle ||
        oldWidget.contentAlign != widget.contentAlign ||
        oldWidget.contentTextStyle != widget.contentTextStyle ||
        oldWidget.arrow != widget.arrow ||
        oldWidget.arrowIcon != widget.arrowIcon) {
      setState(() {
        _generation++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: _CellGroupScope(
        groupState: this,
        generation: _generation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_hasTitle)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: _titleWidget,
              ),
            if (widget.children != null) _cells,
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
    this.arrowIcon,
    this.label,
    this.labelText,
    this.labelTextStyle,
    this.labelCol,
    this.labelAlign,
    this.contentText,
    this.contentTextStyle,
    this.contentAlign,
    this.child,
    this.extra,
    this.onTap,
    this.value,
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

  /// @description 箭头图标
  /// @default null
  final Widget? arrowIcon;

  /// @description 标签
  /// @default null
  final Widget? label;

  /// @description 标签文本
  /// @default null
  final String? labelText;

  /// @description 标签样式，只对labelText生效
  /// @default null
  final TextStyle? labelTextStyle;

  /// @description 左侧标签列
  /// @default null
  final AntCol? labelCol;

  /// @description 左侧标签对齐
  /// @default null
  final AntLabelAlign? labelAlign;

  /// @description 内容对齐方式
  /// @default null
  final AntAlign? contentAlign;

  /// @description 内容样式,只对contentText生效
  /// @default null
  final TextStyle? contentTextStyle;

  /// @description 值
  /// @default null
  final String? contentText;

  /// @description 子组件
  final Widget? child;

  final Widget? extra;

  /// @description 点击回调
  /// @default null
  final VoidCallback? onTap;

  /// @description 值
  /// @default null
  final dynamic value;

  @override
  State<StatefulWidget> createState() => _AntCellState();
}

class _AntCellState extends State<AntCell> {
  AntCellGroupState? _groupState;

  AntCellGroup? get _group => _groupState?.widget;

  double get _height {
    final AntSize size = widget.size ?? _group?.size ?? AntSize.medium;
    switch (size) {
      case AntSize.large:
        return sizeLg;
      case AntSize.medium:
        return sizeMd;
      case AntSize.small:
        return sizeSm;
    }
  }

  bool get _showArrow => widget.arrow ?? _group?.arrow ?? true;

  Alignment get _labelAlignment {
    final AntLabelAlign? align = widget.labelAlign ?? _group?.labelAlign;
    switch (align) {
      case AntLabelAlign.right:
        return Alignment.centerRight;
      case AntLabelAlign.left:
      case null:
        return Alignment.centerLeft;
    }
  }

  Alignment get _contentAlignment {
    final AntAlign? align = widget.contentAlign ?? _group?.contentAlign;
    switch (align) {
      case AntAlign.right:
        return Alignment.centerRight;
      case AntAlign.center:
        return Alignment.center;
      case AntAlign.left:
      case null:
        return Alignment.centerLeft;
    }
  }

  TextStyle? get _contentStyle =>
      widget.contentTextStyle ?? _group?.contentTextStyle;

  Widget get _content {
    if (widget.child != null) {
      return widget.child!;
    }
    if (widget.contentText != null) {
      return Text(widget.contentText!, style: _contentStyle);
    }
    if (widget.value != null) {
      return Text(widget.value.toString(), style: _contentStyle);
    }
    if (widget.placeholder != null) {
      return widget.placeholder!;
    }
    return Text(
      widget.placeholderText ?? '',
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget get _label {
    final AntCol? labelCol = widget.labelCol ?? _group?.labelCol;
    final Widget labelWidget = widget.label ??
        Text(
          widget.labelText ?? '',
          style: widget.labelTextStyle ?? _group?.labelTextStyle,
        );

    if (labelCol?.flex != null) {
      return Container(
        height: _height,
        width: labelCol!.flex!,
        alignment: _labelAlignment,
        child: labelWidget,
      );
    }
    if (labelCol?.span != null) {
      return Expanded(
        flex: labelCol!.span!,
        child: Container(
          height: _height,
          alignment: _labelAlignment,
          child: labelWidget,
        ),
      );
    }
    return Container(
      height: _height,
      alignment: _labelAlignment,
      child: labelWidget,
    );
  }

  Widget get _arrowIcon {
    return widget.arrowIcon ??
        _group?.arrowIcon ??
        Icon(AntIcons.rightOutline, size: 14, color: Colors.grey);
  }

  @override
  void didChangeDependencies() {
    _groupState = AntCellGroup.maybeOf(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasLabel =
        widget.label != null || widget.labelText != null;

    final Widget row = ConstrainedBox(
      constraints: BoxConstraints(minHeight: _height),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.icon != null) widget.icon!,
          if (hasLabel) _label,
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: _height),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: _contentAlignment,
                      child: _content,
                    ),
                  ),
                  if (widget.extra != null) widget.extra!,
                  if (_showArrow) _arrowIcon,
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: row,
    );
  }
}

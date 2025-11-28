import 'package:flutter/material.dart';

///@component Badge 徽标
class AntBadge extends StatefulWidget {
  const AntBadge(
      {super.key,
      this.child,
      this.label,
        this.labelText,
      this.count,
      this.visible,
      this.maxCount = 999,
      this.offset,
      this.alignment,
      this.backgroundColor,
      this.textStyle});

  /// @description 背景色
  /// @default null
  final Color? backgroundColor;
  /// @description 徽标内容
  /// @default null
  final Widget? label;
  /// @description 徽标内容文本
  /// @default null
  final String? labelText;
  /// @description 徽标数字
  /// @default null
  final int? count;
  /// @description 最大数
  /// @default 999
  final int? maxCount;
  /// @description 文本样式
  /// @default null
  final Alignment? alignment;
  /// @description 偏移
  /// @default null
  final Offset? offset;
  /// @description 文本样式
  /// @default null
  final TextStyle? textStyle;
  /// @description 是否可见
  /// @default true
  final bool? visible;
  /// @description 子组件
  /// @default null
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _AntBadgeState();
}

class _AntBadgeState extends State<AntBadge> {
  Widget? get label {
    if (widget.label != null) {
      return widget.label!;
    }
    if (widget.labelText != null) {
      return Text(widget.labelText!);
    }
    if (widget.count != null) {
      if (widget.count! > widget.maxCount!) {
        return Text("${widget.maxCount}+");
      }
      return Text("${widget.count}");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: label,
      isLabelVisible: widget.visible ?? true,
      textStyle: widget.textStyle,
      backgroundColor: widget.backgroundColor,
      offset: widget.offset,
      alignment: widget.alignment,
      child: widget.child,
    );
  }
}

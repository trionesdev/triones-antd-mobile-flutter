import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';
import '../theme/theme.dart';

class AntActionSheetItemStruct {
  AntActionSheetItemStruct({this.labelText, this.label, this.onPressed});

  /// @description 标签文本
  /// @default null
  final String? labelText;
  /// @description 标签Widget
  /// @default null
  final Widget? label;
  /// @description 点击事件
  /// @default null
  final Function? onPressed;
}

/// @component ActionSheet 动作面板
class AntActionSheet {
  static void show({
    /// @description 上下文
    /// @default null
    required BuildContext context,
    /// @description 是否点击遮罩关闭
    /// @default false
    bool? closeOnMaskClick = false,
    /// @description 标题
    /// @default null
    Widget? title,
    /// @description 标题文本
    /// @default null
    String? titleText,
    /// @description 动作列表
    /// @default null
    List<AntActionSheetItemStruct>? actions,
    /// @description 是否显示取消按钮
    /// @default true
    bool? showCancelButton = true,
    /// @description 取消按钮
    /// @default null
    Widget? cancel,
    StateStyle? itemStyle,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(),
      builder: (context) {
        return AntActionSheetView(
          title: title,
          titleText: titleText,
          actions: actions,
          showCancelButton: showCancelButton,
          cancel: cancel,
          itemStyle: itemStyle,
        );
      },
    );
  }
}

class AntActionSheetView extends StatefulWidget {
  const AntActionSheetView({
    super.key,
    this.showCancelButton = true,
    this.itemStyle,
    this.actions,
    this.cancel,
    this.title,
    this.titleText,
    this.decoration,
  });

  /// @description 动作列表
  /// @default null
  final List<AntActionSheetItemStruct>? actions;
  /// @description 是否显示取消按钮
  /// @default true
  final bool? showCancelButton;
  /// @description 标题文本
  /// @default null
  final String? titleText;
  /// @description 标题
  /// @default null
  final Widget? title;
  /// @description 取消按钮
  /// @default null
  final Widget? cancel;
  /// @description 动作样式
  /// @default null
  final StateStyle? itemStyle;
  /// @description 容器样式
  /// @default null
  final BoxDecoration? decoration;

  @override
  State<StatefulWidget> createState() => _AntActionSheetViewState();
}

class _AntActionSheetViewState extends State<AntActionSheetView>
    with MaterialStateMixin {
  @override
  void dispose() {
    super.dispose();
    materialStates.clear();
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntActionSheetViewStyle(context: context);

    List<ActionItem> items = [];
    if (widget.actions != null) {
      for (int i = 0; i < widget.actions!.length; i++) {
        items.add(
          ActionItem(
            label: widget.actions!.elementAt(i).label,
            labelText: widget.actions!.elementAt(i).labelText,
            onPressed: widget.actions!.elementAt(i).onPressed,
            style: widget.itemStyle,
            splitLine:
                (widget.actions!.length > 1 && i < widget.actions!.length - 1),
          ),
        );
      }
    }

    return SafeArea(
      bottom: true,
      child: ClipRRect(
        borderRadius:
            stateStyle.resolve(materialStates)?.computedBorderRadius ??
            BorderRadius.zero,
        child: Container(
          decoration:
              widget.decoration ??
              stateStyle.resolve(materialStates)?.decoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 2,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.title != null || widget.titleText != null)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: widget.title ?? Text(widget.titleText ?? ""),
                    ),
                  ...items,
                ],
              ),
              if (widget.showCancelButton == true)
                ActionItem(
                  label: widget.cancel ?? Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AntActionSheetViewStyle extends StateStyle {
  final BuildContext context;

  _AntActionSheetViewStyle({required this.context});

  @override
  Style get style {
    AntThemeData theme = AntTheme.of(context);
    return Style(
      backgroundColor: Colors.white70,
      borderTopLeftRadius: theme.borderRadius,
      borderTopRightRadius: theme.borderRadius,
    );
  }
}

class ActionItem extends StatefulWidget {
  const ActionItem({
    super.key,
    this.label,
    this.onPressed,
    this.style,
    this.splitLine,
    this.labelText,
  });

  final Widget? label;
  final String? labelText;
  final Function? onPressed;
  final StateStyle? style;
  final bool? splitLine;

  @override
  State<StatefulWidget> createState() => _ActionItemState();
}

class _ActionItemState extends State<ActionItem> with MaterialStateMixin {
  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntActionItemStyle(
      context: context,
      actionItem: widget,
    );
    stateStyle = stateStyle.merge(widget.style);

    return GestureDetector(
      onTap: () {
        widget.onPressed?.call();
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            materialStates.add(WidgetState.hovered);
          });
        },
        onExit: (event) {
          setState(() {
            materialStates.remove(WidgetState.hovered);
          });
        },
        onHover: (event) {
          setState(() {
            materialStates.add(WidgetState.hovered);
          });
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: stateStyle.resolve(materialStates)?.decoration,
          padding: stateStyle.resolve(materialStates)?.computedPadding,
          child: widget.label ?? Text(widget.labelText ?? ""),
        ),
      ),
    );
  }
}

class _AntActionItemStyle extends StateStyle {
  final BuildContext context;
  final ActionItem actionItem;

  _AntActionItemStyle({required this.context, required this.actionItem});

  @override
  Style get style => Style(
    padding: StylePadding.all(12),
    backgroundColor: Colors.white,
    borderBottom:
        actionItem.splitLine == true
            ? StyleBorder(
              color: Colors.grey.shade300,
              width: 1,
              style: BorderStyle.solid,
            )
            : null,
  );

  @override
  Style get hovered => Style(backgroundColor: Colors.white70);
}

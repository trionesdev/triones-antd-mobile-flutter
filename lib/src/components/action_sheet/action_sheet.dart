import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';
import '../theme/theme.dart';

class AntActionSheetItemRecord {
  AntActionSheetItemRecord({this.labelText, this.label, this.onPressed});

  final String? labelText;
  final Widget? label;
  final Function? onPressed;
}

class AntActionSheet {
  static void show(
      {required BuildContext context,
      bool? closeOnMaskClick = false,
      Widget? title,
      String? titleText,
      List<AntActionSheetItemRecord>? actions,
      bool? showCancelButton = true,
      Widget? cancelWidget,
      StateStyle? itemStyle}) {
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
            cancelWidget: cancelWidget,
            itemStyle: itemStyle,
          );
        });
  }
}

class AntActionSheetView extends StatefulWidget {
  const AntActionSheetView(
      {super.key,
      this.showCancelButton = true,
      this.itemStyle,
      this.actions,
      this.cancelWidget,
      this.title,
      this.titleText,
      this.decoration});

  final List<AntActionSheetItemRecord>? actions;
  final bool? showCancelButton;
  final String? titleText;
  final Widget? title;
  final Widget? cancelWidget;
  final StateStyle? itemStyle;
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
        items.add(ActionItem(
          label: widget.actions!.elementAt(i).label,
          labelText: widget.actions!.elementAt(i).labelText,
          onPressed: widget.actions!.elementAt(i).onPressed,
          style: widget.itemStyle,
          splitLine:
              (widget.actions!.length > 1 && i < widget.actions!.length - 1),
        ));
      }
    }

    return ClipRRect(
      borderRadius: stateStyle.resolve(materialStates)?.computedBorderRadius ??
          BorderRadius.zero,
      child: Container(
        decoration:
            widget.decoration ?? stateStyle.resolve(materialStates)?.decoration,
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
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: widget.title ?? Text(widget.titleText ?? ""),
                  ),
                ...items
              ],
            ),
            if (widget.showCancelButton == true)
              ActionItem(
                label: widget.cancelWidget ?? Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
          ],
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
        borderTopRightRadius: theme.borderRadius);
  }
}

class ActionItem extends StatefulWidget {
  const ActionItem(
      {super.key,
      this.label,
      this.onPressed,
      this.style,
      this.splitLine,
      this.labelText});

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
      borderBottom: actionItem.splitLine == true
          ? StyleBorder(
              color: Colors.grey.shade300, width: 1, style: BorderStyle.solid)
          : null);

  @override
  Style get hovered => Style(backgroundColor: Colors.white70);
}

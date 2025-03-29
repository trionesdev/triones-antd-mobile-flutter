import 'package:flutter/material.dart';

import '../../../antd.dart';
import '../theme/theme.dart';

class AntActionType {
  AntActionType({this.label, this.onPressed});

  final Widget? label;
  final Function? onPressed;
}

class AntActionsSheet {
  static void show(
      {required BuildContext context,
      bool? closeOnMaskClick = false,
      Widget? title,
      List<AntActionType>? actions,
      bool? showCancelButton = true,
      StateStyle? itemStyle}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(),
        builder: (context) {
          return AntActionsSheetView(
            title: title,
            actions: actions,
            showCancelButton: showCancelButton,
            itemStyle: itemStyle,
          );
        });
  }
}

class AntActionsSheetView extends StatefulWidget {
  const AntActionsSheetView(
      {super.key,
      this.showCancelButton = true,
      this.itemStyle,
      this.actions,
      this.cancelLabel,
      this.title,
      this.decoration});

  final List<AntActionType>? actions;
  final bool? showCancelButton;
  final Widget? title;
  final Widget? cancelLabel;
  final StateStyle? itemStyle;
  final BoxDecoration? decoration;

  @override
  State<StatefulWidget> createState() => _AntActionsSheetViewState();
}

class _AntActionsSheetViewState extends State<AntActionsSheetView>
    with MaterialStateMixin {
  @override
  void dispose() {
    super.dispose();
    materialStates.clear();
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntActionsSheetViewStyle(context: context);

    List<ActionItem> items = [];
    if (widget.actions != null) {
      for (int i = 0; i < widget.actions!.length; i++) {
        items.add(ActionItem(
          label: widget.actions!.elementAt(i).label,
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
                if (widget.title != null)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade300, width: 1),
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: widget.title,
                  ),
                ...items
              ],
            ),
            if (widget.showCancelButton == true)
              ActionItem(
                label: widget.cancelLabel ?? Text('取消'),
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

class _AntActionsSheetViewStyle extends StateStyle {
  final BuildContext context;

  _AntActionsSheetViewStyle({required this.context});

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
      {super.key, this.label, this.onPressed, this.style, this.splitLine});

  final Widget? label;
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
          child: widget.label,
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

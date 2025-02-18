import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef OnBack = void Function(BuildContext context);

class AntAppBar extends StatefulWidget implements PreferredSizeWidget {
  AntAppBar(
      {super.key,
      this.title,
      this.back = true,
      this.backIcon,
      this.onBack,
      this.left,
      this.right,
      this.decoration,
      this.bottom,
      this.child,
      this.childHeight = 0,
      this.bottomHeight = 0,
      this.toolbarHeight})
      : preferredSize =
            _PreferredAppBarSize(toolbarHeight, childHeight, bottomHeight);

  final Widget? title;
  final bool? back;
  final Widget? backIcon;
  final OnBack? onBack;
  final List<Widget>? left;
  final List<Widget>? right;
  final BoxDecoration? decoration;
  final Widget? child;
  final double? childHeight;
  final Widget? bottom;
  final double? bottomHeight;
  final double? toolbarHeight;

  @override
  State<StatefulWidget> createState() => _AntAppBarState();

  @override
  final Size preferredSize;
}

class _AntAppBarState extends State<AntAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    List<Widget> toolbarWidgets = [
      Center(
        child: widget.title,
      ),
    ];
    if ((widget.left != null && widget.left!.isNotEmpty) ||
        widget.back == true) {
      List<Widget> leftWidgets = [];
      if (widget.back == true) {
        leftWidgets.add(IconButton(
          icon: widget.backIcon ?? Icon(Icons.arrow_back),
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!(context);
            } else {
              Navigator.of(context).pop();
            }
          },
        ));
      }
      if (leftWidgets.isNotEmpty) {
        toolbarWidgets.add(Positioned(
          left: 0,
          child: Row(
            children: leftWidgets,
          ),
        ));
      }
    }
    if (widget.right != null && widget.right!.isNotEmpty) {
      toolbarWidgets.add(Positioned(
        right: 0,
        child: Row(
          children: widget.right!,
        ),
      ));
    }

    if (toolbarWidgets.isNotEmpty) {
      widgets.add(SizedBox(
        height: widget.toolbarHeight ?? kToolbarHeight,
        child: Stack(alignment: Alignment.center, children: toolbarWidgets),
      ));
    }
    if (widget.child != null) {
      widgets.add(widget.child!);
    }

    return Container(
      decoration: widget.decoration,
      height: widget.preferredSize.height,
      child: Column(
        children: widgets,
      ),
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.childHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) +
            (childHeight ?? 0) +
            (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? childHeight;
  final double? bottomHeight;
}

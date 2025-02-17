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
      this.right, this.decoration, this.bottom})
      : preferredSize = _PreferredAppBarSize(null, bottom?.preferredSize.height);

  final Widget? title;
  final bool? back;
  final Widget? backIcon;
  final OnBack? onBack;
  final List<Widget>? left;
  final List<Widget>? right;
  final BoxDecoration? decoration;
  final PreferredSizeWidget? bottom;

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
    List<Widget> widgets = [
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
        widgets.add(Positioned(
          left: 0,
          // top: 0,
          child: Row(
            children: leftWidgets,
          ),
        ));
      }
    }
    if (widget.right != null && widget.right!.isNotEmpty) {
      widgets.add(Positioned(
        right: 0,
        // top: 0,
        child: Row(
          children: widget.right!,
        ),
      ));
    }
    return Container(
      decoration: widget.decoration,
      height: widget.preferredSize.height,
      child: Stack(alignment: Alignment.center, children: widgets),
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

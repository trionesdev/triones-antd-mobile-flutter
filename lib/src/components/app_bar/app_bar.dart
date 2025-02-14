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
      this.right})
      : preferredSize = _PreferredAppBarSize(50, 50);

  final Widget? title;
  final bool? back;
  final Widget? backIcon;
  final OnBack? onBack;
  final List<Widget>? left;
  final List<Widget>? right;

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



    return Container(
      height: widget.preferredSize.height,
      child: Stack(alignment: Alignment.center, children: [
        Center(
          child: widget.title,
        ),
        Positioned(
          left: 0,
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('menu');
            },
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search');
            },
          ),
        ),
      ]),
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(60);

  final double? toolbarHeight;
  final double? bottomHeight;
}

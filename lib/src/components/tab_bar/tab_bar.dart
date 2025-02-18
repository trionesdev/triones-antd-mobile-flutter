import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AntTabBar extends StatefulWidget {
  const AntTabBar({super.key, this.padding, this.height = 54, this.children});

  final double? height;
  final EdgeInsetsGeometry? padding;
  final List<AntTabBarItem>? children;

  @override
  State<StatefulWidget> createState() => _AntTabBarState();
}

class _AntTabBarState extends State<AntTabBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: widget.height!,
      padding: widget.padding ?? EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children ?? [],
      ),
    );
  }
}

typedef TabBarItemTapCallback = void Function(int index);

class AntTabBarItem extends StatefulWidget {
  const AntTabBarItem(
      {super.key, this.child, this.icon, this.label, this.onTap});

  final Widget? child;
  final IconData? icon;
  final String? label;
  final GestureTapCallback? onTap;
  final Color color = Colors.black;
  final Color activeColor = Colors.black;

  @override
  State<StatefulWidget> createState() => _AntTabBarItemState();
}

class _AntTabBarItemState extends State<AntTabBarItem> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (widget.icon != null) {
      children.add(Icon(
        widget.icon! as IconData?,
        color: widget.color,
      ));
    }
    if (widget.label != null) {
      children.add(Text(
        widget.label ?? '',
        style: TextStyle(fontSize: 10, color: widget.color),
      ));
    }

    return Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            widget.onTap?.call();
          },
          child: widget.child ??
              Column(
                children: children,
              ),
        ));
  }
}

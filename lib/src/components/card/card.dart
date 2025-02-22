import 'package:flutter/cupertino.dart';

class AntCard extends StatefulWidget {
  const AntCard(
      {super.key,
      this.title,
      this.child,
      this.decoration,
      this.titleDecoration,
      this.childDecoration});

  final Widget? title;
  final Widget? child;
  final BoxDecoration? decoration;
  final BoxDecoration? titleDecoration;
  final BoxDecoration? childDecoration;

  @override
  State<StatefulWidget> createState() => _AntCardState();
}

class _AntCardState extends State<AntCard> {

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (widget.title != null) {
      children.add(Container(
        decoration: widget.titleDecoration ,
        padding: EdgeInsets.all(8),
        child: widget.title!,
      ));
    }
    if (widget.child != null) {
      children.add(Container(
        decoration: widget.childDecoration,
        padding: EdgeInsets.all(8),
        child: widget.child!,
      ));
    }
    return Container(
      decoration: widget.decoration ?? BoxDecoration(color: Color(0xffffffff)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

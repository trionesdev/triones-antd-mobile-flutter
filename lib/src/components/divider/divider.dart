import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum DividerDirection { horizontal, vertical }

enum ContentPosition { left, right, center }

class AntDivider extends StatefulWidget {
  const AntDivider(
      {super.key,
      this.direction = DividerDirection.horizontal,
      this.child,
      this.contentPosition = ContentPosition.center});

  final DividerDirection? direction;
  final ContentPosition? contentPosition;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _AntDividerState();
}



class _AntDividerState extends State<AntDivider> {

  int leftFlex(){
    switch (widget.contentPosition) {
      case ContentPosition.left:
        return 1;
      case ContentPosition.right:
        return 3;
      case ContentPosition.center:
        return 2;
      default:
        return 1;
    }
  }

  int rightFlex(){
    switch (widget.contentPosition) {
      case ContentPosition.left:
        return 3;
      case ContentPosition.right:
        return 1;
      case ContentPosition.center:
        return 2;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.direction == DividerDirection.horizontal
        ? (widget.child == null)
            ? Divider(
                thickness: 1,
              )
            : Row(
                children: [
                  Expanded(
                    flex: leftFlex(),
                      child: Container(

                    child: Divider(
                      thickness: 1,
                      endIndent: 16,
                    ),
                  )),
                  widget.child!,
                  Expanded(
                      flex: rightFlex(),
                      child: Container(

                    child: Divider(
                      thickness: 1,
                      indent: 16,
                    ),
                  )),
                ],
              )
        : VerticalDivider(
            thickness: 2,
      color: Colors.black,
          );
  }
}

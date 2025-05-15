import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

typedef OnClose = void Function();


class AntModalView extends StatefulWidget {
  const AntModalView(
      {super.key,
      this.style,
      this.confirm,
      this.content,
      this.header,
      this.actions,
      this.showCloseButton,
      this.title,
      this.onClose, this.closeOnAction});

  final String? title;
  final Widget? header;
  final Widget? content;
  final StateStyle? style;
  final bool? confirm;
  final bool? showCloseButton;
  final List<Widget>? actions;
  final OnClose? onClose;
  final bool? closeOnAction;

  @override
  State<StatefulWidget> createState() => _AntModalViewState();
}

class _AntModalViewState extends State<AntModalView> with MaterialStateMixin {
  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntModalViewStyle();
    stateStyle = stateStyle.merge(widget.style);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            decoration: stateStyle.resolve(materialStates)?.decoration,
            padding: stateStyle.resolve(materialStates)?.computedPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                if (widget.title != null)
                  Text(
                    widget.title!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                if (widget.header != null) widget.header!,
                if (widget.content != null) widget.content!,
                if (widget.actions != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: widget.actions!.map((action) {
                      return GestureDetector(
                        onTap: () {
                          print("sss");
                          if (widget.closeOnAction == true) {
                            Navigator.of(context).pop();
                            widget.onClose?.call();
                          }
                        },
                        child: action,
                      );
                    }).toList(),
                  )
              ],
            ),
          ),
          if (widget.showCloseButton == true)
            Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    widget.onClose?.call();
                  },
                  child: Icon(
                    Icons.close,
                    color: Color(0xff9D9D9D),
                  ),
                ))
        ],
      ),
    );
  }
}

class _AntModalViewStyle extends StateStyle {
  @override
  Style get style {
    return Style(
        backgroundColor: Colors.white,
        borderRadius: 6,
        padding: StylePadding(top: 16, bottom: 8, left: 16, right: 8));
  }
}

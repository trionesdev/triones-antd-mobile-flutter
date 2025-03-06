import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

enum ToastPosition { top, bottom, center }

class AntToastView extends StatefulWidget {
  const AntToastView(
      {super.key,
      this.style,
      this.content,
      this.icon,
      this.position = ToastPosition.center});

  final StateStyle? style;
  final Icon? icon;
  final Widget? content;
  final ToastPosition? position;

  @override
  State<StatefulWidget> createState() => _AntToastViewState();
}

class _AntToastViewState extends State<AntToastView> with MaterialStateMixin {
  Widget? content() {
    if (widget.content is Text) {
      Text content = widget.content as Text;
      return Text(content.data!,
          style: TextStyle(color: Colors.white).merge(content.style));
    } else {
      return widget.content;
    }
  }

  EdgeInsetsGeometry? padding() {
    if (widget.icon != null) {
      return EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 32);
    }
    return null;
  }

  Alignment alignment() {
    if (widget.position == ToastPosition.top) {
      return Alignment(0.0, -0.8);
    } else if (widget.position == ToastPosition.bottom) {
      return Alignment(0.0, 0.8);
    } else {
      return Alignment.center;
    }
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntToastStyle();
    stateStyle = stateStyle.merge(widget.style);

    return Ant(
      color: Colors.transparent,
      child: Align(
        alignment: alignment(),
        child: Container(
          decoration: stateStyle.resolve(materialStates)?.decoration,
          padding:
              padding() ?? stateStyle.resolve(materialStates)?.computedPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon!.icon,
                  color: widget.icon!.color ?? Colors.white,
                  size: widget.icon!.size ?? 36,
                ),
              if (widget.content != null) content()!
            ],
          ),
        ),
      ),
    );
  }
}

class _AntToastStyle extends StateStyle {
  @override
  Style get style {
    return Style(
        borderRadius: 6,
        backgroundColor: Color(0xCC2B2B2B),
        padding: StylePadding.all(16));
  }
}

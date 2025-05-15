import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntTextArea extends StatefulWidget {
  const AntTextArea({
    super.key,
    this.placeholder,
    this.minLines=2,
    this.maxLines,
    this.value,
    this.onChange,
    this.decoration,
    this.style,
    this.onBlur,
    this.onFocus,
  });

  final int? minLines;
  final int? maxLines;
  final String? placeholder;
  final String? value;
  final Function? onChange;
  final BoxDecoration? decoration;
  final StateStyle? style;
  final Function? onBlur;
  final Function? onFocus;

  @override
  State<StatefulWidget> createState() => _AntTextAreaState();
}

class _AntTextAreaState extends State<AntTextArea> with MaterialStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool passwordVisible = true;

  @override
  void didUpdateWidget(AntTextArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value != _controller.text) {
        _controller.text = widget.value ?? '';
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value ?? "";
    _focusNode.addListener(() {
      setMaterialState(WidgetState.focused, _focusNode.hasFocus);
      if (_focusNode.hasFocus) {
        widget.onFocus?.call();
      } else {
        widget.onBlur?.call();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StateStyle style = _AntTextAreaStyle();
    style = style.merge(widget.style);

    return Container(
      decoration:
          widget.decoration ?? style.resolve(materialStates)?.decoration,
      // height: widget.height,
      padding: style.resolve(materialStates)?.computedPadding,
      child: TextField(
        minLines: widget.minLines,
        maxLines: widget.maxLines  ,
        controller: _controller,
        focusNode: _focusNode,
        cursorColor: Colors.black,
        style: TextStyle(fontSize: style.resolve(materialStates)?.fontSize),
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: TextStyle(color: Colors.grey),
          // 提示文本
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          print("input changed:" + value);
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        onEditingComplete: () {
          print("input c:" + _controller.text);
        },
      ),
    );
  }
}

class _AntTextAreaStyle extends StateStyle {
  const _AntTextAreaStyle();

  @override
  Style get style {
    return Style(
      fontSize: 14,
      borderRadius: 6,
      padding: StylePadding(left: 0, right: 0, top: 0, bottom: 0),
    );
  }
}

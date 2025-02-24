import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AntSearchBarStyles {
  const AntSearchBarStyles({
    this.input,
  });

  final StateStyle? input;
}

class AntSearchBar extends StatefulWidget {
  const AntSearchBar(
      {super.key,
      this.style,
      this.decoration,
      this.searchIcon,
      this.showCancelButton = true,
      this.placeholder,
      this.value,
      this.onChange,
      this.styles,
      this.height = 36});

  final StateStyle? style;
  final BoxDecoration? decoration;
  final Widget? searchIcon;
  final bool? showCancelButton;
  final String? placeholder;
  final String? value;
  final Function? onChange;
  final AntSearchBarStyles? styles;
  final double? height;

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<AntSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StateStyle style = _SearchBarStyle();
    style = style.merge(widget.style);
    return Container(
      decoration:
          widget.decoration ?? style.resolve(const <WidgetState>{})?.decoration,
      padding: style.resolve(const <WidgetState>{})?.computedPadding,
      height: widget.height,
      child: Row(children: [
        Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ClipRRect(
                      borderRadius: style.resolve(const <WidgetState>{})!.computedBorderRadius,
                      child: AntInput(
                        value: widget.value,
                        onChange: widget.onChange,
                        placeholder: widget.placeholder,
                        prefix: widget.searchIcon ??
                            Icon(Icons.search, color: Color(0xffD5D5D5), size: 20),
                        // height: 24,
                        style: _SearchBarStyle().inputStyle.merge(widget.styles?.input),
                      ),
                    )),
              ],
            ))
      ]),
    );
  }
}

class _SearchBarStyle extends StateStyle {
  const _SearchBarStyle();

  @override
  Style get style {
    return Style(
      // padding: StylePadding(left: 8, right: 8, top: 8, bottom: 8),
      border: StyleBorder(
          color: Color(0xffD5D5D5), width: 1, style: BorderStyle.solid),
      borderRadius: 6,
    );
  }

  StateStyle get inputStyle {
    return StateStyle(
        style: Style(
      backgroundColor: Color(0xffF5F5F5),
      padding: StylePadding(left: 0, right: 0, top: 0, bottom: 0),
          // borderRadius: 6
    ));
  }
}

import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntCardStyles {
  StateStyle? header;
  StateStyle? body;
  StateStyle? footer;
}

class AntCard extends StatefulWidget {
  const AntCard({
    super.key,
    this.title,
    this.titleStyle,
    this.titleWidget,
    this.extra,
    this.extraStyle,
    this.extraWidget,
    this.child,
    this.footerWidget,
    this.decoration,
    this.headerDecoration,
    this.bodyDecoration,
    this.footerDecoration,
    this.style,
    this.styles,
  });

  final String? title;
  final TextStyle? titleStyle;
  final Widget? titleWidget;
  final String? extra;
  final TextStyle? extraStyle;
  final Widget? extraWidget;
  final Widget? child;
  final Widget? footerWidget;
  final BoxDecoration? decoration;
  final BoxDecoration? headerDecoration;
  final BoxDecoration? bodyDecoration;
  final BoxDecoration? footerDecoration;
  final StateStyle? style;
  final AntCardStyles? styles;

  @override
  State<StatefulWidget> createState() => _AntCardState();
}

class _AntCardState extends State<AntCard> with MaterialStateMixin {
  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntCardStyle();
    stateStyle = stateStyle.merge(widget.style);

    StateStyle headerStateStyle = _AntCardHeaderStyle(context);
    headerStateStyle = headerStateStyle.merge(widget.styles?.header);

    StateStyle bodyStateStyle = _AntCardBodyStyle(context);
    bodyStateStyle = bodyStateStyle.merge(widget.styles?.body);

    StateStyle footerStateStyle = _AntCardFooterStyle(context);
    footerStateStyle = footerStateStyle.merge(widget.styles?.footer);

    List<Widget> children = [];
    if (widget.titleWidget != null || widget.title != null ||
        widget.extraWidget != null || widget.extra != null) {
      children.add(
        Container(
          decoration:
          widget.headerDecoration ??
              headerStateStyle
                  .resolve(materialStates)
                  ?.decoration,
          padding: headerStateStyle
              .resolve(materialStates)
              ?.computedPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.titleWidget ??
                  Text(widget.title ?? "", style: widget.titleStyle),
              widget.extraWidget ??
                  Text(widget.extra ?? "", style: widget.extraStyle),
            ],
          ),
        ),
      );
    }
    if (widget.child != null) {
      children.add(
        Container(
          decoration:
          widget.bodyDecoration ??
              bodyStateStyle
                  .resolve(materialStates)
                  ?.decoration,
          padding: bodyStateStyle
              .resolve(materialStates)
              ?.computedPadding,
          child: widget.child!,
        ),
      );
    }
    if (widget.footerWidget != null) {
      children.add(
        Container(
          decoration:
          widget.footerDecoration ??
              footerStateStyle
                  .resolve(materialStates)
                  ?.decoration,
          padding: footerStateStyle
              .resolve(materialStates)
              ?.computedPadding,
          child: widget.footerWidget,
        ),
      );
    }
    return Container(
      decoration:
      widget.decoration ?? stateStyle
          .resolve(materialStates)
          ?.decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _AntCardStyle extends StateStyle {
  @override
  Style get style {
    return Style(backgroundColor: Color(0xffffffff));
  }
}

class _AntCardHeaderStyle extends StateStyle {
  _AntCardHeaderStyle(this.context);

  final BuildContext context;

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    return Style(
      borderBottom: StyleBorder(
        color: themeData.colorBorder,
        width: 1,
        style: BorderStyle.solid,
      ),
      padding: StylePadding.symmetric(horizontal: 12, vertical: 12),
    );
  }
}

class _AntCardBodyStyle extends StateStyle {
  _AntCardBodyStyle(this.context);

  final BuildContext context;

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    return Style(
      backgroundColor: Colors.white,
      padding: StylePadding.symmetric(horizontal: 8, vertical: 8),
    );
  }
}

class _AntCardFooterStyle extends StateStyle {
  _AntCardFooterStyle(this.context);

  final BuildContext context;

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    return Style(
      borderTop: StyleBorder(
        color: themeData.colorBorder,
        width: 1,
        style: BorderStyle.solid,
      ),
      padding: StylePadding.symmetric(horizontal: 12, vertical: 8),
    );
  }
}

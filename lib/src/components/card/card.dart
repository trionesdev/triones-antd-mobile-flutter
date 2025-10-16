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
    this.extra,
    this.child,
    this.footer,
    this.decoration,
    this.headerDecoration,
    this.bodyDecoration,
    this.footerDecoration,
    this.style,
    this.styles,
  });

  final Widget? title;
  final Widget? extra;
  final Widget? child;
  final Widget? footer;
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
    if (widget.title != null || widget.extra != null) {
      children.add(
        Container(
          decoration:
              widget.headerDecoration ??
              headerStateStyle.resolve(materialStates)?.decoration,
          padding: headerStateStyle.resolve(materialStates)?.computedPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.title ?? Container(),
              widget.extra ?? Container(),
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
              bodyStateStyle.resolve(materialStates)?.decoration,
          padding: bodyStateStyle.resolve(materialStates)?.computedPadding,
          child: widget.child!,
        ),
      );
    }
    if (widget.footer != null) {
      children.add(
        Container(
          decoration:
              widget.footerDecoration ??
              footerStateStyle.resolve(materialStates)?.decoration,
          padding: footerStateStyle.resolve(materialStates)?.computedPadding,
          child: widget.footer!,
        ),
      );
    }
    return Container(
      decoration:
          widget.decoration ?? stateStyle.resolve(materialStates)?.decoration,
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
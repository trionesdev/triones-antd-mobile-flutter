import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntCardStyles {
  StateStyle? header;
  StateStyle? body;
  StateStyle? footer;
}

/// @component AntCard 卡片
class AntCard extends StatefulWidget {
  const AntCard({
    super.key,
    this.title,
    this.titleStyle,
    this.titleText,
    this.extra,
    this.extraStyle,
    this.extraText,
    this.child,
    this.footer,
    this.decoration,
    this.headerDecoration,
    this.bodyDecoration,
    this.footerDecoration,
    this.style,
    this.styles,
  });

  /// @description 标题样式
  /// @default null
  final TextStyle? titleStyle;

  /// @description 标题
  /// @default null
  final Widget? title;

  /// @description 标题文字
  /// @default null
  final String? titleText;

  /// @description 额外信息样式
  /// @default null
  final TextStyle? extraStyle;

  /// @description 额外信息
  /// @default null
  final Widget? extra;

  /// @description 额外信息文字
  /// @default null
  final String? extraText;

  /// @description 内容
  /// @default null
  final Widget? child;

  /// @description 底部
  /// @default null
  final Widget? footer;

  /// @description 卡片样式
  /// @default null
  final BoxDecoration? decoration;

  /// @description 卡片头部样式
  /// @default null
  final BoxDecoration? headerDecoration;

  /// @description 卡片内容样式
  /// @default null
  final BoxDecoration? bodyDecoration;

  /// @description 卡片底部样式
  /// @default null
  final BoxDecoration? footerDecoration;

  /// @description 卡片样式
  /// @default null
  final StateStyle? style;

  /// @description 卡片样式
  /// @default null
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
    if (widget.title != null ||
        widget.titleText != null ||
        widget.extra != null ||
        widget.extraText != null) {
      children.add(
        Container(
          decoration:
              widget.headerDecoration ??
              headerStateStyle.resolve(materialStates)?.decoration,
          padding: headerStateStyle.resolve(materialStates)?.computedPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.title ??
                  Text(widget.titleText ?? "", style: widget.titleStyle),
              widget.extra ??
                  Text(widget.extraText ?? "", style: widget.extraStyle),
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
          child: widget.footer,
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

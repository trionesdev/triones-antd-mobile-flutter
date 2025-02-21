import 'package:flutter/widgets.dart';

import 'style.dart';

abstract class  StateStyle extends Style {
  const StateStyle(
      {super.height,
      super.width,
      super.color,
      super.fontSize,
      //background
      super.backgroundColor,
      super.backgroundImage,
      //padding
      super.padding,
      super.paddingTop,
      super.paddingBottom,
      super.paddingLeft,
      super.paddingRight,
      //border
      super.border,
      super.borderColor,
      super.borderWidth,
      super.borderStyle,
      super.borderRadius,
      //border bottom
      super.borderBottom,
      super.borderBottomColor,
      super.borderBottomWidth,
      super.borderBottomStyle,
      super.borderBottomLeftRadius,
      super.borderBottomRightRadius,
      //border top
      super.borderTop,
      super.borderTopColor,
      super.borderTopWidth,
      super.borderTopStyle,
      super.borderTopLeftRadius,
      super.borderTopRightRadius,
      //border left
      super.borderLeft,
      super.borderLeftColor,
      super.borderLeftWidth,
      super.borderRightColor,
      super.borderRightWidth,
//state
      this.hovered,
      this.focused,
      this.pressed,
      this.dragged,
      this.selected,
      this.scrolledUnder,
      this.disabled,
      this.error});

  final Style? hovered;
  final Style? focused;
  final Style? pressed;
  final Style? dragged;
  final Style? selected;
  final Style? scrolledUnder;
  final Style? disabled;
  final Style? error;

  Style? resolve(Set<WidgetState> states) {
    return WidgetStateProperty.resolveWith((states) {
      Style? style = this;
      if (states.contains(WidgetState.hovered)) {
        style = style.merge(hovered);
      }
      if (states.contains(WidgetState.focused)) {
        style = style.merge(focused);
      }
      if (states.contains(WidgetState.pressed)) {
        style = style.merge(pressed);
      }
      if (states.contains(WidgetState.dragged)) {
        style = style.merge(dragged);
      }
      return style;
    }).resolve(states);
  }
}

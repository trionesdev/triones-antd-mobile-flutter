import 'package:flutter/widgets.dart';

import 'style.dart';

class StateStyle {
  const StateStyle(
      {
//state
      this.style ,
      this.hovered,
      this.focused,
      this.pressed,
      this.dragged,
      this.selected,
      this.scrolledUnder,
      this.disabled,
      this.error});

  final Style? style;
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
      Style? style = this.style ?? Style();
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

  StateStyle merge(StateStyle? source) {
    if (source == null) {
      return this;
    }
    return StateStyle(
        style: (style ?? Style()).merge(source.style));
  }
}

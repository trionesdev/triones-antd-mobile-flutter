import 'package:flutter/material.dart';

class WidgetUtils {
  static List<Widget> join(List<Widget> widgets, Widget separator) {
    List<Widget> result = [];
    for (int i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      if (i < widgets.length - 1) {
        result.add(separator);
      }
    }
    return result;
  }

  static Text textMerge(Text target, Text source) {
    return Text(source.data ?? target.data ?? "",
        style: target.style?.merge(source.style),
        textAlign: source.textAlign ?? target.textAlign,
        softWrap: source.softWrap ?? target.softWrap,
        maxLines: source.maxLines ?? target.maxLines,
        textWidthBasis: source.textWidthBasis ?? target.textWidthBasis,
        textHeightBehavior:
            source.textHeightBehavior ?? target.textHeightBehavior);
  }

  static Icon iconMerge(Icon target, Icon source) {
    return Icon(
      source.icon ?? target.icon,
      size: source.size ?? target.size,
      fill: source.fill ?? target.fill,
      weight: source.weight ?? target.weight,
      grade: source.grade ?? target.grade,
      opticalSize: source.opticalSize ?? target.opticalSize,
      color: source.color ?? target.color,
      shadows: source.shadows ?? target.shadows,
      semanticLabel: source.semanticLabel ?? target.semanticLabel,
      textDirection: source.textDirection ?? target.textDirection,
      applyTextScaling: source.applyTextScaling ?? target.applyTextScaling,
      blendMode: source.blendMode ?? target.blendMode,
    );
  }
}

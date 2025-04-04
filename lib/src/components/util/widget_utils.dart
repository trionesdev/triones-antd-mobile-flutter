import 'package:flutter/material.dart';

class WidgetUtils {
  static Text textMerge(Text target, Text source) {
    return Text(source.data ?? target.data ?? "",
        style: source.style?.merge(target.style),
        textAlign: source.textAlign ?? target.textAlign,
        softWrap: source.softWrap ?? target.softWrap,
        maxLines: source.maxLines ?? target.maxLines,
        textWidthBasis: source.textWidthBasis ?? target.textWidthBasis,
        textHeightBehavior:
            source.textHeightBehavior ?? target.textHeightBehavior);
  }
}

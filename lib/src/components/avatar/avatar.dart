import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

enum AntAvatarShape { circle, square }

class AntAvatar extends StatefulWidget {
  const AntAvatar({
    super.key,
    this.src,
    this.icon,
    this.shape = AntAvatarShape.square,
    this.size = AntSize.middle,
    this.diameter,
    this.style,
    this.decoration,
  });
  /// @description 图片地址
  /// @default null
  final String? src;
  /// @description 图标
  /// @default null
  final Widget? icon;
  /// @description 形状
  /// @default null
  final AntAvatarShape? shape;
  /// @description 大小
  /// @default middle
  final AntSize? size;
  /// @description 直径
  /// @default null
  final double? diameter;
  /// @description 样式
  /// @default null
  final StateStyle? style;
  /// @description 装饰
  /// @default null
  final BoxDecoration? decoration;

  @override
  State<StatefulWidget> createState() => _AvatarState();
}

class _AvatarState extends State<AntAvatar> with MaterialStateMixin {
  double? get height {
    if (widget.diameter != null) {
      return widget.diameter;
    }
    switch (widget.size) {
      case AntSize.large:
        return 48;
      case AntSize.middle:
        return 32;
      case AntSize.small:
        return 24;
      case null:
        return 32;
    }
  }

  double? get width {
    if (widget.diameter != null) {
      return widget.diameter;
    }
    switch (widget.size) {
      case AntSize.large:
        return 48;
      case AntSize.middle:
        return 32;
      case AntSize.small:
        return 24;
      case null:
        return 32;
    }
  }

  Widget _buildAvatar(AntThemeData theme) {
    if (widget.src != null) {
      return Image.network(
        widget.src!,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }
    if (widget.icon != null) {
      return SizedBox(width: width, height: height, child: widget.icon);
    }
    return Container();
  }

  Widget _buildAvatarContainer(StateStyle stateStyle) {
    AntThemeData theme = AntTheme.of(context);
    return Container(
      width: width,
      height: height,
      decoration:
          widget.decoration ?? stateStyle.resolve(materialStates)?.decoration,
      child: _buildAvatar(theme),
    );
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    StateStyle stateStyle = _AvatarStyle(context);
    stateStyle = stateStyle.merge(widget.style);

    return Container(
      child:
          widget.shape == AntAvatarShape.circle
              ? ClipOval(child: _buildAvatarContainer(stateStyle))
              : ClipRRect(
                borderRadius: BorderRadius.circular(theme.borderRadius),
                child: _buildAvatarContainer(stateStyle),
              ),
    );
  }
}

class _AvatarStyle extends StateStyle {
  const _AvatarStyle(this.context);

  final BuildContext context;

  @override
  Style get style {
    AntThemeData theme = AntTheme.of(context);
    return Style(
      backgroundColor: Colors.grey,
      borderRadius: theme.borderRadius,
    );
  }
}

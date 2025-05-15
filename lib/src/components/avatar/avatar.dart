import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

enum AntAvatarShape { circle, square }

class AntAvatar extends StatefulWidget {
  const AntAvatar(
      {super.key,
      this.src,
      this.icon,
      this.shape = AntAvatarShape.square,
      this.size = 32, this.style, this.decoration});

  final String? src;
  final Widget? icon;
  final AntAvatarShape? shape;
  final double? size;
  final StateStyle? style;
  final BoxDecoration? decoration;

  @override
  State<StatefulWidget> createState() => _AvatarState();
}

class _AvatarState extends State<AntAvatar> with MaterialStateMixin{
  Widget _buildAvatar(AntThemeData theme) {
    if (widget.src != null) {
      return Image.network(widget.src!,
          width: widget.size, height: widget.size,fit: BoxFit.cover,);
    }
    if (widget.icon != null) {
      return Container(
        width: widget.size,
        height: widget.size,
        child: widget.icon,
      );
    }
    return Container();
  }

  Widget _buildAvatarContainer(StateStyle stateStyle){
    AntThemeData theme = AntTheme.of(context);
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: widget.decoration ?? stateStyle.resolve(materialStates)?.decoration,
      child: _buildAvatar(theme),
    );
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    StateStyle stateStyle = _AvatarStyle(context);
    stateStyle = stateStyle.merge(widget.style);

    return Container(
      child: widget.shape == AntAvatarShape.circle
          ? ClipOval(
              child: _buildAvatarContainer(stateStyle),
            )
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
  Style get style{
    AntThemeData theme = AntTheme.of(context);
    return Style(
      backgroundColor: Colors.grey,
      borderRadius: theme.borderRadius
    );
  }
}
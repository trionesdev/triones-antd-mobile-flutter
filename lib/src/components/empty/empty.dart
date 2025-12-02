import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// @component AntEmpty 空状态
class AntEmpty extends StatelessWidget {
  const AntEmpty({
    super.key,
    this.image,
    this.description,
    this.descriptionText,
  });

  /// @description 图片
  /// @default null
  final Widget? image;

  /// @description 描述
  /// @default null
  final Text? description;

  /// @description 描述
  /// @default null
  final String? descriptionText;

  Widget? get _description {
    if (description != null) {
      return description;
    }
    if (descriptionText != null) {
      return Text(descriptionText!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            image ??
                SvgPicture.asset(
                  'packages/trionesdev_antd_mobile/assets/images/empty.svg',
                ),
            _description ??
                const Text(
                  '暂无数据',
                  style: TextStyle(fontSize: 14, color: Color(0xff8C8C8C)),
                ),
          ],
        ),
      ),
    );
  }
}

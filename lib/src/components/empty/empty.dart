import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AntEmpty extends StatelessWidget {
  const AntEmpty({super.key, this.image, this.description});

  final Widget? image;
  final Text? description;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            image ??
                SvgPicture.asset(
                  'packages/trionesdev_antd_mobile/assets/images/empty.svg',
                ),
            description ??
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

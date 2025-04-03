import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AntEmpty extends StatelessWidget {
  const AntEmpty({super.key, this.image, this.description});

  final Widget? image;
  final Text? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
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
    );
  }
}
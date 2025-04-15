import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<StatefulWidget> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
        appBar: AntAppBar(
          title: const Text('Image 图片'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DemoBlock(
                title: '基础用法',
                child: UnconstrainedBox(
                  alignment: Alignment.centerLeft,
                  child: AntImage(
                    src:
                        'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
                    width: 200,
                  ),
                ),
              ),
              DemoBlock(
                title: '默认图片',
                child: UnconstrainedBox(
                  alignment: Alignment.centerLeft,
                  child: AntImage(
                    width: 200,
                  ),
                ),
              ),
              DemoBlock(
                title: '加载失败',
                child: UnconstrainedBox(
                  alignment: Alignment.centerLeft,
                  child: AntImage(
                    src:
                    'https://zos.alipayobjects.com/rmsportal/1.png',
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

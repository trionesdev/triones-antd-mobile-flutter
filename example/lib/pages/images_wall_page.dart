import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class ImagesWallPage extends StatefulWidget {
  const ImagesWallPage({super.key});

  @override
  State<StatefulWidget> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImagesWallPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text("ImagesWall 图片墙"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DemoBlock(
              title: "基本使用",
              child: Column(
                children: [AntImagesWall()],
              ),
            ),
            DemoBlock(
              title: "赋值",
              child: AntImagesWall(
                value: [
                  AntImagesWallItemRecord(
                      path: "https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png",
                      status: AntImageStatus.done)
                ],
                onChange: (value) {

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

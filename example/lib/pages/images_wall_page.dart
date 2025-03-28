import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ImagesWallPage extends StatefulWidget {
  const ImagesWallPage({super.key});

  @override
  State<StatefulWidget> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImagesWallPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: Text("ImageUpload 图片上传"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DemoBlock(
              title: "基本使用",
              child: Column(
                children: [ImagesWall()],
              ),
            ),
            DemoBlock(
              title: "赋值",
              child: ImagesWall(
                value: [
                  "https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png"
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class ImagesWallPage extends StatefulWidget {
  const ImagesWallPage({super.key});

  @override
  State<ImagesWallPage> createState() => _ImagesWallPageState();
}

class _ImagesWallPageState extends State<ImagesWallPage> {
  List<AntImagesWallItemStruct> _value = [
    AntImagesWallItemStruct(
      path:
          'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
      status: AntImageStatus.done,
    ),
  ];

  Future<String?> _mockUpload(file, fileName) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png';
  }

  Future<String?> _mockUploadFail(file, fileName) async {
    await Future.delayed(const Duration(milliseconds: 600));
    throw Exception('upload failed');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AntScaffold(
        appBar: AntAppBar(title: Text('ImagesWall 图片墙')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DemoBlock(
                title: '基本使用',
                child: AntImagesWall(
                  onChange: (value) {},
                ),
              ),
              DemoBlock(
                title: '最大张数',
                child: AntImagesWall(
                  maxCount: 3,
                  crossAxisCount: 4,
                  onChange: (value) {},
                ),
              ),
              DemoBlock(
                title: '单选模式',
                child: AntImagesWall(
                  multiSelect: false,
                  maxCount: 1,
                  onChange: (value) {},
                ),
              ),
              DemoBlock(
                title: '图片大小限制（1MB）',
                child: AntImagesWall(
                  maxSize: 1,
                  uploadRequest: _mockUpload,
                  onChange: (value) {},
                ),
              ),
              DemoBlock(
                title: '上传',
                child: AntImagesWall(
                  uploadRequest: _mockUpload,
                  onChange: (value) {},
                ),
              ),
              DemoBlock(
                title: '上传失败',
                child: AntImagesWall(
                  uploadRequest: _mockUploadFail,
                  onChange: (value) {},
                ),
              ),
              DemoBlock(
                title: '禁用',
                child: AntImagesWall(
                  disabled: true,
                  value: [
                    AntImagesWallItemStruct(
                      path:
                          'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
                      status: AntImageStatus.done,
                    ),
                  ],
                ),
              ),
              DemoBlock(
                title: '受控赋值（当前 ${_value.length} 张）',
                child: AntImagesWall(
                  value: _value,
                  maxCount: 5,
                  uploadRequest: _mockUpload,
                  onChange: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

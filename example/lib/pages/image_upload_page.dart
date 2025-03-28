import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ImageUploadPage extends StatefulWidget{
  const ImageUploadPage({super.key});

  @override
  State<StatefulWidget> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage>{
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(title: Text("ImageUpload 图片上传"),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageUpload()
          ],
        ),
      ),
    );
  }
  
}
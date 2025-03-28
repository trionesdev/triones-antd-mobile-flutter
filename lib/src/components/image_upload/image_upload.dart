import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<StatefulWidget> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  Future<void> selectImage(bool multi) async {
    final ImagePicker picker = ImagePicker();
    if(multi){
      final List<XFile> images = await picker.pickMultiImage();
    }else{
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    }

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AntPopup.show(
            context: context,
            child: Column(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? photo = await picker.pickImage(source: ImageSource.camera);
                      },
                      child: Text("相机"),
                    ),
                    GestureDetector(
                      onTap: (){
                        selectImage(true);
                      },
                      child: Text("相册"),
                    )
                  ],
                ),
                Text("取消")
              ],
            ));
      },
      child: Container(
        height: 100,
        child: Icon(Icons.add),
      ),
    );
  }
}

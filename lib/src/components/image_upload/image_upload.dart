import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key, this.value});

  final List<dynamic>? value;

  @override
  State<StatefulWidget> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  List<Image> _images = [];

  Future<void> selectImage(bool multi) async {
    final ImagePicker picker = ImagePicker();
    if (multi) {
      final List<XFile> images = await picker.pickMultiImage();
      print("ss");
      setState(() {
        if (kIsWeb) {
          _images.addAll(images.map((item) {
            // File file = File(item.path);
            // Uint8List uint8list = file.readAsBytesSync();
            // String base64 = base64Encode(uint8list);
            return Image.network(
              item.path,
              fit: BoxFit.cover,
            );
          }));
        } else {
          _images.addAll(images.map((item) {
            // File file = File(item.path);
            // Uint8List uint8list = file.readAsBytesSync();
            // String base64 = base64Encode(uint8list);
            return Image.file(
              File(item.path),
              fit: BoxFit.cover,
            );
          }));
        }
      });
    } else {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var image in _images) {
      widgets.add(ClipRRect(
          child: AspectRatio(
        aspectRatio: 1,
        child: image,
      )));
    }
    widgets.add(GestureDetector(
      onTap: () {
        AntPopup.show(
            context: context,
            // maxHeight: 300,
            minHeight: 30,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(8), right: Radius.circular(8))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.camera);
                          },
                          child: Text("相机"),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectImage(true);
                          },
                          child: Text("相册"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("取消"),
                  )
                ],
              ),
            ));
      },
      child: Center(
        child: Icon(Icons.add),
      ),
    ));
    return Container(
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        children: widgets,
      ),
    );
  }
}

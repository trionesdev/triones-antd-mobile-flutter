import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/theme/theme.dart';

class ImagesWall extends StatefulWidget {
  const ImagesWall(
      {super.key, this.value, this.maxCount, this.disabled = false});

  final List<String>? value;
  final int? maxCount;
  final bool? disabled;

  @override
  State<StatefulWidget> createState() => _ImagesWallState();
}

class _ImagesWallState extends State<ImagesWall> {
  List<Image> _images = [];

  void addImages(List<XFile> images) {
    setState(() {
      if (kIsWeb) {
        _images.addAll(images.map((item) {
          return Image.network(
            item.path,
            fit: BoxFit.cover,
          );
        }));
      } else {
        _images.addAll(images.map((item) {
          return Image.file(
            File(item.path),
            fit: BoxFit.cover,
          );
        }));
      }
    });
  }

  Future<void> selectImageFromGallery(bool multi) async {
    final ImagePicker picker = ImagePicker();
    if (multi) {
      final List<XFile> images = await picker.pickMultiImage();
      addImages(images);
    } else {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        addImages([image]);
      }
    }
  }

  Future<void> selectImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      addImages([photo]);
    }
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData antThemeData = AntTheme.of(context);
    List<Widget> widgets = [];
    for (int i = 0; i < _images.length; i++) {
      widgets.add(ClipRRect(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(antThemeData.borderRadius),
              right: Radius.circular(antThemeData.borderRadius)),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: _images.elementAt(i),
              ),
              if (!widget.disabled!)
                Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          setState(() {
                            _images.removeAt(i);
                          });
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16)),
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ))
            ],
          )));
    }
    if (!widget.disabled! &&
        (widget.maxCount == null ||
            (widget.maxCount != null && _images.length < widget.maxCount!))) {
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
                        left: Radius.circular(antThemeData.borderRadius),
                        right: Radius.circular(antThemeData.borderRadius))),
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
                              Navigator.of(context).pop();
                              selectImageFromCamera();
                            },
                            child: Text("相机"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              selectImageFromGallery(false);
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(antThemeData.borderRadius),
                right: Radius.circular(antThemeData.borderRadius)),
          ),
          child: Icon(
            Icons.add,
            size: 32,
            color: Color(0xff999999),
          ),
        ),
      ));
    }

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

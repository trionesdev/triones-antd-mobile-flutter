import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/images_wall/images_preview.dart';

class AntImageRecord {
  AntImageRecord(
      {this.uid, this.status = AntImageStatus.done, this.image, this.fileName});

  String? uid;
  AntImageStatus? status;
  Image? image;
  String? fileName;
}

enum AntImageStatus {
  done,
  uploading,
  error,
  removed,
}

class AntImagesWall extends StatefulWidget {
  const AntImagesWall(
      {super.key,
      this.value,
      this.maxCount,
      this.disabled = false,
      this.crossAxisCount = 5,
      this.onChange,
      this.uploadRequest,
      this.multiSelect = true});

  final List<String>? value;
  final ValueChanged<List<String>>? onChange;
  final int? maxCount;
  final int? crossAxisCount;
  final bool? disabled;
  final bool? multiSelect;
  final Future<String?> Function(List<int> fileContent, String? fileName)?
      uploadRequest;

  @override
  State<StatefulWidget> createState() => _AntImagesWallState();
}

class _AntImagesWallState extends State<AntImagesWall> {
  final List<AntImageRecord> _images = [];
  var uuid = Uuid();

  void addImages(List<XFile> images) {
    if (images.isEmpty) {
      return;
    }
    var uid = uuid.v4();
    images.forEach((image) {
      setState(() {
        if (kIsWeb) {
          _images.add(AntImageRecord(
              uid: uid,
              image: Image.network(
                image.path,
                fit: BoxFit.cover,
              ),
              fileName: image.name,status: AntImageStatus.uploading));
        } else {
          _images.add(AntImageRecord(
              uid: uid,
              image: Image.file(
                File(image.path),
                fit: BoxFit.cover,
              ),
              fileName: image.name,status: AntImageStatus.uploading));
        }
      });

      if (widget.uploadRequest != null) {
        image.readAsBytes().then((bytes) async {
          widget.uploadRequest!(bytes, image.name)
              .then((url) {
                setState(() {
                  _images.firstWhereOrNull((element) => element.uid == uid)?.status = AntImageStatus.done;
                  _images.firstWhereOrNull((element) => element.uid == uid)?.image = Image.network(url!);
                });
          })
              .catchError(() {
                setState(() {
                  _images.firstWhereOrNull((element) => element.uid == uid)?.status = AntImageStatus.error;
                });
          });
        });
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

  void generateImages() {
    _images.clear();
    for (int i = 0; i < widget.value!.length; i++) {
      if (kIsWeb) {
        _images.add(AntImageRecord(
            image: Image.network(
          widget.value!.elementAtOrNull(i)!,
          fit: BoxFit.cover,
        )));
      } else {
        _images.add(AntImageRecord(
            image: Image.file(
          File(widget.value!.elementAtOrNull(i)!),
          fit: BoxFit.cover,
        )));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      generateImages();
    }
  }

  @override
  void didUpdateWidget(covariant AntImagesWall oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!ListEquality().equals(oldWidget.value ?? [], widget.value ?? [])) {
      generateImages();
    }
  }

  @override
  void dispose() {
    super.dispose();
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
                child: GestureDetector(
                  onTap: () {
                    AntMask.show(
                        context: context,
                        child: ImagesPreview(
                          images: _images.map((image) {
                            return image.image!;
                          }).toList(),
                          initialIndex: i,
                        ));
                  },
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: _images.elementAtOrNull(i)?.image,
                  ),
                ),
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
          AntActionsSheet.show(context: context, actions: [
            AntActionType(
              label: Text('从相册选择'),
              onPressed: () {
                Navigator.of(context).pop();
                selectImageFromGallery(widget.multiSelect!);
              },
            ),
            AntActionType(
              label: Text('拍摄照片'),
              onPressed: () {
                Navigator.of(context).pop();
                selectImageFromCamera();
              },
            ),
          ]);
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

    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount!,
          childAspectRatio: 1,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2),
      children: widgets,
    );
  }
}

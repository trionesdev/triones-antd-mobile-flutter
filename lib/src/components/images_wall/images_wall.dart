import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/images_wall/images_preview.dart';
import 'package:uuid/uuid.dart';

class AntImagesWallItemRecord {
  AntImagesWallItemRecord(
      {this.uid,
      this.status = AntImageStatus.done,
      this.image,
      this.path,
      this.type,
      this.fileName});

  String? uid;
  AntImageStatus? status;
  Image? image;
  String? path;
  AntImageType? type;
  String? fileName;
}

enum AntImageStatus {
  done,
  uploading,
  error,
  removed,
}

enum AntImageType {
  asset,
  network,
  file,
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

  final List<AntImagesWallItemRecord>? value;
  final ValueChanged<List<AntImagesWallItemRecord>>? onChange;
  final int? maxCount;
  final int? crossAxisCount;
  final bool disabled;
  final bool? multiSelect;
  final Future<String?> Function(List<int> fileContent, String? fileName)?
      uploadRequest;

  @override
  State<StatefulWidget> createState() => _AntImagesWallState();
}

class _AntImagesWallState extends State<AntImagesWall> {
  List<AntImagesWallItemRecord> _images = [];
  var uuid = Uuid();

  void onChange(List<AntImagesWallItemRecord> images) {
    if (widget.onChange != null) {
      widget.onChange!(images);
    }
  }

  void addImages(List<XFile> images) {
    if (images.isEmpty) {
      return;
    }
    // List<AntImagesWallItemRecord> imageRecords = [];
    for (var image in images) {
      var uid = uuid.v4();
      if (kIsWeb) {
        _images.add(AntImagesWallItemRecord(
            uid: uid,
            type: AntImageType.network,
            path: image.path,
            image: Image.network(
              image.path,
              fit: BoxFit.cover,
            ),
            fileName: image.name));
      } else {
        _images.add(AntImagesWallItemRecord(
          uid: uid,
          type: AntImageType.file,
          path: image.path,
          image: Image.file(
            File(image.path),
            fit: BoxFit.cover,
          ),
          fileName: image.name,
        ));
      }

      if (widget.uploadRequest != null) {
        image.readAsBytes().then((bytes) async {
          setState(() {
            var imageItem =
                _images.firstWhereOrNull((element) => element.uid == uid);
            if (imageItem != null) {
              imageItem.status = AntImageStatus.uploading;
            }
          });
          widget.uploadRequest!(bytes, image.name).then((url) {
            setState(() {
              var imageItem =
                  _images.firstWhereOrNull((element) => element.uid == uid);
              if (imageItem != null) {
                imageItem.image = Image.network(
                  url!,
                  fit: BoxFit.cover,
                );
                imageItem.path = url;
                imageItem.type = AntImageType.network;
                imageItem.status = AntImageStatus.done;
              }
            });
          }).catchError((err) {
            setState(() {
              var imageItem =
                  _images.firstWhereOrNull((element) => element.uid == uid);
              if (imageItem != null) {
                imageItem.status = AntImageStatus.error;
              }
            });
          }).whenComplete(() {
            onChange(_images);
          });
        });
      }
    }
    // setState(() {
    //
    //   onChange(_images);
    // });
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

  Image generateImage(AntImagesWallItemRecord image) {
    if (image.type == AntImageType.asset) {
      return Image.asset(
        image.path!,
        fit: BoxFit.cover,
      );
    } else if (image.type == AntImageType.network) {
      return Image.network(
        image.path!,
        fit: BoxFit.cover,
      );
    } else if (image.type == AntImageType.file) {
      return Image.file(
        File(image.path!),
        fit: BoxFit.cover,
      );
    } else {
      return Image.network(
        image.path!,
        fit: BoxFit.cover,
      );
    }
  }

  List<AntImagesWallItemRecord>? generateImages(List<AntImagesWallItemRecord>? images) {
    if (images != null && images!.isNotEmpty) {
      for (var element in widget.value!) {
        element.uid ??= uuid.v4();
        element.status ??= AntImageStatus.done;
        element.image ??= generateImage(element);
      }
    }
    return images;
  }

  @override
  void initState() {
    super.initState();
    _images = generateImages(widget.value) ?? [];
  }

  @override
  void didUpdateWidget(covariant AntImagesWall oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!ListEquality().equals(oldWidget.value ?? [], widget.value ?? [])) {
      _images = generateImages(widget.value) ?? [];
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
      widgets.add(AntImageWallItem(
        image: _images.elementAt(i),
        images: _images,
        disabled: widget.disabled,
        index: i,
        onRemove: (uid) {
          setState(() {
            _images.removeWhere((element) => element.uid == uid);
          });
        },
      ));
    }
    if (!widget.disabled! &&
        (widget.maxCount == null ||
            (widget.maxCount != null && _images.length < widget.maxCount!))) {
      widgets.add(GestureDetector(
        onTap: () {
          AntActionSheet.show(context: context, actions: [
            AntActionSheetItemRecord(
              label: Text('从相册选择'),
              onPressed: () {
                Navigator.of(context).pop();
                selectImageFromGallery(widget.multiSelect!);
              },
            ),
            AntActionSheetItemRecord(
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

class AntImageWallItem extends StatefulWidget {
  const AntImageWallItem(
      {super.key,
      required this.image,
      this.onRemove,
      this.disabled = false,
      required this.images,
      required this.index});

  final bool disabled;
  final AntImagesWallItemRecord image;
  final int index;
  final List<AntImagesWallItemRecord> images;
  final Function(String? uid)? onRemove;

  @override
  State<StatefulWidget> createState() => _AntImageWallItemState();
}

class _AntImageWallItemState extends State<AntImageWallItem> {
  late AntImagesWallItemRecord _image;
  List<AntImagesWallItemRecord> _images = [];
  int _index = 0;

  @override
  void didUpdateWidget(covariant AntImageWallItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _images = widget.images;
    _index = widget.index;
  }

  @override
  void initState() {
    super.initState();
    _image = widget.image;
    _images = widget.images;
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData antThemeData = AntTheme.of(context);
    return ClipRRect(
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
                        initialIndex: _index,
                      ));
                },
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: _images.elementAtOrNull(_index)?.image,
                ),
              ),
            ),
            if (_image.status == AntImageStatus.uploading)
              Positioned.fill(
                child: Container(
                  color: Colors.black26,
                  child: Center(
                    child: AntSpinLoading(),
                  ),
                ),
              ),
            if (_image.status == AntImageStatus.error)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    border: Border.all(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(antThemeData.borderRadius),
                        right: Radius.circular(antThemeData.borderRadius)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.broken_image_outlined,
                          color: Colors.red,
                          size: 32,
                        ),
                        Text(
                          "上传失败!",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            if (!widget.disabled)
              Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      widget.onRemove?.call(widget.image.uid);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(6)),
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
        ));
  }
}

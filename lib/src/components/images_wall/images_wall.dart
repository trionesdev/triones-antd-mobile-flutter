import 'dart:io';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
import 'package:trionesdev_antd_mobile/src/components/images_wall/images_preview.dart';
import 'package:uuid/uuid.dart';

class AntImagesWallItemStruct {
  AntImagesWallItemStruct({
    this.uid,
    this.status = AntImageStatus.done,
    this.image,
    this.path,
    this.type,
    this.fileName,
    this.errorMessage,
  });

  String? uid;
  AntImageStatus? status;
  Image? image;
  String? path;
  AntImageType? type;
  String? fileName;
  String? errorMessage;
}

enum AntImageStatus { done, uploading, error, removed }

enum AntImageType { asset, network, file }

class AntImagesWall extends StatefulWidget {
  const AntImagesWall({
    super.key,
    this.value,
    this.maxCount,
    this.disabled = false,
    this.crossAxisCount = 5,

    this.onChange,
    this.uploadRequest,
    this.multiSelect = true,
    this.maxSize,
  });

  final List<AntImagesWallItemStruct>? value;
  final ValueChanged<List<AntImagesWallItemStruct>>? onChange;
  final int? maxCount;
  final int? crossAxisCount;
  final bool disabled;
  final bool? multiSelect;
  final int? maxSize;
  final Future<String?> Function(Uint8List fileContent, String? fileName)?
  uploadRequest;

  @override
  State<StatefulWidget> createState() => _AntImagesWallState();
}

class _AntImagesWallState extends State<AntImagesWall> {
  List<AntImagesWallItemStruct> _images = [];
  var uuid = Uuid();

  void onChange(List<AntImagesWallItemStruct> images) {
    if (widget.onChange != null) {
      widget.onChange!(images);
    }
  }

  void addImages(List<XFile> images) async {
    if (images.isEmpty) {
      return;
    }
    // List<ImagesWallItem> imageRecords = [];
    List<Future> uploadRequests =
        []; //如果有上传请求，则将所有异步请求放在一个列表中，再等待所有异步请求完成，再更新状态
    for (var image in images) {
      var uid = uuid.v4();
      if (kIsWeb) {
        _images.add(
          AntImagesWallItemStruct(
            uid: uid,
            type: AntImageType.network,
            path: image.path,
            image: Image.network(image.path, fit: BoxFit.cover),
            fileName: image.name,
          ),
        );
      } else {
        _images.add(
          AntImagesWallItemStruct(
            uid: uid,
            type: AntImageType.file,
            path: image.path,
            image: Image.file(File(image.path), fit: BoxFit.cover),
            fileName: image.name,
          ),
        );
      }

      if (widget.uploadRequest != null) {
        await image.readAsBytes().then((bytes) async {
          var imageItem = _images.firstWhereOrNull(
            (element) => element.uid == uid,
          );
          setState(() {
            if (imageItem != null) {
              if (widget.maxSize != null &&
                  bytes.length / 1024 / 1024 > widget.maxSize!) {
                imageItem.status = AntImageStatus.error;
                imageItem.errorMessage = "图片过大";
                showAntToast(
                  context: context,
                  content: Text("图片不能超过${widget.maxSize}M"),
                  duration: 1000,
                );
              } else {
                imageItem.status = AntImageStatus.uploading;
              }
            }
          });
          if (imageItem == null ||
              imageItem.status != AntImageStatus.uploading) {
            return;
          }
          var req = widget.uploadRequest!(bytes, image.name)
              .then((url) {
                setState(() {
                  var imageItem = _images.firstWhereOrNull(
                    (element) => element.uid == uid,
                  );
                  if (imageItem != null) {
                    imageItem.image = Image.network(url!, fit: BoxFit.cover);
                    imageItem.path = url;
                    imageItem.type = AntImageType.network;
                    imageItem.status = AntImageStatus.done;
                  }
                });
              })
              .catchError((err) {
                setState(() {
                  var imageItem = _images.firstWhereOrNull(
                    (element) => element.uid == uid,
                  );
                  if (imageItem != null) {
                    imageItem.status = AntImageStatus.error;
                  }
                });
              });
          uploadRequests.add(req);
        });
      }
    }
    if (uploadRequests.isNotEmpty) {
      Future.wait(uploadRequests).then((value) {
        onChange(_images);
      });
    } else {
      onChange(_images);
    }
  }

  Future<void> selectImageFromGallery(bool multi) async {
    final ImagePicker picker = ImagePicker();
    if (widget.maxCount != null) {
      if (widget.maxCount! <= _images.length) {
        return;
      }
    }
    int? limit;
    if (widget.maxCount != null) {
      limit = widget.maxCount! - _images.length;
    }
    if (multi) {
      final List<XFile> images = await picker.pickMultiImage(limit: limit);
      if (images.isNotEmpty) {
        if (limit == null) {
          setState(() {
            addImages(images);
          });
        } else {
          setState(() {
            addImages(images.take(limit!).toList());
          });
        }
      }
    } else {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          addImages([image]);
        });
      }
    }
  }

  Future<void> selectImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        addImages([photo]);
      });
    }
  }

  Image generateImage(AntImagesWallItemStruct image) {
    if (image.type == AntImageType.asset) {
      return Image.asset(image.path!, fit: BoxFit.cover);
    } else if (image.type == AntImageType.network) {
      return Image.network(image.path!, fit: BoxFit.cover);
    } else if (image.type == AntImageType.file) {
      return Image.file(File(image.path!), fit: BoxFit.cover);
    } else {
      return Image.network(image.path!, fit: BoxFit.cover);
    }
  }

  List<AntImagesWallItemStruct>? generateImages(
    List<AntImagesWallItemStruct>? images,
  ) {
    if (images != null && images.isNotEmpty) {
      for (var element in widget.value!) {
        element.uid ??= uuid.v4();
        element.status ??= AntImageStatus.done;
        element.image ??= generateImage(element);
        element.type ??= AntImageType.network;
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
      widgets.add(
        AntImageWallItem(
          image: _images.elementAt(i),
          images: _images,
          disabled: widget.disabled,
          index: i,
          onRemove: (uid) {
            setState(() {
              _images.removeWhere((element) => element.uid == uid);
            });
          },
        ),
      );
    }
    if (!widget.disabled &&
        (widget.maxCount == null ||
            (widget.maxCount != null && _images.length < widget.maxCount!))) {
      widgets.add(
        GestureDetector(
          onTap: () {
            AntActionSheet.show(
              context: context,
              actions: [
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
              ],
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(antThemeData.borderRadius),
                right: Radius.circular(antThemeData.borderRadius),
              ),
            ),
            child: Icon(AntIcons.addOutline, color: Color(0xff999999)),
          ),
        ),
      );
    }

    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount!,
        childAspectRatio: 1,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      children: widgets,
    );
  }
}

class AntImageWallItem extends StatefulWidget {
  const AntImageWallItem({
    super.key,
    required this.image,
    this.onRemove,
    this.disabled = false,
    required this.images,
    required this.index,
  });

  final bool disabled;
  final AntImagesWallItemStruct image;
  final int index;
  final List<AntImagesWallItemStruct> images;
  final Function(String? uid)? onRemove;

  @override
  State<StatefulWidget> createState() => _AntImageWallItemState();
}

class _AntImageWallItemState extends State<AntImageWallItem> {
  late AntImagesWallItemStruct _image;
  List<AntImagesWallItemStruct> _images = [];
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
        right: Radius.circular(antThemeData.borderRadius),
      ),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
              onTap: () {
                AntMask.show(
                  context: context,
                  child: ImagesPreview(
                    images:
                        _images.map((image) {
                          return image.image!;
                        }).toList(),
                    initialIndex: _index,
                  ),
                );
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
                child: Center(child: AntSpinLoading()),
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
                    right: Radius.circular(antThemeData.borderRadius),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var size = constraints.maxWidth / 2;
                    if (size > 32) {
                      size = 32;
                    }
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.broken_image_outlined,
                            color: Colors.red,
                            size: size,
                          ),
                          if (constraints.maxWidth > 64)
                            Text(
                              _image.errorMessage ?? "上传失败",
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                        ],
                      ),
                    );
                  },
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
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                    ),
                  ),
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.close, color: Colors.white, size: 14),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

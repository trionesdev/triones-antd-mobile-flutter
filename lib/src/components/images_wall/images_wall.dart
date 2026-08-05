import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trionesdev_antd_mobile/src/components/images_wall/images_preview.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
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

  AntImagesWallItemStruct copyWith({
    String? uid,
    AntImageStatus? status,
    Image? image,
    String? path,
    AntImageType? type,
    String? fileName,
    String? errorMessage,
  }) {
    return AntImagesWallItemStruct(
      uid: uid ?? this.uid,
      status: status ?? this.status,
      image: image ?? this.image,
      path: path ?? this.path,
      type: type ?? this.type,
      fileName: fileName ?? this.fileName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AntImagesWallItemStruct &&
        uid == other.uid &&
        path == other.path &&
        status == other.status &&
        type == other.type &&
        fileName == other.fileName &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode =>
      Object.hash(uid, path, status, type, fileName, errorMessage);
}

enum AntImageStatus { done, uploading, error, removed }

enum AntImageType { asset, network, file }

/// @component AntImagesWall 图片墙
class AntImagesWall extends StatefulWidget {
  const AntImagesWall({
    super.key,
    this.value,
    this.maxCount,
    this.disabled = false,
    this.crossAxisCount = 5,
    this.onChange,
    this.uploadRequest,
    this.beforeUpload,
    this.multiSelect = true,
    this.maxSize,
    this.preview = true,
  });

  /// @description 当前值
  /// @default null
  final List<AntImagesWallItemStruct>? value;

  /// @description 值改变回调
  /// @default null
  final ValueChanged<List<AntImagesWallItemStruct>>? onChange;

  /// @description 最大图片数量
  /// @default null
  final int? maxCount;

  /// @description 列数
  /// @default 5
  final int crossAxisCount;

  /// @description 是否禁用
  /// @default false
  final bool disabled;

  /// @description 是否多选
  /// @default true
  final bool multiSelect;

  /// @description 图片最大大小，单位MB
  /// @default null
  final int? maxSize;

  /// @description 是否开启预览
  /// @default true
  final bool preview;

  /// @description 上传前校验，返回 false 则跳过该文件
  /// @default null
  final FutureOr<bool> Function(Uint8List fileContent, String? fileName)?
      beforeUpload;

  /// @description 上传请求，返回图片 URL
  /// @default null
  final Future<String?> Function(Uint8List fileContent, String? fileName)?
      uploadRequest;

  @override
  State<AntImagesWall> createState() => _AntImagesWallState();
}

class _AntImagesWallState extends State<AntImagesWall> {
  final Uuid _uuid = const Uuid();
  final ImagePicker _picker = ImagePicker();
  List<AntImagesWallItemStruct> _images = [];

  AntdLocalizations? get _l10n => AntdLocalizations.of(context);

  Image _createImage({
    required AntImageType type,
    required String path,
    Uint8List? bytes,
  }) {
    if (bytes != null) {
      return Image.memory(bytes, fit: BoxFit.cover);
    }
    switch (type) {
      case AntImageType.asset:
        return Image.asset(path, fit: BoxFit.cover);
      case AntImageType.file:
        return Image.file(File(path), fit: BoxFit.cover);
      case AntImageType.network:
        return Image.network(path, fit: BoxFit.cover);
    }
  }

  List<AntImagesWallItemStruct> _normalize(
    List<AntImagesWallItemStruct>? source,
  ) {
    if (source == null || source.isEmpty) return [];
    return source.map((item) {
      final type = item.type ?? AntImageType.network;
      final path = item.path;
      return AntImagesWallItemStruct(
        uid: item.uid ?? _uuid.v4(),
        status: item.status ?? AntImageStatus.done,
        path: path,
        type: type,
        fileName: item.fileName,
        errorMessage: item.errorMessage,
        image: item.image ??
            (path != null && path.isNotEmpty
                ? _createImage(type: type, path: path)
                : null),
      );
    }).toList();
  }

  void _notifyChange() {
    widget.onChange?.call(List<AntImagesWallItemStruct>.from(_images));
  }

  AntImagesWallItemStruct? _findByUid(String uid) {
    for (final item in _images) {
      if (item.uid == uid) return item;
    }
    return null;
  }

  Future<void> _uploadOne({
    required String uid,
    required Uint8List bytes,
    required String? fileName,
  }) async {
    final uploadRequest = widget.uploadRequest;
    if (uploadRequest == null) return;

    try {
      final url = await uploadRequest(bytes, fileName);
      if (!mounted) return;
      setState(() {
        final item = _findByUid(uid);
        if (item == null) return;
        if (url == null || url.isEmpty) {
          item.status = AntImageStatus.error;
          item.errorMessage =
              _l10n?.images_wall_error ?? '上传失败';
          return;
        }
        item.path = url;
        item.type = AntImageType.network;
        item.image = _createImage(type: AntImageType.network, path: url);
        item.status = AntImageStatus.done;
        item.errorMessage = null;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        final item = _findByUid(uid);
        if (item == null) return;
        item.status = AntImageStatus.error;
        item.errorMessage = _l10n?.images_wall_error ?? '上传失败';
      });
    }
  }

  Future<void> _addImages(List<XFile> files) async {
    if (files.isEmpty || widget.disabled) return;

    final remain = widget.maxCount == null
        ? files.length
        : widget.maxCount! - _images.length;
    if (remain <= 0) return;

    final selected = files.take(remain).toList();
    final uploadTasks = <Future<void>>[];

    for (final file in selected) {
      final uid = _uuid.v4();
      late final Uint8List bytes;
      try {
        bytes = await file.readAsBytes();
      } catch (_) {
        continue;
      }

      if (widget.beforeUpload != null) {
        final pass = await widget.beforeUpload!(bytes, file.name);
        if (!pass) continue;
      }

      final isWeb = kIsWeb;
      final type = isWeb ? AntImageType.network : AntImageType.file;
      final item = AntImagesWallItemStruct(
        uid: uid,
        type: type,
        path: file.path,
        fileName: file.name,
        image: _createImage(type: type, path: file.path, bytes: bytes),
        status: AntImageStatus.done,
      );

      if (widget.maxSize != null &&
          bytes.lengthInBytes / 1024 / 1024 > widget.maxSize!) {
        item.status = AntImageStatus.error;
        item.errorMessage = _l10n?.images_wall_too_large ?? '图片过大';
        if (mounted) {
          showAntToast(
            context: context,
            content: Text(
              '${_l10n?.images_wall_too_large ?? '图片过大'}(${widget.maxSize}MB)',
            ),
            duration: 1500,
          );
        }
        if (!mounted) return;
        setState(() {
          _images.add(item);
        });
        continue;
      }

      if (widget.uploadRequest != null) {
        item.status = AntImageStatus.uploading;
        uploadTasks.add(
          _uploadOne(uid: uid, bytes: bytes, fileName: file.name),
        );
      }

      if (!mounted) return;
      setState(() {
        _images.add(item);
      });
    }

    _notifyChange();

    if (uploadTasks.isNotEmpty) {
      await Future.wait(uploadTasks);
      if (!mounted) return;
      _notifyChange();
    }
  }

  Future<void> _selectFromGallery() async {
    if (widget.maxCount != null && _images.length >= widget.maxCount!) {
      return;
    }
    final limit =
        widget.maxCount == null ? null : widget.maxCount! - _images.length;

    if (widget.multiSelect) {
      final images = await _picker.pickMultiImage(limit: limit);
      if (images.isEmpty) return;
      final clipped =
          limit == null ? images : images.take(limit).toList(growable: false);
      await _addImages(clipped);
    } else {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      await _addImages([image]);
    }
  }

  Future<void> _selectFromCamera() async {
    if (widget.maxCount != null && _images.length >= widget.maxCount!) {
      return;
    }
    final photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo == null) return;
    await _addImages([photo]);
  }

  void _showPickerSheet() {
    final l10n = _l10n;
    AntActionSheet.show(
      context: context,
      actions: [
        AntActionSheetItemStruct(
          label: Text(l10n?.images_wall_album ?? '从相册选择'),
          onPressed: () {
            Navigator.of(context).pop();
            _selectFromGallery();
          },
        ),
        AntActionSheetItemStruct(
          label: Text(l10n?.images_wall_camera ?? '拍摄照片'),
          onPressed: () {
            Navigator.of(context).pop();
            _selectFromCamera();
          },
        ),
      ],
    );
  }

  void _removeImage(String? uid) {
    if (uid == null || widget.disabled) return;
    setState(() {
      _images.removeWhere((element) => element.uid == uid);
    });
    _notifyChange();
  }

  void _previewAt(int index) {
    if (!widget.preview) return;
    final providers = <ImageProvider>[];
    final tags = <Object>[];
    for (final item in _images) {
      final provider = item.image?.image;
      if (provider == null) continue;
      providers.add(provider);
      tags.add(item.uid ?? item.path ?? providers.length);
    }
    if (providers.isEmpty) return;
    final safeIndex = index.clamp(0, providers.length - 1);
    AntMask.show(
      context: context,
      clickMaskClose: true,
      child: ImagesPreview(
        images: providers,
        heroTags: tags,
        initialIndex: safeIndex,
        title: _l10n?.images_wall_preview ?? '图片预览',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _images = _normalize(widget.value);
  }

  @override
  void didUpdateWidget(covariant AntImagesWall oldWidget) {
    super.didUpdateWidget(oldWidget);
    final next = _normalize(widget.value);
    if (!listEquals(oldWidget.value ?? const [], widget.value ?? const [])) {
      _images = next;
    }
  }

  bool get _canAdd =>
      !widget.disabled &&
      (widget.maxCount == null || _images.length < widget.maxCount!);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);
    final children = <Widget>[
      for (var i = 0; i < _images.length; i++)
        AntImageWallItem(
          key: ValueKey(_images[i].uid ?? '$i'),
          image: _images[i],
          index: i,
          disabled: widget.disabled,
          errorText: _l10n?.images_wall_error ?? '上传失败',
          onPreview: () => _previewAt(i),
          onRemove: _removeImage,
        ),
    ];

    if (_canAdd) {
      children.add(
        GestureDetector(
          onTap: _showPickerSheet,
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorFillSecondary,
              borderRadius: BorderRadius.circular(theme.borderRadius),
            ),
            child: Icon(
              AntIcons.addOutline,
              color: theme.colorTextPlaceholder,
            ),
          ),
        ),
      );
    }

    return GridView(
      padding: const EdgeInsets.all(4),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      children: children,
    );
  }
}

class AntImageWallItem extends StatelessWidget {
  const AntImageWallItem({
    super.key,
    required this.image,
    required this.index,
    required this.onRemove,
    required this.onPreview,
    required this.errorText,
    this.disabled = false,
  });

  final AntImagesWallItemStruct image;
  final int index;
  final bool disabled;
  final String errorText;
  final ValueChanged<String?> onRemove;
  final VoidCallback onPreview;

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);
    final radius = BorderRadius.circular(theme.borderRadius);

    return ClipRRect(
      borderRadius: radius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: onPreview,
            child: image.image != null
                ? Image(
                    image: image.image!.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Container(color: theme.colorFillTertiary),
          ),
          if (image.status == AntImageStatus.uploading)
            Positioned.fill(
              child: Container(
                color: Colors.black26,
                child: const Center(child: AntSpinLoading()),
              ),
            ),
          if (image.status == AntImageStatus.error)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(color: theme.colorError, width: 1),
                  borderRadius: radius,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var size = constraints.maxWidth / 2;
                    if (size > 32) size = 32;
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.broken_image_outlined,
                            color: theme.colorError,
                            size: size,
                          ),
                          if (constraints.maxWidth > 64)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: Text(
                                image.errorMessage ?? errorText,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: theme.colorError,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          if (!disabled)
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => onRemove(image.uid),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

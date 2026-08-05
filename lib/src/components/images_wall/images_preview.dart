import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class ImagesPreview extends StatefulWidget {
  const ImagesPreview({
    super.key,
    required this.images,
    this.heroTags,
    this.initialIndex = 0,
    this.title,
  });

  final List<ImageProvider> images;
  final List<Object>? heroTags;
  final int initialIndex;
  final String? title;

  @override
  State<ImagesPreview> createState() => _ImagesPreviewState();
}

class _ImagesPreviewState extends State<ImagesPreview> {
  late final PageController _pageController;
  late int _index;

  @override
  void initState() {
    super.initState();
    final maxIndex =
        widget.images.isEmpty ? 0 : widget.images.length - 1;
    _index = widget.initialIndex.clamp(0, maxIndex);
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.images.length;
    if (total == 0) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      child: AntScaffold(
        appBar: AntAppBar(
          toolbarHeight: 50,
          title: Text(widget.title ?? '图片预览'),
        ),
        body: PhotoViewGallery.builder(
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          scrollPhysics: const BouncingScrollPhysics(),
          itemCount: total,
          pageController: _pageController,
          onPageChanged: (i) {
            setState(() {
              _index = i;
            });
          },
          builder: (BuildContext context, int index) {
            final tag = widget.heroTags?.elementAtOrNull(index) ?? index;
            return PhotoViewGalleryPageOptions(
              imageProvider: widget.images[index],
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
              heroAttributes: PhotoViewHeroAttributes(tag: tag),
            );
          },
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 48,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.black54),
          child: Text(
            '${_index + 1}/$total',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

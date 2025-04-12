import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ImagesPreview extends StatefulWidget {
  const ImagesPreview({super.key, this.images, this.initialIndex = 0});

  final List<Image>? images;
  final int? initialIndex;

  @override
  State<StatefulWidget> createState() => _ImagesPreviewState();
}

class _ImagesPreviewState extends State<ImagesPreview> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        toolbarHeight: 40,
      ),
      body: PhotoViewGallery.builder(
        backgroundDecoration: BoxDecoration(
          color: Colors.black38,
        ),
        scrollPhysics: const BouncingScrollPhysics(),
        itemCount: widget.images?.length,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: widget.images?.elementAtOrNull(index)?.image,
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 1.1,
            heroAttributes: PhotoViewHeroAttributes(
                tag: widget.images!.elementAtOrNull(index)!),
          );
        },
        pageController: PageController(initialPage: _index),
        onPageChanged: (i) {
          setState(() {
            _index = i;
          });
        },
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 48,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black38,
        ),
        child: Text("${_index + 1}/${widget.images?.length}"),
      ),
    );
  }
}

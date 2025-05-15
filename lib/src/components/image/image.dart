import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntImage extends StatefulWidget {
  const AntImage(
      {super.key, this.src, this.width, this.height, this.preview = true});

  final String? src;
  final double? width;
  final double? height;
  final bool preview;

  @override
  State<StatefulWidget> createState() => _AntImageState();
}

class _AntImageState extends State<AntImage> {
  Image get _previewImage {
    if (widget.src != null && widget.src!.isNotEmpty) {
      return Image.network(widget.src!, fit: BoxFit.cover);
    } else {
      return Image.asset(
          "packages/trionesdev_antd_mobile/assets/images/default-image.png",
          fit: BoxFit.cover);
    }
  }

  Image get _image {
    if (widget.src != null && widget.src!.isNotEmpty) {
      return Image.network(widget.src!,
          errorBuilder: (context, error, stackTrace) {
        return Image.asset(
            "packages/trionesdev_antd_mobile/assets/images/error-image.png",
            width: widget.width,
            height: widget.height,
            fit: BoxFit.cover);
      }, width: widget.width, height: widget.height, fit: BoxFit.cover);
    } else {
      return Image.asset(
          "packages/trionesdev_antd_mobile/assets/images/default-image.png",
          width: widget.width,
          height: widget.height,
          fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.preview) {
          AntMask.show(
              context: context,
              clickMaskClose: true,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: Icon(Icons.arrow_back),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: _previewImage,
                  )),
                ],
              ));
        }
      },
      child: Container(
        child: _image,
      ),
    );
  }
}

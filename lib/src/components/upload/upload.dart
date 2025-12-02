import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AntUpload extends StatefulWidget {
  const AntUpload({super.key, this.showUploadList});

  final bool? showUploadList;

  @override
  State<StatefulWidget> createState() => _AntUploadState();
}

class _AntUploadState extends State<AntUpload> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }
}

import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class UploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: Text("Upload 上传"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "点击上传",
              child: Column(
                children: [
                  AntUpload(

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

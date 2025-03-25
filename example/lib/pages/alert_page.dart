import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<StatefulWidget> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(
        title: const Text('Alert'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(
              title: "基本使用",
              child: AntAlert(
                type: AlertType.success,
                message: Text("Success Text"),
              ),
            ),
            DemoBlock(
              title: "四种样式",
              child: Column(spacing: 10,children: [
                AntAlert(
                  type: AlertType.success,
                  message: Text("Success Text"),
                ),
                AntAlert(
                  type: AlertType.info,
                  message: Text("Info Text"),
                ),
                AntAlert(
                  type: AlertType.warning,
                  message: Text("Warning Text"),
                ),
                AntAlert(
                  type: AlertType.error,
                  message: Text("Error Text"),
                ),
              ],),
            ),
            DemoBlock(
              title: "可关闭的警告提示",
              child: AntAlert(
                type: AlertType.warning,
                closable: true,
                message: Text(softWrap: true,"Warning Text Warning Text Warning TextW arning Text Warning Text Warning TextWarning Text"),
              ),
            ),
            DemoBlock(
              title: "图标",
              child: Column(
                spacing: 10,
                children: [
                  AntAlert(
                    type: AlertType.warning,
                    closable: true,
                    showIcon: true,
                    message: Text(softWrap: true,"Warning Text Warning Text Warning TextW arning Text Warning Text Warning TextWarning Text"),
                  ),
                  AntAlert(
                    type: AlertType.warning,
                    closable: true,
                    showIcon: true,
                    message: Text(softWrap: true,"Warning Text Warning Text Warning TextW arning Text Warning Text Warning TextWarning Text"),
                    description: Text( "Warning Text Warning Text Warning TextW arning Text Warning Text Warning TextWarning Text"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

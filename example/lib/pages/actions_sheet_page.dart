import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class ActionsSheetPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ActionsSheetPageState();
}

class _ActionsSheetPageState extends State<ActionsSheetPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text('ActionsSheet 操作页'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(title: "基本使用",child: AntButton(text: "打开操作页",onPressed: (){
              AntActionsSheet.show(context: context, actions: [
                AntActionType(label: Text("选项一"),onPressed: (){
                  AntToast.show(context: context, content: Text("点击了选项一"));
                }),
                AntActionType(label: Text("选项二"),onPressed: (){
                  AntToast.show(context: context, content: Text("点击了选项二"));
                })
              ]);
            }),),
            DemoBlock(title: "带Title",child: AntButton(text: "带Title的操作页",onPressed: (){
              AntActionsSheet.show(context: context,title: Text("操作"), actions: [
                AntActionType(label: Text("选项一"),onPressed: (){
                  AntToast.show(context: context, content: Text("点击了选项一"));
                }),
                AntActionType(label: Text("选项二"),onPressed: (){
                  AntToast.show(context: context, content: Text("点击了选项二"));
                })
              ]);
            }),)
          ],
        ),
      ),
    );
  }
}
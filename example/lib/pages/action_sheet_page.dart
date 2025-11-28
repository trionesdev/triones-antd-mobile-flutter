import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class ActionSheetPage extends StatefulWidget {
  const ActionSheetPage({super.key});


  @override
  State<StatefulWidget> createState() => _ActionSheetPageState();
}

class _ActionSheetPageState extends State<ActionSheetPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text('ActionsSheet 操作页'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(title: "基本使用",child: AntButton(text: "打开操作页",onPressed: (){
              AntActionSheet.show(context: context, actions: [
                AntActionSheetItemStruct(label: Text("选项一"),onPressed: (){
                  AntToast.show(context: context, content: Text("点击了选项一"));
                }),
                AntActionSheetItemStruct(label: Text("选项二"),onPressed: (){
                  AntToast.show(context: context, content: Text("点击了选项二"));
                })
              ]);
            }),),
            DemoBlock(title: "带Title",child: AntButton(text: "带Title的操作页",onPressed: (){
              AntActionSheet.show(context: context,title: Text("操作"), actions: [
                AntActionSheetItemStruct(label: Text("选项一"),onPressed: (){
                  AntToast.show(context: context, content: Text("点击了选项一"));
                }),
                AntActionSheetItemStruct(label: Text("选项二"),onPressed: (){
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
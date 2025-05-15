import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class InputNumberPage extends StatefulWidget{
  const InputNumberPage({super.key});

  @override
  State<StatefulWidget> createState() =>_InputNumberPageState();
}
class _InputNumberPageState extends State<InputNumberPage>{
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text("InputNumber 数字输入框"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(title: "基本使用",child: AntInputNumber(),),
            DemoBlock(title: "步长设置",child: AntInputNumber(step: 5,),),
            DemoBlock(title: "限制输入范围",child: AntInputNumber(min: 0,max: 20,),),
            DemoBlock(title: "默认值",child: AntInputNumber(min: 0,max: 20,defaultValue: 10,),),
          ],
        ),
      ),
    );
  }

}
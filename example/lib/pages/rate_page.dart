import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class RatePage extends StatefulWidget{
  const RatePage({super.key});

  @override
  State<StatefulWidget> createState()=>_RatePageState();
}
class _RatePageState extends State<RatePage>{
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: Text("Rate 评分"),),
    body: SingleChildScrollView(child: Column(
      children: [
        SizedBox(height: 100,),
        DemoBlock(title: "基本使用",child: AntRate(),),
        DemoBlock(title: "半星",child: AntRate(allowHalf: true,),)
      ],
    ),),
    );
  }

}
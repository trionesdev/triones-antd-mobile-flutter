import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class SwitchPage extends StatefulWidget{
  const SwitchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SwitchPageState();

}

class _SwitchPageState extends State<SwitchPage>{
  @override
  Widget build(BuildContext context) {
    return AntPageContainer(
      appBar: AntAppBar(title: Text("Switch"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(title: "基本用法",child: Column(
              children: [
                AntSwitch(onChange: (bool value) {  },)
              ],
            ),
            ),
            DemoBlock(title: "三种大小",child: Column(
              spacing: 10,
              children: [
                AntSwitch(size: AntSwitchSize.small,onChange: (bool value) {  },),
                AntSwitch(size: AntSwitchSize.middle,onChange: (bool value) {  },),
                AntSwitch(size: AntSwitchSize.large,onChange: (bool value) {  },),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }

}
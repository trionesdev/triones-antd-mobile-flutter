import 'package:antd_flutter_example/demo_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AvatarPage  extends StatefulWidget{
  const AvatarPage({super.key});

  @override
  State<StatefulWidget> createState()=>_AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage>{

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(
        title: Text('Avatar 头像'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoBlock(title: "基本使用",child: Column(
              spacing: 10,
              children: [
                AntSpace(children: [
                  AntAvatar(shape: AntAvatarShape.circle,size: 64,icon: Icon(Icons.person),),
                  AntAvatar(shape: AntAvatarShape.circle,size: 40,icon: Icon(Icons.person),),
                  AntAvatar(shape: AntAvatarShape.circle,size: 32,icon: Icon(Icons.person),),
                ],),
                AntSpace(children: [
                  AntAvatar(shape: AntAvatarShape.square,size: 64,icon: Icon(Icons.person),),
                  AntAvatar(shape: AntAvatarShape.square,size: 40,icon: Icon(Icons.person),),
                  AntAvatar(shape: AntAvatarShape.square,size: 32,icon: Icon(Icons.person),),
                ],)
              ],
            ),)
          ],
        ),
      ),
    );
  }

}
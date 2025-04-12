import 'package:flutter/widgets.dart';

class AntAppBarBottom extends StatelessWidget implements PreferredSizeWidget{
  const AntAppBarBottom({super.key,this.height=40, this.child});
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child ?? Container();
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

}
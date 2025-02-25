import 'package:flutter/widgets.dart';

class DemoBlock extends StatelessWidget {
  const DemoBlock({
    super.key,
    this.title,
    this.child,
  });

  final String? title;
  final Widget? child ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      child: Column(
        children: [
          if (title != null)
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
              ),
              width: double.infinity,
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (child != null)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
              ),
              child: child,
            ),
        ],
      ),
    );
  }
}
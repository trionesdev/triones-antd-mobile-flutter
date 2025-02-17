import 'package:flutter/widgets.dart';

class AntGrid extends StatefulWidget {
  const AntGrid({super.key});

  @override
  State<StatefulWidget> createState() => _GridState();
}

class _GridState extends State<AntGrid> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.3,
          child: Text("1"),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.6,
          child: Text("1"),
        )
      ],
    );
  }
}

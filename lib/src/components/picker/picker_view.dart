import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AntPickerView extends StatefulWidget {
  const AntPickerView({super.key});

  @override
  State<StatefulWidget> createState() => _AntPickerViewState();
}

class _AntPickerViewState extends State<AntPickerView> with MaterialStateMixin {
  double viewHeight = 0;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print(constraints.maxHeight);
      viewHeight = constraints.maxHeight;
      return Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            child: Container(),
          ),
          Positioned(
              top: 0,
              child: IgnorePointer(
                ignoring: true,
                child: Container(
                  height: (viewHeight - 36) / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.white.withOpacity(0)])),
                ),
              )),
          Positioned(
              bottom: 0,
              child: IgnorePointer(
                ignoring: true,
                child: Container(
                  height: (viewHeight - 36) / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.white, Colors.white.withOpacity(0)])),
                ),
              ))
        ],
      );
    });
  }
}

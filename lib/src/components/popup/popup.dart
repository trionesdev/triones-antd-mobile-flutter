import 'package:flutter/material.dart';

class AntPopup {
  static void show(
      {required BuildContext context,
      double? minHeight,
      double? maxHeight,
      Widget? child}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(),
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight:
                    minHeight ?? MediaQuery.of(context).size.height * 0.3,
                maxHeight: maxHeight ?? MediaQuery.of(context).size.height,
              ),
              child: child);
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/picker/picker_view.dart';

class AntPopup {
  static void show({
    required BuildContext context,
    double? minHeight,
  }) {
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
                    minHeight ?? MediaQuery.of(context).size.height * 0.4,
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: SizedBox(
                              child: Text(
                                "取消",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: SizedBox(
                              child: Text("确定",
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                      child: Row(
                    children: [
AntPickerView()
                    ],
                  ))
                ],
              ));
        });
  }
}

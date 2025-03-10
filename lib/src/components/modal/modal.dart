import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';
import 'package:trionesdev_antd_mobile/src/components/modal/modal_view.dart';

import '../theme/theme.dart';

class AntModal {
  static void show({
    required BuildContext context,
    StateStyle? style,
    bool? closeOnMaskClick = false,
    String? title,
    Widget? header,
    Widget? content,
    bool? showCloseButton,
    List<Widget>? actions,
    bool? closeOnAction = false,
  }) {
    showDialog(
        context: context,
        barrierDismissible: closeOnMaskClick ?? false,
        builder: (context) {
          return AntModalView(
            style: style,
            title: title,
            header: header,
            content: content,
            showCloseButton: showCloseButton,
            actions: actions,
            closeOnAction: closeOnAction,
          );
        });
  }

  static void alert(
      {required BuildContext context,
      StateStyle? style,
      bool? closeOnMaskClick = false,
      String? title,
      Widget? content,
      String? confirmText,
      Function? onConfirm,
      bool? showCloseButton}) {
    showDialog(
        context: context,
        barrierDismissible: closeOnMaskClick ?? false,
        builder: (context) {
          return AntModalView(
            style: style,
            title: title,
            content: content,
            showCloseButton: showCloseButton,
            actions: [
              AntButton(
                block: true,
                type: ButtonType.primary,
                text: confirmText ?? "知道了",
                size: ButtonSize.large,
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm?.call();
                },
              )
            ],
          );
        });
  }

  static void confirm(
      {required BuildContext context,
      StateStyle? style,
      bool? closeOnMaskClick = false,
      String? title,
      Widget? content,
      String? cancelText,
      String? confirmText,
      Function? onConfirm,
      Function? onCancel,
      bool? showCloseButton}) {
    showDialog(
        context: context,
        barrierDismissible: closeOnMaskClick ?? false,
        builder: (context) {
          AntThemeData themeData = AntTheme.of(context);
          return AntModalView(
            style: style,
            title: title,
            content: content,
            showCloseButton: showCloseButton,
            actions: [
              Row(
                children: [
                  Expanded(
                      child: AntButton(
                    text: cancelText ?? "取消",
                    type: ButtonType.text,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onCancel?.call();
                    },
                  )),
                  Expanded(
                      child: AntButton(
                    text: confirmText ?? "确定",
                    type: ButtonType.text,
                    color: themeData.colorPrimary,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm?.call();
                    },
                  )),
                ],
              )
            ],
          );
        });
  }
}

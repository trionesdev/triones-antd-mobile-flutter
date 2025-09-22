import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';
import 'package:trionesdev_antd_mobile/src/components/modal/modal_view.dart';

class AntModal {
  static Future<T?> show<T>({
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
    return showDialog(
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

  static Future<T?> alert<T>(
      {required BuildContext context,
      StateStyle? style,
      bool? closeOnMaskClick = false,
      String? title,
      Widget? content,
      String? confirmText,
      Function? onConfirm,
      bool? showCloseButton}) {
    return showDialog(
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
                type: AntButtonType.primary,
                text: confirmText ?? "知道了",
                size: AntSize.large,
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm?.call();
                },
              )
            ],
          );
        });
  }

  static Future<T?> confirm<T>(
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
    return showDialog(
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
                    text: cancelText ?? AntdLocalizations.of(context)?.button_cancel ?? "取消",
                    type: AntButtonType.text,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onCancel?.call();
                    },
                  )),
                  Expanded(
                      child: AntButton(
                    text: confirmText ?? "确定",
                    type: AntButtonType.text,
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

/// 显示模态框
Future<T?> showAntModal<T>({
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
  return showDialog(
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

Future<T?> showAntAlertModal<T>(
    {required BuildContext context,
    StateStyle? style,
    bool? closeOnMaskClick = false,
    String? title,
    Widget? content,
    String? confirmText,
    Function? onConfirm,
    bool? showCloseButton}) {
  return showDialog(
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
              type: AntButtonType.primary,
              text: confirmText ?? "知道了",
              size: AntSize.large,
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm?.call();
              },
            )
          ],
        );
      });
}
/// 显示确认模态框
Future<T?> showAntConfirmModal<T>(
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
  return showDialog(
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
                  type: AntButtonType.text,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onCancel?.call();
                  },
                )),
                Expanded(
                    child: AntButton(
                  text: confirmText ?? "确定",
                  type: AntButtonType.text,
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

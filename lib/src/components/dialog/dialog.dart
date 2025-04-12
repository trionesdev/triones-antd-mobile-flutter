import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import 'dialog_view.dart';

class AntDialog {
  static void alert({
    required BuildContext context,
    double? maxWidth,
    Widget? content,
    Function? onConfirm,
    bool? closeOnMaskClick = false,
    String? confirmText
  }) {
    AntMask.show(
        context: context,
        clickMaskClose: closeOnMaskClick,
        child: AntDialogView(
          maxWidth: maxWidth,
          content: content,
          onConfirm: onConfirm,
          confirmText: confirmText,
        ));
  }

  static void confirm({
    required BuildContext context,
    double? maxWidth,
    Widget? content,
    Function? onConfirm,
    bool? closeOnMaskClick = false,
    String? cancelText,
    String? confirmText,
  }) {
    AntMask.show(
        context: context,
        clickMaskClose: closeOnMaskClick,
        child: AntDialogView(
          type: AntDialogViewType.confirm,
          maxWidth: maxWidth,
          content: content,
          onConfirm: onConfirm,
          cancelText: cancelText,
          confirmText: confirmText,
        ));
  }
}

import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import 'dialog_view.dart';

class AntDialog {
  static void alert({
    required BuildContext context,
    Widget? content,
    Function? onConfirm,
    bool? closeOnMaskClick = false,
  }) {
    AntMask.show(
        context: context,
        clickMaskClose: closeOnMaskClick,
        child: AntDialogView(
          content: content,
          onConfirm: onConfirm,
        ));
  }

  static void confirm({
    required BuildContext context,
    Widget? content,
    Function? onConfirm,
    bool? closeOnMaskClick = false,
  }) {
    AntMask.show(
        context: context,
        clickMaskClose: closeOnMaskClick,
        child: AntDialogView(
          type: AntDialogViewType.confirm,
          content: content,
          onConfirm: onConfirm,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

enum AntDialogViewType { alert, confirm }

class AntDialogView extends StatelessWidget {
  const AntDialogView({
    super.key,
    this.type = AntDialogViewType.alert,
    this.maxWidth,
    this.content,
    this.decoration,
    this.onConfirm,
    this.onCancel,
    this.cancelText,
    this.confirmText,
  });

  final AntDialogViewType? type;
  final double? maxWidth;
  final Widget? content;
  final BoxDecoration? decoration;
  final Function? onConfirm;
  final Function? onCancel;
  final String? cancelText;
  final String? confirmText;

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    StateStyle stateStyle = AntDialogViewStyle(context: context);
    return UnconstrainedBox(
      child: Container(
        decoration:
            decoration ?? stateStyle.resolve(<WidgetState>{})?.decoration,
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? 500,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: themeData.colorBorder, width: 0.5))),
              child: content,
            ),
            if (type == AntDialogViewType.alert)
              GestureDetector(
                onTap: () {
                  onConfirm?.call();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    confirmText ?? "我知道了",
                    style:
                        TextStyle(fontSize: 16, color: themeData.colorPrimary),
                  ),
                ),
              ),
            if (type == AntDialogViewType.confirm)
              Row(children: [
                Expanded(
                    child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          onCancel?.call();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: themeData.colorBorder,
                                      width: 0.5))),
                          child: Text(cancelText ?? "取消",
                              style: TextStyle(
                                  fontSize: 16, color: themeData.colorPrimary)),
                        ))),
                Expanded(
                    child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          onConfirm?.call();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12),
                          child: Text(confirmText ?? "确定",
                              style: TextStyle(
                                  fontSize: 16, color: themeData.colorPrimary)),
                        ))),
              ])
          ],
        ),
      ),
    );
  }
}

class AntDialogViewStyle extends StateStyle {
  const AntDialogViewStyle({required this.context});

  final BuildContext context;

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    return Style(
      backgroundColor: Colors.white,
      borderRadius: themeData.borderRadius,
    );
  }
}

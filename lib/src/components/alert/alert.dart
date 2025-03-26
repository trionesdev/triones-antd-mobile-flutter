import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import '../theme/theme.dart';

enum AlertType {
  info,
  success,
  warning,
  error,
}

class AntAlert extends StatefulWidget {
  const AntAlert(
      {super.key,
      this.closable,
      this.message,
      this.description,
      this.icon,
      this.type = AlertType.info,
      this.onClose,
      this.style,
      this.decoration,
      this.showIcon});

  final bool? closable;
  final Text? message;
  final Text? description;
  final Widget? icon;
  final bool? showIcon;
  final AlertType? type;
  final Function? onClose;
  final StateStyle? style;
  final BoxDecoration? decoration;

  @override
  State<StatefulWidget> createState() => _AntAlertState();
}

class _AntAlertState extends State<AntAlert> with MaterialStateMixin {
  Widget? icon() {
    switch (widget.type) {
      case AlertType.info:
        return Icon(Icons.info);
      case AlertType.success:
        return Icon(Icons.check_circle);
      case AlertType.warning:
        return Icon(Icons.warning);
      case AlertType.error:
        return Icon(Icons.error);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    StateStyle? stateStyle = _AntAlertStyle(context: context, alert: widget);
    stateStyle = stateStyle.merge(widget.style);
    return Container(
      decoration:
          widget.decoration ?? stateStyle.resolve(materialStates)?.decoration,
      padding: stateStyle.resolve(materialStates)?.computedPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: widget.description != null
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (widget.showIcon == true)
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: icon(),
                ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: widget.message,
                    ),
                    if (widget.description != null)
                      Container(
                        child: widget.description,
                      ),
                  ],
                ),
              ),
              if (widget.closable == true)
                GestureDetector(
                  onTap: () {
                    widget.onClose?.call();
                  },
                  child: Icon(
                    Icons.close,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class _AntAlertStyle extends StateStyle {
  const _AntAlertStyle({required this.context, required this.alert});

  final BuildContext context;
  final AntAlert alert;

  Color? color() {
    switch (alert.type) {
      case AlertType.info:
        return AntTheme.of(context).colorPrimary;
      case AlertType.success:
        return AntTheme.of(context).colorSuccess;
      case AlertType.warning:
        return AntTheme.of(context).colorWarning;
      case AlertType.error:
        return AntTheme.of(context).colorError;
      default:
        return null;
    }
  }

  @override
  Style get style => Style(
        borderRadius: AntTheme.of(context).borderRadius,
        padding: StylePadding.all(8),
        backgroundColor: color()?.withOpacity(0.1),
        border: StyleBorder(
          color: color()?.withOpacity(0.6),
          width: 1,
          style: BorderStyle.solid,
        ),
      );
}

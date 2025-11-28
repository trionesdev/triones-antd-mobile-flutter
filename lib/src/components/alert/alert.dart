import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../theme/theme.dart';

enum AntAlertType { info, success, warning, error }

///@component Alert 警告提示
class AntAlert extends StatefulWidget {
  const AntAlert({
    super.key,
    this.closable,
    this.message,
    this.messageText,
    this.description,
    this.descriptionText,
    this.icon,
    this.type = AntAlertType.info,
    this.onClose,
    this.style,
    this.decoration,
    this.showIcon,
  });

  /// @description 是否可以关闭
  /// @default null
  final bool? closable;

  /// @description 消息,与messageText二选一，优选使用message
  /// @default null
  final Text? message;

  /// @description 消息文本,与message二选一，优选使用message
  /// @default null
  final String? messageText;

  /// @description 描述,与descriptionText二选一，优选使用description
  /// @default null
  final Text? description;

  /// @description 描述文本,与description二选一，优选使用description
  /// @default null
  final String? descriptionText;

  /// @description 图标
  /// @default null
  final Widget? icon;

  /// @description 显示图标
  /// @default null
  final bool? showIcon;

  /// @description 类型
  /// @default null
  final AntAlertType? type;

  /// @description 关闭回调
  /// @default null
  final Function? onClose;

  /// @description 样式
  /// @default null
  final StateStyle? style;

  /// @description 装饰
  /// @default null
  final BoxDecoration? decoration;

  @override
  State<StatefulWidget> createState() => _AntAlertState();
}

class _AntAlertState extends State<AntAlert> with MaterialStateMixin {
  Widget? icon() {
    switch (widget.type) {
      case AntAlertType.info:
        return Icon(Icons.info, color: AntTheme.of(context).colorPrimary);
      case AntAlertType.success:
        return Icon(
          Icons.check_circle,
          color: AntTheme.of(context).colorSuccess,
        );
      case AntAlertType.warning:
        return Icon(Icons.warning, color: AntTheme.of(context).colorWarning);
      case AntAlertType.error:
        return Icon(Icons.error, color: AntTheme.of(context).colorError);
      default:
        return null;
    }
  }

  Widget? get message{
    if(widget.message != null){
      return widget.message;
    }
    if(widget.messageText != null){
      return Text(widget.messageText!);
    }
  }

  bool get showDescription{
    return widget.description != null || widget.descriptionText != null;
  }

  Widget? get description{
    if(widget.description != null){
      return widget.description;
    }
    if(widget.descriptionText != null){
      return Text(widget.descriptionText!);
    }
    return null;
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
            crossAxisAlignment:
            (showDescription)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
            children: [
              if (widget.showIcon == true)
                Container(margin: EdgeInsets.only(right: 8), child: icon()),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: message,
                    ),
                    if (showDescription)
                      Container(child: description),
                  ],
                ),
              ),
              if (widget.closable == true)
                GestureDetector(
                  onTap: () {
                    widget.onClose?.call();
                  },
                  child: Icon(Icons.close),
                ),
            ],
          ),
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
      case AntAlertType.info:
        return AntTheme.of(context).colorPrimary;
      case AntAlertType.success:
        return AntTheme.of(context).colorSuccess;
      case AntAlertType.warning:
        return AntTheme.of(context).colorWarning;
      case AntAlertType.error:
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

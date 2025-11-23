import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntVerificationCodeInput extends StatefulWidget {
  const AntVerificationCodeInput({
    super.key,
    this.style,
    this.size = AntSize.middle,
    this.height,
    this.placeholder,
    this.type = AntInputType.text,
    this.prefix,

    this.value,
    this.defaultValue,
    this.onChange,
    this.decoration,
    this.sendText = "获取验证码",
    this.resendText = "重新发送",
    this.waitSeconds = 60,
    this.onBlur,
    this.onFocus,
  });

  final StateStyle? style;
  final AntSize size;
  final double? height;
  final String? placeholder;
  final AntInputType? type;
  final Widget? prefix;

  final String? value;
  final String? defaultValue;
  final Function? onChange;
  final BoxDecoration? decoration;
  final String? sendText;
  final String? resendText;
  final int? waitSeconds;

  final VoidCallback? onBlur;
  final VoidCallback? onFocus;

  @override
  State<StatefulWidget> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<AntVerificationCodeInput> {
  @override
  Widget build(BuildContext context) {
    return AntInput(
      suffix: Text(widget.sendText!),
    );
  }
}

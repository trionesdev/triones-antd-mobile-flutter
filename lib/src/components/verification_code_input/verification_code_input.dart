import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntVerificationCodeInput extends StatefulWidget {
  const AntVerificationCodeInput({
    super.key,
    this.style,
    this.size = AntSize.middle,
    this.height  ,
    this.placeholder,
    this.type = AntInputType.text,
    this.prefix,

    this.value,
    this.defaultValue,
    this.onChange,
    this.decoration,
    this.sendText = "获取验证码",
    this.resendText = "重新发送",
    this.intervalSeconds = 60,
    this.onBlur,
    this.onFocus,
    this.onSend,
  });

  final StateStyle? style;
  final AntSize size;
  final double? height;
  final String? placeholder;
  final AntInputType? type;
  final Widget? prefix;

  final String? value;
  final String? defaultValue;
  final ValueChanged<String>? onChange;
  final BoxDecoration? decoration;
  final String? sendText;
  final String? resendText;
  final int? intervalSeconds;

  final ValueGetter<void>? onBlur;
  final ValueGetter<void>? onFocus;
  final  AsyncValueGetter<bool>? onSend;

  @override
  State<StatefulWidget> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<AntVerificationCodeInput> {
  late int _intervalSeconds = 0;
  late bool _isResend = false;
  Timer? _timer;

  void start() {
    setState(() {
      _intervalSeconds = widget.intervalSeconds! - 1;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_intervalSeconds > 0) {
          _intervalSeconds--;
        } else {
          _isResend = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget get text {
    if (_intervalSeconds > 0) {
      return Text("${_intervalSeconds}s", style: TextStyle(color: Colors.grey));
    }
    return Text(_isResend ? widget.resendText! : widget.sendText!);
  }

  @override
  Widget build(BuildContext context) {
    return AntInput(
      style: widget.style,
      size: widget.size,
      height: widget.height,
      placeholder: widget.placeholder,
      type: widget.type,
      prefix: widget.prefix,
      value: widget.value,
      defaultValue: widget.defaultValue,
      onChange: widget.onChange,
      decoration: widget.decoration,
      onBlur: widget.onBlur,
      onFocus: widget.onFocus,
      suffix: GestureDetector(
        onTap: () {
          if (_timer == null || !_timer!.isActive) {
            if (widget.onSend != null) {
              widget.onSend!().then((value) {
                if (value) {
                  start();
                }
              });
            } else {
              start();
            }
          }
        },
        child: text,
      ),
    );
  }
}

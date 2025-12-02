import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

/// @component VerificationCodeInput 验证码输入框
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
    this.intervalSeconds = 60,
    this.onBlur,
    this.onFocus,
    this.onSend,
  });

  /// @description 样式
  /// @default null
  final StateStyle? style;

  /// @description 大小
  /// @default middle
  final AntSize size;

  /// @description 高度
  /// @default null
  final double? height;

  /// @description 占位符
  /// @default null
  final String? placeholder;

  /// @description 输入框类型
  /// @default text
  final AntInputType? type;

  /// @description 前缀
  /// @default null
  final Widget? prefix;

  /// @description 值
  /// @default null
  final String? value;

  /// @description 默认值
  /// @default null
  final String? defaultValue;

  /// @description 值改变回调
  /// @default null
  final ValueChanged<String>? onChange;

  /// @description 输入框样式
  /// @default null
  final BoxDecoration? decoration;

  /// @description 发送按钮文本
  /// @default 获取验证码
  final String? sendText;

  /// @description 重新发送按钮文本
  /// @default 重新发送
  final String? resendText;

  /// @description 验证码发送间隔
  /// @default 60
  final int? intervalSeconds;

  /// @description 输入框失去焦点回调
  /// @default null
  final ValueGetter<void>? onBlur;
  /// @description 输入框获取焦点回调
  /// @default null
  final ValueGetter<void>? onFocus;
  /// @description 验证码发送回调
  /// @default null
  final AsyncValueGetter<bool>? onSend;

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

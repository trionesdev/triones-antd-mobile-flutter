import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

/// @component AntInputNumber 数字输入框
class AntInputNumber extends StatefulWidget {
  const AntInputNumber({
    super.key,
    this.size = AntSize.middle,
    this.step = 1,
    this.min,
    this.max,
    this.keyboard = true,
    this.defaultValue = 0,
    this.value,
    this.disabled = false,
    this.onChange,
  });

  /// @description 组件大小
  /// @default middle
  final AntSize size;

  /// @description 默认值
  /// @default null
  final num? defaultValue;

  /// @description 当前值
  /// @default null
  final num? value;

  /// @description 最小值
  /// @default null
  final double? min;

  /// @description 最大值
  /// @default null
  final double? max;

  /// @description 步长
  /// @default 1
  final num step;

  /// @description 是否使用键盘
  /// @default true
  final bool keyboard;

  /// @description 是否禁用
  /// @default false
  final bool disabled;

  /// @description 值改变回调
  /// @default null
  final Function(num val)? onChange;

  @override
  State<StatefulWidget> createState() => _AntInputNumberState();
}

class _AntInputNumberState extends State<AntInputNumber> {
  TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  num _value = 0;

  double get _height {
    switch (widget.size) {
      case AntSize.large:
        return 48;
      case AntSize.middle:
        return 32;
      case AntSize.small:
        return 24;
    }
  }

  bool get _isMin {
    if (widget.min != null) {
      return _value <= widget.min!;
    }
    return false;
  }

  bool get _isMax {
    if (widget.max != null) {
      return _value >= widget.max!;
    }
    return false;
  }

  void changeValue(num value) {
    if (widget.min != null && value < widget.min!) {
      value = widget.min!;
    }
    if (_value == value) {
      return;
    }
    setState(() {
      _value = value;
      _controller.text = _value.toString();
    });
    widget.onChange?.call(value);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // 获取焦点时全选文本
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // _controller.selection = TextSelection.collapsed(offset: 0);
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? widget.defaultValue ?? 0;
    _focusNode.addListener(_onFocusChange);
    _controller = TextEditingController(text: _value.toString());
    widget.onChange?.call(_value);
  }

  @override
  void didUpdateWidget(covariant AntInputNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _value = widget.value ?? widget.defaultValue ?? 0;
      _controller.text = _value.toString();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        height: _height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(theme.borderRadius),
        ),
        constraints: BoxConstraints(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if (widget.disabled) {
                  return;
                }
                var newValue = _value - widget.step;
                if (widget.min != null && newValue < widget.min!) {
                  newValue = widget.min!;
                }
                if (_value == newValue) {
                  return;
                }
                changeValue(newValue);
              },
              child: Container(
                width: _height,
                height: _height,
                child: Icon(
                  AntIcons.minusOutline,
                  size: _height / 2,
                  color:
                      widget.disabled
                          ? Colors.grey
                          : (_isMin ? Colors.grey : null),
                ),
              ),
            ),
            Container(
              // width: 24,
              constraints: BoxConstraints(maxWidth: 32, minWidth: 24),
              child: EditableText(
                readOnly: widget.disabled,
                controller: _controller,
                focusNode: _focusNode,
                style: TextStyle(
                  color: widget.disabled ? Colors.grey : Colors.black,
                ),
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                backgroundCursorColor: Colors.grey,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onTapOutside: (event) {
                  _focusNode.unfocus();
                },
                onChanged: (val) {
                  changeValue(num.tryParse(val) ?? _value);
                },
                keyboardType: widget.keyboard ? TextInputType.number : null,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.disabled) {
                  return;
                }
                var newValue = _value + widget.step;
                if (widget.max != null && newValue > widget.max!) {
                  newValue = widget.max!;
                }
                if (_value == newValue) {
                  return;
                }
                changeValue(newValue);
              },
              child: Container(
                width: _height,
                height: _height,
                child: Icon(
                  AntIcons.addOutline,
                  size: _height / 2,
                  color:
                      widget.disabled
                          ? Colors.grey
                          : (_isMax ? Colors.grey : null),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AntInputNumberStyle extends StateStyle {}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../constants.dart';

/// @component AntStepper 步进器
class AntStepper extends StatefulWidget {
  const AntStepper({
    super.key,
    this.size = AntSize.medium,
    this.step = 1,
    this.min,
    this.max,
    this.digits,
    this.defaultValue = 0,
    this.value,
    this.disabled = false,
    this.inputReadOnly = false,
    this.allowEmpty = false,
    this.onChange,
    this.onFocus,
    this.onBlur,
  });

  /// @description 组件大小
  /// @default medium
  final AntSize size;

  /// @description 默认值
  /// @default 0
  final num? defaultValue;

  /// @description 当前值（受控）
  /// @default null
  final num? value;

  /// @description 最小值
  /// @default null
  final num? min;

  /// @description 最大值
  /// @default null
  final num? max;

  /// @description 步长
  /// @default 1
  final num step;

  /// @description 小数位数，为 null 时不强制固定位数
  /// @default null
  final int? digits;

  /// @description 是否禁用
  /// @default false
  final bool disabled;

  /// @description 输入框是否只读（仅可通过加减按钮调整）
  /// @default false
  final bool inputReadOnly;

  /// @description 是否允许清空
  /// @default false
  final bool allowEmpty;

  /// @description 值改变回调
  /// @default null
  final ValueChanged<num?>? onChange;

  /// @description 获得焦点回调
  /// @default null
  final VoidCallback? onFocus;

  /// @description 失去焦点回调
  /// @default null
  final VoidCallback? onBlur;

  @override
  State<AntStepper> createState() => _AntStepperState();
}

class _AntStepperState extends State<AntStepper> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  num? _value;
  bool _focused = false;

  double get _height {
    switch (widget.size) {
      case AntSize.large:
        return sizeLg;
      case AntSize.medium:
        return sizeMd;
      case AntSize.small:
        return sizeSm;
    }
  }

  double get _fontSize {
    switch (widget.size) {
      case AntSize.large:
        return 17;
      case AntSize.medium:
        return 15;
      case AntSize.small:
        return 13;
    }
  }

  double get _inputWidth {
    switch (widget.size) {
      case AntSize.large:
        return 52;
      case AntSize.medium:
        return 44;
      case AntSize.small:
        return 36;
    }
  }

  bool get _minusDisabled {
    if (widget.disabled) return true;
    if (_value == null) return false;
    if (widget.min != null) return _value! <= widget.min!;
    return false;
  }

  bool get _plusDisabled {
    if (widget.disabled) return true;
    if (_value == null) return false;
    if (widget.max != null) return _value! >= widget.max!;
    return false;
  }

  String _formatValue(num? value) {
    if (value == null) return '';
    if (widget.digits != null) {
      return value.toStringAsFixed(widget.digits!);
    }
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  num? _clamp(num? value) {
    if (value == null) return null;
    num result = value;
    if (widget.min != null && result < widget.min!) {
      result = widget.min!;
    }
    if (widget.max != null && result > widget.max!) {
      result = widget.max!;
    }
    if (widget.digits != null) {
      result = num.parse(result.toStringAsFixed(widget.digits!));
    }
    return result;
  }

  void _syncController(num? value, {bool force = false}) {
    final text = _formatValue(value);
    if (force || _controller.text != text) {
      _controller.value = TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
  }

  void _setValue(num? value, {bool format = true}) {
    final next = _clamp(value);
    if (_value == next) {
      if (format && !_focused) {
        _syncController(_value);
      }
      return;
    }
    setState(() {
      _value = next;
      if (format || !_focused) {
        _syncController(_value, force: true);
      }
    });
    widget.onChange?.call(_value);
  }

  void _offset(bool increase) {
    if (widget.disabled) return;
    final current = _value ?? 0;
    final next = increase ? current + widget.step : current - widget.step;
    _setValue(next);
  }

  void _onFocusChange() {
    final hasFocus = _focusNode.hasFocus;
    if (_focused == hasFocus) return;
    setState(() {
      _focused = hasFocus;
    });
    if (hasFocus) {
      widget.onFocus?.call();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_focusNode.hasFocus) return;
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      });
    } else {
      // 失焦时规范化：空值回退 / 格式化显示
      if (_controller.text.isEmpty) {
        if (widget.allowEmpty) {
          _setValue(null);
        } else {
          _setValue(widget.defaultValue ?? widget.min ?? 0);
        }
      } else {
        final parsed = num.tryParse(_controller.text);
        _setValue(parsed ?? _value);
      }
      widget.onBlur?.call();
    }
  }

  void _onInputChanged(String text) {
    if (text.isEmpty) {
      if (widget.allowEmpty) {
        setState(() {
          _value = null;
        });
        widget.onChange?.call(null);
      }
      return;
    }
    // 允许输入中间态，如 "-"、"1."
    if (text == '-' || text.endsWith('.')) {
      return;
    }
    final parsed = num.tryParse(text);
    if (parsed == null) return;
    final next = _clamp(parsed);
    if (_value == next) return;
    setState(() {
      _value = next;
    });
    widget.onChange?.call(_value);
  }

  List<TextInputFormatter> get _inputFormatters {
    if (widget.digits == 0) {
      return [FilteringTextInputFormatter.allow(RegExp(r'^-?\d*'))];
    }
    return [FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*'))];
  }

  num? get _initialValue {
    if (widget.value != null) return widget.value;
    if (widget.defaultValue != null) return widget.defaultValue;
    if (widget.allowEmpty) return null;
    return 0;
  }

  @override
  void initState() {
    super.initState();
    _value = _clamp(_initialValue);
    _controller = TextEditingController(text: _formatValue(_value));
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(covariant AntStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 受控：父组件传入 value（含 null）时同步
    if (widget.value != oldWidget.value) {
      _value = widget.value != null || widget.allowEmpty
          ? _clamp(widget.value)
          : _clamp(_initialValue);
      if (!_focused) {
        _syncController(_value, force: true);
      }
    } else if (widget.digits != oldWidget.digits && !_focused) {
      _syncController(_value, force: true);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Widget _buildButton({
    required IconData icon,
    required bool disabled,
    required VoidCallback onTap,
    required AntThemeData theme,
    required bool isLeft,
  }) {
    final radius = BorderRadius.horizontal(
      left: isLeft ? Radius.circular(theme.borderRadius) : Radius.zero,
      right: isLeft ? Radius.zero : Radius.circular(theme.borderRadius),
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: disabled ? null : onTap,
        borderRadius: radius,
        child: SizedBox(
          width: _height,
          height: _height,
          child: Icon(
            icon,
            size: _height / 2.2,
            color: disabled
                ? theme.colorTextPlaceholder
                : theme.colorTextBase,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context);
    final borderColor = theme.colorBorder;
    final readOnly = widget.disabled || widget.inputReadOnly;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: _height,
        decoration: BoxDecoration(
          color: theme.colorFillTertiary,
          borderRadius: BorderRadius.circular(theme.borderRadius),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton(
              icon: AntIcons.minusOutline,
              disabled: _minusDisabled,
              onTap: () => _offset(false),
              theme: theme,
              isLeft: true,
            ),
            Container(
              width: 1,
              height: _height,
              color: borderColor,
            ),
            Container(
              width: _inputWidth,
              height: _height,
              color: theme.colorBgContainer,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: EditableText(
                readOnly: readOnly,
                controller: _controller,
                focusNode: _focusNode,
                style: TextStyle(
                  fontSize: _fontSize,
                  height: 1.2,
                  color: widget.disabled
                      ? theme.colorTextPlaceholder
                      : theme.colorTextBase,
                ),
                textAlign: TextAlign.center,
                cursorColor: theme.colorPrimary,
                backgroundCursorColor: theme.colorFillSecondary,
                inputFormatters: _inputFormatters,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                onTapOutside: (_) => _focusNode.unfocus(),
                onChanged: readOnly ? (_) {} : _onInputChanged,
              ),
            ),
            Container(
              width: 1,
              height: _height,
              color: borderColor,
            ),
            _buildButton(
              icon: AntIcons.addOutline,
              disabled: _plusDisabled,
              onTap: () => _offset(true),
              theme: theme,
              isLeft: false,
            ),
          ],
        ),
      ),
    );
  }
}

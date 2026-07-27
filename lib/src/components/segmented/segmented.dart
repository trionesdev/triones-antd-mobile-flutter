import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

/// 分段控制器选项
class AntSegmentedOption {
  const AntSegmentedOption({
    this.label,
    this.labelText,
    required this.value,
    this.icon,
    this.disabled = false,
  });

  /// @description 分段项的显示内容
  /// @default null
  final Widget? label;

  /// @description 分段项的显示文本
  /// @default null
  final String? labelText;

  /// @description 分段项的值
  final dynamic value;

  /// @description 分段项的图标
  /// @default null
  final Widget? icon;

  /// @description 是否禁用
  /// @default false
  final bool disabled;
}

/// @component AntSegmented 分段控制器
class AntSegmented extends StatefulWidget {
  const AntSegmented({
    super.key,
    required this.options,
    this.block = false,
    this.disabled = false,
    this.defaultValue,
    this.value,
    this.onChange,
  });

  /// @description 选项列表
  final List<AntSegmentedOption> options;

  /// @description 将宽度调整为父元素宽度
  /// @default false
  final bool block;

  /// @description 是否禁用
  /// @default false
  final bool disabled;

  /// @description 默认选中的值
  /// @default null
  final dynamic defaultValue;

  /// @description 当前选中的值（受控）
  /// @default null
  final dynamic value;

  /// @description 选中值变化回调
  /// @default null
  final ValueChanged<dynamic>? onChange;

  @override
  State<AntSegmented> createState() => _AntSegmentedState();
}

class _AntSegmentedState extends State<AntSegmented> {
  dynamic _internalValue;

  bool get _isControlled => widget.value != null;

  dynamic get _selectedValue =>
      _isControlled ? widget.value : _internalValue;

  dynamic _firstEnabledValue(List<AntSegmentedOption> options) {
    for (final option in options) {
      if (!option.disabled) {
        return option.value;
      }
    }
    return null;
  }

  bool _isValidSelection(dynamic value, List<AntSegmentedOption> options) {
    if (value == null) {
      return false;
    }
    return options.any((o) => o.value == value && !o.disabled);
  }

  void _syncInternalValue({bool forceFromDefault = false}) {
    if (_isControlled) {
      return;
    }
    if (forceFromDefault && widget.defaultValue != null) {
      _internalValue = widget.defaultValue;
      return;
    }
    if (widget.defaultValue != null &&
        _isValidSelection(widget.defaultValue, widget.options)) {
      _internalValue = widget.defaultValue;
      return;
    }
    if (_isValidSelection(_internalValue, widget.options)) {
      return;
    }
    _internalValue = _firstEnabledValue(widget.options);
  }

  @override
  void initState() {
    super.initState();
    if (!_isControlled) {
      _internalValue = widget.defaultValue ?? _firstEnabledValue(widget.options);
    }
  }

  @override
  void didUpdateWidget(AntSegmented oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isControlled &&
        (oldWidget.defaultValue != widget.defaultValue ||
            oldWidget.options != widget.options)) {
      setState(() {
        _syncInternalValue();
      });
    }
  }

  void _handleSelect(AntSegmentedOption option) {
    if (widget.disabled || option.disabled) {
      return;
    }
    if (!_isControlled) {
      setState(() {
        _internalValue = option.value;
      });
    }
    widget.onChange?.call(option.value);
  }

  Widget _buildLabel(AntSegmentedOption option, Color color) {
    if (option.label != null) {
      if (option.label is Text) {
        final Text source = option.label as Text;
        return WidgetUtils.textMerge(
          Text(
            source.data ?? '',
            style: TextStyle(color: color, fontSize: 14, height: 28 / 14),
          ),
          source,
        );
      }
      return option.label!;
    }
    if (option.labelText != null) {
      return Text(
        option.labelText!,
        style: TextStyle(color: color, fontSize: 14, height: 28 / 14),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final AntThemeData theme = AntTheme.of(context);
    final selectedValue = _selectedValue;

    Widget segmented = Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: theme.colorFillTertiary,
        borderRadius: BorderRadius.circular(theme.borderRadius),
      ),
      child: Row(
        mainAxisSize: widget.block ? MainAxisSize.max : MainAxisSize.min,
        children: [
          for (final option in widget.options)
            _SegmentedItem(
              option: option,
              block: widget.block,
              rootDisabled: widget.disabled,
              active: option.value != null && selectedValue == option.value,
              theme: theme,
              onTap: () => _handleSelect(option),
              labelBuilder: (color) => _buildLabel(option, color),
            ),
        ],
      ),
    );

    if (widget.disabled) {
      segmented = Opacity(opacity: 0.45, child: segmented);
    }

    if (widget.block) {
      return SizedBox(width: double.infinity, child: segmented);
    }
    return segmented;
  }
}

class _SegmentedItem extends StatelessWidget {
  const _SegmentedItem({
    required this.option,
    required this.block,
    required this.rootDisabled,
    required this.active,
    required this.theme,
    required this.onTap,
    required this.labelBuilder,
  });

  final AntSegmentedOption option;
  final bool block;
  final bool rootDisabled;
  final bool active;
  final AntThemeData theme;
  final VoidCallback onTap;
  final Widget Function(Color color) labelBuilder;

  bool get _itemDisabled => rootDisabled || option.disabled;

  @override
  Widget build(BuildContext context) {
    final Color textColor;
    if (_itemDisabled && !active) {
      textColor = theme.colorTextQuaternary;
    } else if (active) {
      textColor = theme.colorText;
    } else {
      textColor = theme.colorTextSecondary;
    }

    final Widget content = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 11),
      constraints: const BoxConstraints(minHeight: 28),
      decoration: BoxDecoration(
        color: active ? theme.colorBgBase : Colors.transparent,
        borderRadius: BorderRadius.circular(theme.borderRadiusSM),
        boxShadow: active
            ? const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: block ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (option.icon != null) ...[
            IconTheme(
              data: IconThemeData(color: textColor, size: 14),
              child: option.icon!,
            ),
            if (option.label != null || option.labelText != null)
              const SizedBox(width: 4),
          ],
          if (block)
            Flexible(child: labelBuilder(textColor))
          else
            labelBuilder(textColor),
        ],
      ),
    );

    final Widget tappable = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _itemDisabled ? null : onTap,
      child: content,
    );

    if (block) {
      return Expanded(child: tappable);
    }
    return tappable;
  }
}

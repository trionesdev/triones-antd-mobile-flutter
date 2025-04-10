import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AntInputNumber extends StatefulWidget {
  const AntInputNumber({super.key,
    this.step = 1,
    this.min,
    this.max,
    this.keyboard = true,
    this.defaultValue = 0,
    this.value,
    this.iconSize = 20,
    this.onChange});

  final double? defaultValue;
  final double? value;
  final double? min;
  final double? max;
  final double step;
  final bool keyboard;
  final double iconSize;
  final Function(double val)? onChange;

  @override
  State<StatefulWidget> createState() => _AntInputNumberState();
}

class _AntInputNumberState extends State<AntInputNumber> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  double _value = 0;

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

  void changeValue(double val) {
    setState(() {
      _value = val;
    });
    _controller.text = _value.toString();
    widget.onChange?.call(val);
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? widget.defaultValue ?? 0;
    _controller = TextEditingController(text: _value.toString());
  }

  @override
  void didUpdateWidget(covariant AntInputNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      changeValue(widget.value ?? widget.defaultValue ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              var newValue = _value - widget.step;
              if (widget.min != null && newValue < widget.min!) {
                newValue = widget.min!;
              }
              if (_value == newValue) {
                return;
              }
              changeValue(newValue);
            },
            child: Icon(
              Icons.remove,
              size: widget.iconSize,
              color: _isMin ? Colors.grey : null,
            ),
          ),
          Container(
            // width: 24,
            constraints: BoxConstraints(maxWidth: 32, minWidth: 24),
            child: EditableText(
              controller: _controller,
              focusNode: _focusNode,
              style: TextStyle(),
              textAlign: TextAlign.center,
              cursorColor: Colors.grey,
              backgroundCursorColor: Colors.grey,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onTapOutside: (event) {
                _focusNode.unfocus();
              },
              onChanged: (val) {
                changeValue(double.tryParse(val) ?? _value);
              },
              keyboardType: widget.keyboard ? TextInputType.number : null,
            ),
          ),
          GestureDetector(
            onTap: () {
              var newValue = _value + widget.step;
              if (widget.max != null && newValue > widget.max!) {
                newValue = widget.max!;
              }
              if (_value == newValue) {
                return;
              }
              changeValue(newValue);
            },
            child: Icon(
              Icons.add,
              size: widget.iconSize,
              color: _isMax ? Colors.grey : null,
            ),
          )
        ],
      ),
    );
  }
}

class _AntInputNumberStyle extends StateStyle {}

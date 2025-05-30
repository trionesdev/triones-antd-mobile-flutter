import 'package:flutter/material.dart';

class AntRate extends StatefulWidget {
  const AntRate({super.key,
    this.disabled = false,
    this.count = 5,
    this.allowHalf = false,
    this.defaultValue,
    this.value,
    this.onChange,
    this.fullIcon,
    this.emptyIcon,
    this.iconSize = 24});

  final bool disabled;
  final Widget? fullIcon;
  final Widget? emptyIcon;
  final double? defaultValue;
  final double? value;
  final int count;
  final bool allowHalf;
  final double iconSize;
  final Function(double val)? onChange;

  @override
  State<StatefulWidget> createState() => _AntRateState();

  static _AntRateState? maybeOf(BuildContext context) {
    _RateScope? scope =
    context.dependOnInheritedWidgetOfExactType<_RateScope>();
    return scope?._rateState;
  }
}

class _AntRateState extends State<AntRate> {
  GlobalKey _key = GlobalKey();
  int _generation = 0;
  double _value = 0;
  RenderBox? _renderBox;
  Offset? _localOffset = Offset(0, 0);

  final Set<_RateItemState> rateItemStates = <_RateItemState>{};

  void _register(_RateItemState itemState) {
    rateItemStates.add(itemState);
  }

  Offset? _getLocalPosition(Offset offset) {
    if (_renderBox != null) {
      return _renderBox!.globalToLocal(offset);
    }
    return null;
  }

  void _pointPositionChange(Offset offset) {
    if (_localOffset != null) {
      if (offset.dx < _localOffset!.dx) {
        setState(() {
          _value = 0;
        });
      } else if (offset.dx > _localOffset!.dx) {
        setState(() {
          _value = widget.count.toDouble();
        });
      }
    }
    if (rateItemStates.isNotEmpty) {
      for (var itemState in rateItemStates) {
        itemState._pointPositionChange(offset);
      }
    }
  }

  List<Widget> _generateChildren() {
    return List.generate(widget.count, (index) {
      return _RateItem(
        disabled: widget.disabled,
        iconSize: widget.iconSize,
        index: index,
        allowHalf: widget.allowHalf,
        value: _value,
        onValueChange: (val) {
          setState(() {
            _value = val;
          });
          widget.onChange?.call(val);
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.value ?? widget.defaultValue ?? 0;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox =
      _key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        _renderBox = renderBox;
      }
    });
  }

  @override
  void didUpdateWidget(covariant AntRate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() {
        _value = widget.value ?? widget.defaultValue ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onPanUpdate: widget.disabled ? null : (details) {
          _pointPositionChange(
              _renderBox!.globalToLocal(details.globalPosition));
        },
        child: _RateScope(
            generation: _generation,
            rateState: this,
            child: Row(
              key: _key,
              children: _generateChildren(),
            )),
      ),
    );
  }
}

class _RateScope extends InheritedWidget {
  const _RateScope({required super.child,
    required _AntRateState rateState,
    required int generation})
      : _rateState = rateState,
        _generation = generation;
  final _AntRateState? _rateState;
  final int _generation;

  @override
  bool updateShouldNotify(covariant _RateScope oldWidget) {
    return oldWidget._generation != _generation;
  }
}

class _RateItem extends StatefulWidget {
  const _RateItem({
    this.disabled,
    required this.index,
    required this.allowHalf,
    this.value = 0,
    required this.onValueChange,
    this.fullIcon,
    this.emptyIcon,
    required this.iconSize,
  });

  final bool? disabled;
  final Widget? fullIcon;
  final Widget? emptyIcon;
  final int index;
  final bool allowHalf;
  final double value;
  final Function(double val) onValueChange;
  final double iconSize;

  @override
  State<StatefulWidget> createState() => _RateItemState();
}

class _RateItemState extends State<_RateItem> {
  _AntRateState? _rateState;
  double _value = 0;
  Offset? _globalOffset;
  Offset? _localOffset;
  RenderBox? _renderBox;

  void _pointPositionChange(Offset offset) {
    if (offset.dx > _localOffset!.dx &&
        offset.dx <= _localOffset!.dx + _renderBox!.size.width &&
        offset.dy > _localOffset!.dy &&
        offset.dy <= _localOffset!.dy + _renderBox!.size.height) {
      if (widget.allowHalf) {
        if (_localOffset!.dx <= offset.dx &&
            offset.dx <= (_localOffset!.dx + _renderBox!.size.width / 2)) {
          widget.onValueChange.call(widget.index + 0.5);
        } else {
          widget.onValueChange.call(widget.index + 1);
        }
      } else {
        widget.onValueChange.call(widget.index + 1);
      }
    }
  }

  Widget _item() {
    if (_value >= widget.index + 1) {
      return widget.fullIcon ?? _DefaultFullIcon(iconSize: widget.iconSize);
    } else {
      if (widget.index < _value && _value < widget.index + 1) {
        return _DefaultHalfIcon(
          value: _value - widget.index,
          fullIcon: widget.fullIcon,
          emptyIcon: widget.emptyIcon,
          iconSize: widget.iconSize,
        );
      }
      return widget.emptyIcon ?? _DefaultEmptyIcon(iconSize: widget.iconSize);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.value ?? 0;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        _renderBox = renderBox;
        _globalOffset = renderBox.localToGlobal(Offset.zero);
        _localOffset =
            _rateState?._getLocalPosition(renderBox.localToGlobal(Offset.zero));
      }
    });
  }

  @override
  void didUpdateWidget(covariant _RateItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() {
        _value = widget.value;
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        _renderBox = renderBox;
        _globalOffset = renderBox.localToGlobal(Offset.zero);
        _localOffset =
            _rateState?._getLocalPosition(renderBox.localToGlobal(Offset.zero));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _rateState = AntRate.maybeOf(context);
    _rateState?._register(this);
    return GestureDetector(
      onTapUp: (widget.disabled ?? false) ? null : (details) {
        if (widget.allowHalf) {
          Offset? offset =
          _rateState?._getLocalPosition(details.globalPosition); //转换成相对偏移量
          if (offset != null) {
            if (_localOffset!.dx <= offset!.dx &&
                offset.dx <= (_localOffset!.dx + _renderBox!.size.width / 2)) {
              //点击位置在左侧

              if (_value <= widget.index) {
                //当前值在当前位之前，则为当前半值
                widget.onValueChange.call(widget.index + 0.5);
              } else if (widget.index < _value &&
                  _value <= widget.index + 0.5) {
                //当前值为当前位半值，则归0
                widget.onValueChange.call(0);
              } else if (_value > widget.index + 0.5) {
                //当前值大于当前位半值，为当前半值
                widget.onValueChange.call(widget.index + 0.5);
              } else {
                print("左侧其他情况");
              }
            } else {
              //点击位置在右侧
              if (_value > widget.index + 1) {
                //原值大于当前满值，则为当前满值
                widget.onValueChange.call(widget.index + 1);
              } else if (widget.index + 0.5 < _value &&
                  _value <= widget.index + 1) {
                //原值是当前满值，则归0
                widget.onValueChange.call(0);
              } else if (_value <= widget.index + 0.5) {
                //原值小于当前半值，则为当前满值
                widget.onValueChange.call(widget.index + 1);
              } else {
                print("右侧其他情况");
              }
            }
          }
        } else {
          if (_value == widget.index + 1) {
            widget.onValueChange.call(0);
          } else {
            widget.onValueChange.call(widget.index + 1);
          }
        }
      },
      child: SizedBox(
        width: widget.iconSize,
        height: widget.iconSize,
        child: _item(),
      ),
    );
  }
}

class _DefaultFullIcon extends StatelessWidget {
  const _DefaultFullIcon({required this.iconSize});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.yellow,
      size: iconSize,
    );
  }
}

class _DefaultHalfIcon extends StatelessWidget {
  const _DefaultHalfIcon({required this.value,
    this.fullIcon,
    this.emptyIcon,
    required this.iconSize});

  final double value;
  final Widget? fullIcon;
  final Widget? emptyIcon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          emptyIcon ??
              _DefaultEmptyIcon(
                iconSize: iconSize,
              ),
          Positioned.fill(
            left: 0,
            child: FractionallySizedBox(
              widthFactor: value,
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                child: fullIcon ??
                    _DefaultFullIcon(
                      iconSize: iconSize,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DefaultEmptyIcon extends StatelessWidget {
  const _DefaultEmptyIcon({required this.iconSize});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.grey,
      size: iconSize,
    );
  }
}

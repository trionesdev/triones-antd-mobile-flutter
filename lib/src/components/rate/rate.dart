import 'package:flutter/material.dart';

class AntRate extends StatefulWidget {
  const AntRate(
      {super.key,
      this.count = 5,
      this.allowHalf = false,
      this.defaultValue = 0,
      this.value,
      this.onChange});

  final double? defaultValue;
  final double? value;
  final int count;
  final bool allowHalf;
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
  int _generation = 0;
  bool _isDragging = false;
  double _value = 0;
  Offset? _firstOffset;
  Offset? _lastOffset;

  final Set<_RateItemState> rateItemStates = <_RateItemState>{};

  void _register(_RateItemState itemState) {
    rateItemStates.add(itemState);
  }

  void _setFirstOffset(Offset? offset) {
    // print("first:"+offset?.toString());
    _firstOffset = offset;
  }

  void _setLastOffset(Offset? offset) {
    // print("last:"+offset!.toString());
    _lastOffset = offset;
  }

  void _pointPositionChange(Offset offset) {
    if (_firstOffset != null && offset.dx < _firstOffset!.dx) {
      setState(() {
        _value = 0;
      });
    }
    if (_lastOffset != null && offset.dx > _lastOffset!.dx) {
      setState(() {
        _value = widget.count as double;
      });
    }
    if (rateItemStates.isNotEmpty) {
      for (var itemState in rateItemStates) {
        itemState._pointPositionChange(offset);
      }
    }
  }

  List<Widget> _generateChildren() {
    return List.generate(widget.count, (index) {
      print(index);
      return _RateItem(
        index: index,
        isFirst: index == 0,
        isLast: index == widget.count - 1,
        allowHalf: widget.allowHalf,
        value: _value,
        onValueChange: (val) {
          print(val);
          setState(() {
            _value = val;
          });
          widget.onChange?.call(val);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        // onPanStart: (details) {
        //   print(details);
        //   _isDragging = true;
        // },
        onPanUpdate: (details) {
          print(details);
          // setState(() {
          //   // _pointGlobalPosition = details.globalPosition;
          // });
          _pointPositionChange(details.globalPosition);
        },
        // onPanEnd: (details) {
        //   print("onPanEnd");
        //   print(details);
        //   _isDragging = false;
        // },
        child: _RateScope(
            generation: _generation,
            rateState: this,
            child: Row(
              children: _generateChildren(),
            )),
      ),
    );
  }
}

class _RateScope extends InheritedWidget {
  const _RateScope(
      {super.key,
      required super.child,
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
    required this.index,
    required this.allowHalf,
    this.value = 0,
    required this.onValueChange,
    required this.isFirst,
    required this.isLast,
  });

  final bool isFirst;
  final bool isLast;
  final int index;
  final bool allowHalf;
  final double value;
  final Function(double val) onValueChange;

  @override
  State<StatefulWidget> createState() => _RateItemState();
}

class _RateItemState extends State<_RateItem> {
  Offset? _offset;
  RenderBox? _renderBox;

  void _pointPositionChange(Offset offset) {
    if (_offset != null && _renderBox != null) {
      if (offset.dx > _offset!.dx &&
          offset.dx <= _offset!.dx + _renderBox!.size.width &&
          offset.dy > _offset!.dy &&
          offset.dy <= _offset!.dy + _renderBox!.size.height) {
        print("in:" + widget.index.toString());
        if (widget.allowHalf) {
        } else {
          widget.onValueChange.call(widget.index + 1);
        }
      }
    }
  }

  Widget _item() {
    if (widget.value >= widget.index + 1) {
      return _DefaultFullIcon();
    } else {
      if (widget.index < widget.value && widget.value < widget.index + 1) {
        return _DefaultHalfIcon(widget.value - widget.index);
      }
      return _DefaultEmptyIcon();
    }
    if (widget.value >= (widget.index + 1)) {
      return _DefaultFullIcon();
    } else {
      return _DefaultEmptyIcon();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        _renderBox = renderBox;
        _offset = renderBox.localToGlobal(Offset.zero);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _AntRateState? rateState = AntRate.maybeOf(context);
    rateState?._register(this);
    print(_offset.toString());
    if (widget.isFirst && _offset != null && _renderBox != null) {
      rateState?._setFirstOffset(_offset);
    }
    if (widget.isLast && _offset != null && _renderBox != null) {
      rateState?._setLastOffset(
          Offset(_offset!.dx + _renderBox!.size.width, _offset!.dy));
    }
    return GestureDetector(
      onTapUp: (details) {
        if (widget.allowHalf) {
          if (_offset!.dx <= details.globalPosition.dx &&
              details.globalPosition.dx <=
                  (_offset!.dx + _renderBox!.size.width / 2)) {
            //点击位置在左侧
            print("ddd");

            if (widget.value <= widget.index) {
              //当前值在当前位之前，则为当前半值
              widget.onValueChange.call(widget.index + 0.5);
            } else if (widget.index < widget.value &&
                widget.value <= widget.index + 0.5) {
              //当前值为当前位半值，则归0
              widget.onValueChange.call(0);
            } else if (widget.value > widget.index + 0.5) {
              //当前值大于当前位半值，为当前半值
              widget.onValueChange.call(widget.index + 0.5);
            } else {
              print("左侧其他情况");
            }
          } else {
            //点击位置在右侧
            if (widget.value > widget.index + 1) {
              //原值大于当前满值，则为当前满值
              widget.onValueChange.call(widget.index + 1);
            } else if (widget.index + 0.5 < widget.value &&
                widget.value <= widget.index + 1) {
              //原值是当前满值，则归0
              widget.onValueChange.call(0);
            } else if (widget.value <= widget.index + 0.5) {
              //原值小于当前半值，则为当前满值
              widget.onValueChange.call(widget.index + 1);
            } else {
              print("右侧其他情况");
            }
          }
          details.globalPosition;
        } else {
          if (widget.value == widget.index + 1) {
            widget.onValueChange.call(0);
          } else {
            widget.onValueChange.call(widget.index + 1);
          }
        }
      },
      child: Container(
        child: _item(),
      ),
    );
  }
}

class _DefaultFullIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.star,
        color: Colors.yellow,
      ),
    );
  }
}

class _DefaultHalfIcon extends StatelessWidget {
  const _DefaultHalfIcon(this.value);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.star),
    );
  }
}

class _DefaultEmptyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.star,
        color: Colors.grey,
      ),
    );
  }
}

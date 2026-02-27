import 'package:flutter/material.dart';

import 'calendar_grid.dart';

/// @component CalendarGridTouchable 日历网格可滑动切换月份组件
class AntCalendarGridTouchable extends StatefulWidget {
  const AntCalendarGridTouchable({
    super.key,
    this.month,
    this.value,
    this.onChange,
    this.range = false,
    this.onSelected,
    this.onRendered,
    this.onMouthChange,
  });

  /// @description 月份
  /// @default null
  final DateTime? month;

  /// @description 选中值
  /// @default null
  final List<DateTime?>? value;

  /// @description 值改变
  /// @default null
  final ValueChanged<List<DateTime?>?>? onChange;

  /// @description 是否是范围模式
  /// @default false
  final bool range;

  /// @description 点击日期回调
  /// @default null
  final ValueSetter<DateTime>? onSelected;

  /// @description 月份切换回调
  /// @default null
  final ValueChanged<DateTime>? onMouthChange;

  /// @description 渲染完成回调，返回当前组件高度
  /// @default null
  final ValueChanged<double?>? onRendered;

  @override
  State<StatefulWidget> createState() => _AntCalendarGridTouchableState();
}

class _AntCalendarGridTouchableState extends State<AntCalendarGridTouchable> {
  late DateTime _currentMonth;
  List<DateTime> _mouths = [];
  PageController _controller = PageController();
  double? _pageHeight = 300;

  List<DateTime> generateMouths(DateTime dateTime) {
    return [
      DateTime(dateTime.year, dateTime.month - 1),
      DateTime(dateTime.year, dateTime.month),
      DateTime(dateTime.year, dateTime.month + 1),
    ];
  }

  int findMouthIndex(DateTime date) {
    for (int i = 0; i < _mouths.length; i++) {
      if (_mouths[i].year == date.year && _mouths[i].month == date.month) {
        return i;
      }
    }
    return 1;
  }

  void mouthChange(DateTime newMouth) {
    setState(() {
      _currentMonth = DateTime(newMouth.year, newMouth.month);
      _mouths = generateMouths(_currentMonth!);
      _controller.jumpToPage(1);
      widget.onMouthChange?.call(_currentMonth);
    });
  }

  @override
  void initState() {
    super.initState();

    _currentMonth = widget.month ?? DateTime.now();
    _mouths = generateMouths(_currentMonth!);
    _controller = PageController(initialPage: 1);
  }

  @override
  void didUpdateWidget(covariant AntCalendarGridTouchable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.month != widget.month) {
      _currentMonth = widget.month ?? DateTime.now();
      _mouths = generateMouths(_currentMonth!);
      _controller = PageController(initialPage: 1);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                height: _pageHeight,
                duration: Duration(milliseconds: 200),
                child: PageView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (index) {
                    if (index == 0) {
                      setState(() {
                        DateTime firstMouth = _mouths.first;
                        _currentMonth = firstMouth;
                        _mouths = generateMouths(firstMouth);
                        _controller.jumpToPage(1);
                        widget.onMouthChange?.call(_currentMonth);
                      });
                    } else if (index == _mouths.length - 1) {
                      setState(() {
                        DateTime lastMouth = _mouths.last;
                        _currentMonth = lastMouth;
                        _mouths = generateMouths(lastMouth);
                        _controller.jumpToPage(1);
                        widget.onMouthChange?.call(_currentMonth);
                      });
                    }
                  },
                  itemCount: _mouths.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: AntCalendarGrid(
                        month: _mouths[index],
                        range: widget.range,
                        value: widget.value,
                        onSelected: (date) {
                          widget.onSelected?.call(date);
                          setState(() {});
                          if (date.month != _currentMonth!.month) {
                            mouthChange(date);
                          }
                        },
                        onChange: (value) {
                          widget.onChange?.call(value);
                        },
                        onRendered: (height) {
                          if (_pageHeight != height) {
                            setState(() {
                              _pageHeight = height;
                            });
                            widget.onRendered?.call(height);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

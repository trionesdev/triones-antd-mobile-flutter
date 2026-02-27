import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:trionesdev_antd_mobile/src/components/calendar/calendar_grid_touchable.dart';

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({required this.month, this.onMouthChange});

  final DateTime month;
  final ValueChanged<DateTime>? onMouthChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  onMouthChange?.call(DateTime(month.year - 1, month.month));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("<<"),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  onMouthChange?.call(DateTime(month.year, month.month - 1));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("<"),
                ),
              ),
              Text(DateFormat("yyyy-MM").format(month)),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  onMouthChange?.call(DateTime(month.year, month.month + 1));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(">"),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  onMouthChange?.call(DateTime(month.year + 1, month.month));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(">>"),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 32,
          padding: EdgeInsets.all(4),
          child: Row(
            children:
                ["一", "二", "三", "四", "五", "六", "日"].map((weekday) {
                  return Expanded(child: Center(child: Text(weekday)));
                }).toList(),
          ),
        ),
      ],
    );
  }
}

/// @component Calendar 日历
class AntCalendar extends StatefulWidget {
  const AntCalendar({
    super.key,
    this.value,
    this.month,
    this.onChange,
    this.onRendered,
  });

  /// @description 选中月份
  /// @default null
  final DateTime? month;

  /// @description 选中日期
  /// @default null
  final DateTime? value;

  /// @description 选中日期变化回调
  /// @default null
  final ValueChanged<DateTime?>? onChange;

  /// @description 渲染完成回调，返回当前组件高度
  /// @default null
  final ValueChanged<double?>? onRendered;

  @override
  State<StatefulWidget> createState() => AntCalendarState();
}

class AntCalendarState extends State<AntCalendar> {
  late DateTime _currentMouth;
  late DateTime? _value;

  @override
  void initState() {
    _currentMouth = widget.month ?? widget.value ?? DateTime.now();
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CalendarHeader(
          month: _currentMouth,
          onMouthChange: (newMouth) {
            setState(() {
              _currentMouth = newMouth;
            });
          },
        ),
        AntCalendarGridTouchable(
          month: _currentMouth,
          value: (_value != null) ? [_value] : [],
          onMouthChange: (newMouth) {
            setState(() {
              _currentMouth = newMouth;
            });
          },
          onChange: (value) {
            setState(() {
              _value = value?.first;
            });
            widget.onChange?.call(value?.first);
          },
          onRendered: (height) {
            widget.onRendered?.call(height! + 72);
          },
        ),
      ],
    );
  }
}

/// @component CalendarRange 日历范围
class AntCalendarRange extends StatefulWidget {
  const AntCalendarRange({
    super.key,
    this.value,
    this.mouth,
    this.onChange,
    this.onRendered,
  });

  /// @description 选中月份
  /// @default null
  final DateTime? mouth;

  /// @description 选中日期
  /// @default null
  final List<DateTime?>? value;

  /// @description 选中日期变化回调
  /// @default null
  final ValueChanged<List<DateTime?>?>? onChange;

  /// @description 渲染完成回调，返回当前组件高度
  /// @default null
  final ValueChanged<double?>? onRendered;

  @override
  State<StatefulWidget> createState() => AntCalendarRangeState();
}

class AntCalendarRangeState extends State<AntCalendarRange> {
  late DateTime _currentMonth;
  late List<DateTime?>? _value;

  @override
  void initState() {
    _currentMonth = widget.mouth ?? DateTime.now();
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CalendarHeader(
          month: _currentMonth,
          onMouthChange: (newMouth) {
            setState(() {
              _currentMonth = newMouth;
            });
          },
        ),
        AntCalendarGridTouchable(
          month: _currentMonth,
          range: true,
          value: _value,
          onMouthChange: (newMouth) {
            setState(() {
              _currentMonth = newMouth;
            });
          },
          onChange: (value) {
            widget.onChange?.call(value);
          },
          onRendered: (height) {
            widget.onRendered?.call(height! + 72);
          },
        ),
      ],
    );
  }
}

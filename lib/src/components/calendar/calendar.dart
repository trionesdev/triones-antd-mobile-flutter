import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:trionesdev_antd_mobile/src/components/calendar/calendar_grid_touchable.dart';

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({required this.mouth, this.onMouthChange});

  final DateTime mouth;
  final ValueChanged<DateTime>? onMouthChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: 32,
        //   padding: EdgeInsets.all(4),
        //   child: Text(DateFormat("yyyy-MM").format(mouth)),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                onMouthChange?.call(DateTime(mouth.year - 1, mouth.month));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text("<<"),
              ),
            ),
            GestureDetector(
              onTap: () {
                onMouthChange?.call(DateTime(mouth.year, mouth.month - 1));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text("<"),
              ),
            ),
            Text(DateFormat("yyyy-MM").format(mouth)),
            GestureDetector(
              onTap: () {
                onMouthChange?.call(DateTime(mouth.year, mouth.month + 1));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(">"),
              ),
            ),
            GestureDetector(
              onTap: () {
                onMouthChange?.call(DateTime(mouth.year + 1, mouth.month));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(">>"),
              ),
            ),
          ],
        ),
        Container(
          height: 32,
          padding: EdgeInsets.all(4),
          child: Row(
            children: ["一", "二", "三", "四", "五", "六", "日"].map((weekday) {
              return Expanded(
                  child: Center(
                child: Text(weekday),
              ));
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class AntCalendar extends StatefulWidget {
  const AntCalendar(
      {super.key, this.value, this.mouth,  this.onChange});

  final DateTime? mouth;
  final DateTime? value;
  final ValueChanged<DateTime?>? onChange;

  @override
  State<StatefulWidget> createState() => AntCalendarState();
}

class AntCalendarState extends State<AntCalendar> {
  late DateTime _currentMouth;

  @override
  void initState() {
    _currentMouth = widget.mouth ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CalendarHeader(
          mouth: _currentMouth,
          onMouthChange: (newMouth) {
            setState(() {
              _currentMouth = newMouth;
            });
          },
        ),
        AntCalendarGridTouchable(
          mouth: _currentMouth,
          value: [widget.value],
          onChange: (value) {
            widget.onChange?.call(value?.first);
          },
        )
      ],
    );
  }
}

class AntCalendarRange extends StatefulWidget {
  const AntCalendarRange(
      {super.key, this.value, this.mouth,  this.onChange});

  final DateTime? mouth;
  final List<DateTime?>? value;
  final ValueChanged<List<DateTime?>?>? onChange;

  @override
  State<StatefulWidget> createState() => AntCalendarRangeState();
}

class AntCalendarRangeState extends State<AntCalendarRange> {
  late DateTime _currentMouth;

  @override
  void initState() {
    _currentMouth = widget.mouth ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CalendarHeader(mouth: _currentMouth),
        AntCalendarGridTouchable(
          range: true,
          value: widget.value,
          onChange: (value) {
            widget.onChange?.call(value);
          },
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntCalendarDateCell extends StatefulWidget {
  const AntCalendarDateCell(
      {super.key,
      required this.date,
      required this.mouth,
      this.value,
      this.range = false,
      this.onSelected});

  final List<DateTime?>? value;
  final bool range;
  final DateTime date;
  final DateTime mouth;
  final ValueSetter<DateTime>? onSelected;

  @override
  State<StatefulWidget> createState() => AntCalendarDateCellState();
}

class AntCalendarDateCellState extends State<AntCalendarDateCell> {
  bool overCurrentMonth() {
    return widget.date
            .isBefore(DateTime(widget.mouth.year, widget.mouth.month, 1)) ||
        widget.date
            .isAfter(DateTime(widget.mouth.year, widget.mouth.month + 1, 0));
  }

  bool selected() {
    if (widget.range) {
      var startDate = widget.value?.elementAtOrNull(0);
      var endDate = widget.value?.elementAtOrNull(1);
      return widget.date == startDate || widget.date == endDate;
    } else {
      var value = widget.value?.elementAtOrNull(0);
      return widget.date.day == value?.day &&
          widget.date.month == value?.month &&
          widget.date.year == value?.year;
    }
  }

  bool betweenSelectRange() {
    if ( !widget.range) {
      return false;
    }
    var startDate = widget.value?.elementAtOrNull(0);
    var endDate = widget.value?.elementAtOrNull(1);
    if (startDate == null || endDate == null) {
      return false;
    }
    return startDate.isBefore(widget.date) && endDate.isAfter(widget.date);
  }

  Color backgroundColor() {
    AntThemeData themeData = AntTheme.of(context);

    if (selected()) {
      return themeData.colorPrimary;
    } else if (betweenSelectRange()) {
      return themeData.colorPrimaryBg;
    } else if (overCurrentMonth()) {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }

  Color textColor() {
    if (overCurrentMonth()) {
      return Colors.grey;
    } else if (selected()) {
      return Colors.white;
    } else if (betweenSelectRange()) {
      return Colors.black;
    } else {
      return Colors.black;
    }
  }

  BorderRadius borderRadius() {
    if (selected()) {
      return BorderRadius.circular(6);
    }
    return BorderRadius.zero;
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return GestureDetector(
      onTap: () {
        widget.onSelected?.call(widget.date);
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: borderRadius(),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.date.day}',
                style: TextStyle(color: textColor()),
              ),
              if (widget.date.day==1) Text(
                '${widget.date.month}月',
                style: TextStyle(fontSize: 10,color: textColor()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AntCalendarGrid extends StatefulWidget {
  const AntCalendarGrid(
      {super.key,
      this.month,
      this.onSelected,
      this.value,
      this.range = false,
      this.onRendered,
      this.onChange});

  final DateTime? month;
  final List<DateTime?>? value;
  final ValueChanged<List<DateTime?>?>? onChange;
  final ValueChanged<DateTime>? onSelected;
  final bool range;
  final ValueChanged<double?>? onRendered;

  @override
  State<StatefulWidget> createState() => _AntCalendarGridState();
}

class _AntCalendarGridState extends State<AntCalendarGrid> {
  DateTime? _month;
  List<DateTime?>? _value;
  double? _height;
  final _key = GlobalKey();
  List<DateTime> _dates = [];

  List<DateTime> generateMonthDates(DateTime? date) {
    if (date == null) {
      return [];
    }
    final firstDay = DateTime(date.year, date.month, 1);

    List<DateTime> beforeDates = [];
    int beforeDayCount = firstDay.weekday - 1;
    if (beforeDayCount > 0) {
      beforeDates = List.generate(beforeDayCount,
          (i) => firstDay.subtract(Duration(days: (beforeDayCount - i))));
    }
    final lastDay = DateTime(date.year, date.month + 1, 0);
    List<DateTime> mouthDates =
        List.generate(lastDay.day, (i) => firstDay.add(Duration(days: i)));
    List<DateTime> afterDates = [];
    int afterDayCount = (7 - lastDay.weekday) + (6-((beforeDayCount+mouthDates.length)/7).ceil())*7;
    if (afterDayCount > 0) {
      afterDates = List.generate(
          afterDayCount, (i) => lastDay.add(Duration(days: i + 1)));
    }
    return [...beforeDates, ...mouthDates, ...afterDates];
  }

  void onMouthChange() {
    setState(() {
      if (widget.month != null) {
        _month = widget.month!;
      } else {
        _month = DateTime.now();
      }
      _dates = generateMonthDates(_month);
    });
  }

  void onDateSelected(DateTime selectDate) {
    widget.onSelected?.call(selectDate);
    if (widget.range) {
      if (_value?.elementAtOrNull(0) == null) {
        _value = [selectDate];
      } else if (_value?.elementAtOrNull(1) == null) {
        var startDate = _value!.elementAtOrNull(0);
        if (selectDate.isBefore(startDate!)) {
          _value = [selectDate, startDate];
        } else {
          _value = [startDate, selectDate];
        }
      } else if (_value?.elementAtOrNull(0) != null &&
          _value?.elementAtOrNull(1) != null) {
        _value = [selectDate];
      }
    } else {
      _value = [selectDate];
    }
    widget.onChange?.call(_value);
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    onMouthChange();
  }

  @override
  void didUpdateWidget(AntCalendarGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.month != oldWidget.month) {
      onMouthChange();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderObject? renderObject =
          _key.currentContext?.findRenderObject();
      if (renderObject == null) {
        return;
      }
      final RenderBox renderBox = renderObject as RenderBox;
      double height = (renderBox.size.width / 7) * (_dates.length / 7) + 4;
      widget.onRendered?.call(height);
    });

    return GridView.builder(
        key: _key,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1,
        ),
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          return AntCalendarDateCell(
            mouth: _month!,
            date: _dates[index],
            value: _value,
            range: widget.range,
            onSelected: (date) {
              onDateSelected(date);
            },
          );
        });
  }
}

import 'package:flutter/cupertino.dart';

class AntCalendarPickerView extends StatefulWidget {
  const AntCalendarPickerView({super.key, this.value});

  final DateTime? value;

  @override
  State<StatefulWidget> createState() => _AntCalendarPickerViewState();
}

class _AntCalendarPickerViewState extends State<AntCalendarPickerView> {
  DateTime? _selectedDate;
  PageController _controller = PageController();
  List<AntCalendarMouthView> _mouthViews = [];

  List<AntCalendarMouthView> generateMonthViews(DateTime dateTime) {
    return [
      AntCalendarMouthView(month: DateTime(dateTime.year, dateTime.month - 1)),
      AntCalendarMouthView(month: dateTime),
      AntCalendarMouthView(month: DateTime(dateTime.year, dateTime.month + 1))
    ];
  }

  void beforeInsert() {
    setState(() {
      DateTime firstMouth = _mouthViews.first.month!;
      _mouthViews = [
        AntCalendarMouthView(
            month: DateTime(firstMouth.year, firstMouth.month - 1)),
        ..._mouthViews
      ];
    });
    // _controller.jumpToPage(1);
  }

  void beforeAfter() {
    setState(() {
      DateTime lastMouth = _mouthViews.last.month!;
      _mouthViews = [
        ..._mouthViews,
        AntCalendarMouthView(
            month: DateTime(lastMouth.year, lastMouth.month + 1))
      ];
    });
    // _controller.jumpToPage(_mouthViews.length - 2);
  }

  @override
  void initState() {
    super.initState();
    _mouthViews = generateMonthViews(widget.value ?? DateTime.now());
    _controller = PageController(initialPage: 1);
    _controller.addListener(() {
      // print('当前偏移：${_controller.position.pixels}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          print(_mouthViews.map((m) {
            return m.month;
          }).toList());
          print('当前页：$index');
          if (index == 0) {
            beforeInsert();
          } else if (index == _mouthViews.length - 1) {
            beforeAfter();
          }
        },
        children: _mouthViews,
      ),
    );
  }
}

class AntCalendarMouthView extends StatefulWidget {
  const AntCalendarMouthView({super.key, this.month});

  final DateTime? month;

  @override
  State<StatefulWidget> createState() => _AntCalendarMouthViewState();
}

class _AntCalendarMouthViewState extends State<AntCalendarMouthView> {
  DateTime? _month;

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
    List<DateTime> afterDates = [];
    int afterDayCount = 7 - lastDay.weekday;
    if (afterDayCount > 0) {
      afterDates = List.generate(
          afterDayCount, (i) => lastDay.add(Duration(days: i - 1)));
    }
    List<DateTime> mouthDates =
        List.generate(lastDay.day, (i) => firstDay.add(Duration(days: i)));
    return [...beforeDates, ...mouthDates, ...afterDates];
  }

  @override
  void initState() {
    super.initState();
    if (widget.month != null) {
      _month = widget.month!;
    } else {
      _month = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    final dates = generateMonthDates(_month);
    return Container(
      child: Column(
        children: [
          Container(
            child: Text('${_month?.year}-${_month?.month}'),
          ),
          Container(
            child: Row(
              children: ["一", "二", "三", "四", "五", "六", "日"].map((weekday) {
                return Expanded(
                    child: Center(
                  child: Text(weekday),
                ));
              }).toList(),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    return AntCalendarDateCell(
                      date: dates[index],
                    );
                  }))
        ],
      ),
    );
  }
}

class AntCalendarDateCell extends StatefulWidget {
  final DateTime date;

  const AntCalendarDateCell({super.key, required this.date});

  @override
  State<StatefulWidget> createState() => AntCalendarDateCellState();
}

class AntCalendarDateCellState extends State<AntCalendarDateCell> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${widget.date.day}'),
    );
  }
}

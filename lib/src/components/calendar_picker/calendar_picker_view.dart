import 'package:flutter/material.dart';

typedef OnSelectedDateCallback = void Function(DateTime? date);

typedef OnOk = void Function(DateTime? value);
typedef OnCancel = void Function();

class AntCalendarPickerView extends StatefulWidget {
  const AntCalendarPickerView({super.key, this.onOk, this.value});
  final DateTime? value;
  final OnOk? onOk;

  @override
  State<StatefulWidget> createState() => _AntCalendarPickerViewState();
}

class _AntCalendarPickerViewState extends State<AntCalendarPickerView> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_selectedDate != null
                  ? '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}'
                  : '请选择日期'),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child:
                      Text("确定", style: TextStyle(color: Color(0xFF1777ff))),
                ),
                onTap: () {
                  widget.onOk?.call(_selectedDate);
                },
              )
            ],
          ),
        ),
        AntCalendarView(
          value: _selectedDate,
          onSelected: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
        ),
      ],
    );
  }
}

class AntCalendarView extends StatefulWidget {
  const AntCalendarView({super.key, this.value, this.onSelected});

  final DateTime? value;
  final OnSelectedDateCallback? onSelected;

  @override
  State<StatefulWidget> createState() => _AntCalendarViewState();
}

class _AntCalendarViewState extends State<AntCalendarView> {
  DateTime? _selectedDate;
  DateTime? _currentMouth;
  List<DateTime> _mouths = [];
  PageController _controller = PageController();
  double? _pageHeight = 300;

  List<DateTime> generateMouths(DateTime dateTime) {
    return [
      DateTime(dateTime.year, dateTime.month - 1),
      DateTime(dateTime.year, dateTime.month),
      DateTime(dateTime.year, dateTime.month + 1)
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
      _currentMouth = DateTime(newMouth.year, newMouth.month);
      _mouths = generateMouths(_currentMouth!);
      _controller.jumpToPage(1);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.value;
    _currentMouth = widget.value ?? DateTime.now();
    _mouths = generateMouths(_currentMouth!);
    _controller = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxHeight);
      return AnimatedContainer(
        height: _pageHeight,
        duration: Duration(milliseconds: 200),
        child: PageView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            print(_mouths);
            print('当前页：$index');
            if (index == 0) {
              setState(() {
                DateTime firstMouth = _mouths.first;
                _currentMouth = firstMouth;
                _mouths = generateMouths(firstMouth);
                _controller.jumpToPage(1);
              });
            } else if (index == _mouths.length - 1) {
              setState(() {
                DateTime lastMouth = _mouths.last;
                _currentMouth = lastMouth;
                _mouths = generateMouths(lastMouth);
                _controller.jumpToPage(1);
              });
            }
          },
          itemCount: _mouths.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
                child: AntCalendarMouthView(
              month: _mouths[index],
              selectedDate: _selectedDate,
              onSelected: (date) {
                widget.onSelected?.call(date);
                setState(() {
                  _selectedDate = date;
                });
                if (date!.month != _currentMouth!.month) {
                  mouthChange(date);
                }
              },
              onRendered: (height) {
                print('高度22 $height $_pageHeight');
                if (_pageHeight != height) {
                  setState(() {
                    _pageHeight = height;
                  });
                }
              },
            ));
          },
        ),
      );
    });
  }
}

class AntCalendarMouthView extends StatefulWidget {
  const AntCalendarMouthView(
      {super.key,
      this.month,
      this.onSelected,
      this.selectedDate,
      this.onRendered});

  final DateTime? month;
  final DateTime? selectedDate;
  final OnSelectedDateCallback? onSelected;
  final OnMouthViewRendered? onRendered;

  @override
  State<StatefulWidget> createState() => _AntCalendarMouthViewState();
}

typedef OnMouthViewRendered = void Function(double? height);

class _AntCalendarMouthViewState extends State<AntCalendarMouthView> {
  DateTime? _month;
  double? _height;
  final _key = GlobalKey();

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
          afterDayCount, (i) => lastDay.add(Duration(days: i + 1)));
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
  void didUpdateWidget(AntCalendarMouthView oldWidget) {
    if (widget.month != oldWidget.month) {
      print('更新月份');
      setState(() {
        _month = widget.month!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dates = generateMonthDates(_month);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderObject? renderObject =
          _key.currentContext?.findRenderObject();
      if (renderObject == null) {
        return;
      }
      final RenderBox renderBox = renderObject as RenderBox;
      if(_height != renderBox.size.height){
        _height = renderBox.size.height;
        print('高度 $_height');
        widget.onRendered?.call(_height);
      }
    });

    return Column(
      key: _key,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(4),
          child: Text('${_month?.year}-${_month?.month}'),
        ),
        Container(
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
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: dates.length,
            itemBuilder: (context, index) {
              return AntCalendarDateCell(
                mouth: _month!,
                date: dates[index],
                selectedDate: widget.selectedDate,
                onSelected: (date) {
                  widget.onSelected?.call(date);
                },
              );
            })
      ],
    );
  }
}

class AntCalendarDateCell extends StatefulWidget {
  const AntCalendarDateCell(
      {super.key,
      required this.date,
      required this.mouth,
      this.selectedDate,
      this.onSelected});

  final DateTime? selectedDate;
  final DateTime date;
  final DateTime mouth;
  final OnSelectedDateCallback? onSelected;

  @override
  State<StatefulWidget> createState() => AntCalendarDateCellState();
}

class AntCalendarDateCellState extends State<AntCalendarDateCell> {
  bool selected() {
    return widget.date.day == widget.selectedDate?.day &&
        widget.date.month == widget.selectedDate?.month &&
        widget.date.year == widget.selectedDate?.year;
  }

  bool overCurrentMonth() {
    return widget.date
            .isBefore(DateTime(widget.mouth.year, widget.mouth.month, 1)) ||
        widget.date
            .isAfter(DateTime(widget.mouth.year, widget.mouth.month + 1, 0));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected?.call(widget.date);
      },
      child: Container(
        decoration: BoxDecoration(
          color: selected() ? Color(0xFF1777ff) : Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            '${widget.date.day}',
            style: TextStyle(
                color: (selected()
                    ? Colors.white
                    : (overCurrentMonth() ? Colors.grey : Colors.black))),
          ),
        ),
      ),
    );
  }
}

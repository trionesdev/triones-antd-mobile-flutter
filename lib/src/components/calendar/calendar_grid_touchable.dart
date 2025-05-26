import 'package:flutter/material.dart';

import 'calendar_grid.dart';

class AntCalendarGridTouchable extends StatefulWidget {
  const AntCalendarGridTouchable(
      {super.key,
      this.mouth,
      this.value,
      this.onChange,
      this.range = false,
      this.onSelected,
      this.onRendered,
      this.onMouthChange});

  final DateTime? mouth;
  final List<DateTime?>? value;
  final ValueChanged<List<DateTime?>?>? onChange;
  final bool range;
  final ValueSetter<DateTime>? onSelected;
  final ValueChanged<DateTime>? onMouthChange;
  final ValueChanged<double?>? onRendered;

  @override
  State<StatefulWidget> createState() => _AntCalendarGridTouchableState();
}

class _AntCalendarGridTouchableState extends State<AntCalendarGridTouchable> {
  late DateTime _currentMouth;
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
      widget.onMouthChange?.call(_currentMouth);
    });
  }

  @override
  void initState() {
    super.initState();

    _currentMouth = widget.mouth ?? DateTime.now();
    _mouths = generateMouths(_currentMouth!);
    _controller = PageController(initialPage: 1);
  }

  @override
  void didUpdateWidget(covariant AntCalendarGridTouchable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mouth != widget.mouth) {
      _currentMouth = widget.mouth ?? DateTime.now();
      _mouths = generateMouths(_currentMouth!);
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
    return LayoutBuilder(builder: (context, constraints) {
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
                      _currentMouth = firstMouth;
                      _mouths = generateMouths(firstMouth);
                      _controller.jumpToPage(1);
                      widget.onMouthChange?.call(_currentMouth);
                    });
                  } else if (index == _mouths.length - 1) {
                    setState(() {
                      DateTime lastMouth = _mouths.last;
                      _currentMouth = lastMouth;
                      _mouths = generateMouths(lastMouth);
                      _controller.jumpToPage(1);
                      widget.onMouthChange?.call(_currentMouth);
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
                          if (date.month != _currentMouth!.month) {
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
                            widget.onRendered
                                ?.call(height);
                          }
                        },
                      ));
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

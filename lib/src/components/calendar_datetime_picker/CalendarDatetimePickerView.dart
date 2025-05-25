import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../trionesdev_antd_mobile.dart';
import '../calendar/calendar_grid_touchable.dart';
import '../picker/picker_view_multi_columns.dart';
import '../theme/theme.dart';

class AntCalendarDatetimePickerView extends StatefulWidget {
  const AntCalendarDatetimePickerView({super.key, this.value, this.onOk});

  final DateTime? value;
  final ValueChanged<DateTime?>? onOk;

  @override
  State<StatefulWidget> createState() => _AntCalendarDatetimePickerViewState();
}

class _AntCalendarDatetimePickerViewState
    extends State<AntCalendarDatetimePickerView> {
  ValueNotifier<DateTime?> _selectedDateTime = ValueNotifier(null);
  int _showIndex = 0;
  double? _height = 500;
  final List<List<AntPickerOption>> _timeOptions = [
    List.generate(24, (index) {
      return AntPickerOption(
          value: '$index', label: DatetimeUtils.twoDigits(index));
    }),
    List.generate(60, (index) {
      return AntPickerOption(
          value: '$index', label: DatetimeUtils.twoDigits(index));
    })
  ];

  @override
  void initState() {
    super.initState();
    _selectedDateTime = ValueNotifier(widget.value ?? DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: _selectedDateTime,
                      builder: (context, value, child) {
                        return _Label(
                          index: _showIndex,
                          selectedDateTime: value,
                          onIndexChange: (index) {
                            setState(() {
                              _showIndex = index;
                            });
                          },
                        );
                      })),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child: Text("确定",
                      style: TextStyle(color: themeData.colorPrimary)),
                ),
                onTap: () {
                  widget.onOk?.call(_selectedDateTime?.value);
                },
              )
            ],
          ),
        ),
        Container(
          height: _height ?? 500,
          child: IndexedStack(
            index: _showIndex,
            children: [
              // AntCalendarView(
              //   value: _selectedDateTime.value,
              //   onSelected: (date) {
              //     setState(() {
              //       _selectedDateTime.value = _selectedDateTime.value?.copyWith(
              //         year: date.year,
              //         month: date.month,
              //         day: date.day,
              //       );
              //     });
              //   },
              //   onRendered: (double? value) {
              //     setState(() {
              //       _height = value;
              //     });
              //   },
              // ),
              AntPickerViewMultiColumns(
                columns: _timeOptions,
                itemHeight: 34,
                value: [
                  '${_selectedDateTime.value?.hour ?? 0}',
                  '${_selectedDateTime.value?.minute ?? 0}'
                ],
                onColumnSelected: (value, index) {
                  if (index == 0) {
                    _selectedDateTime.value = _selectedDateTime.value
                        ?.copyWith(hour: int.parse(value!.value!));
                  } else {
                    _selectedDateTime.value = _selectedDateTime.value
                        ?.copyWith(minute: int.parse(value!.value!));
                  }
                },
                height: _height,
              )
            ],
          ),
        )
      ],
    );
  }
}

class _Label extends StatefulWidget {
  const _Label(
      {this.onIndexChange, this.selectedDateTime, required this.index});

  final int index;
  final DateTime? selectedDateTime;
  final Function(int index)? onIndexChange;

  @override
  State<StatefulWidget> createState() => _LabelState();
}

class _LabelState extends State<_Label> {
  DateTime _selectedDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.selectedDateTime ?? DateTime.now();
  }

  @override
  void didUpdateWidget(covariant _Label oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDateTime != widget.selectedDateTime) {
      setState(() {
        _selectedDateTime = widget.selectedDateTime ?? DateTime.now();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      children: [
        GestureDetector(
          onTap: () {
            widget.onIndexChange?.call(0);
          },
          child: Container(
            decoration:
                widget.index == 0 ? BoxDecoration(color: Colors.grey) : null,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Text(_selectedDateTime != null
                ? DateFormat("yyyy-MM-dd").format(_selectedDateTime!)
                : '请选择日期'),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.onIndexChange?.call(1);
            });
          },
          child: Container(
            decoration:
                widget.index == 1 ? BoxDecoration(color: Colors.grey) : null,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Text(DateFormat("HH:mm").format(_selectedDateTime)),
          ),
        )
      ],
    );
  }
}

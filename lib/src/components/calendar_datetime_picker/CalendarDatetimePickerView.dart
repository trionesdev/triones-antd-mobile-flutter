import 'package:flutter/widgets.dart';

import '../../../antd.dart';
import '../calendar_picker/calendar_view.dart';
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
  DateTime? _selectedDate;
  int _showIndex = 0;
  double? _height = 500;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.value ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                spacing: 4,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showIndex = 0;
                      });
                    },
                    child: Text(_selectedDate != null
                        ? '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}'
                        : '请选择日期'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showIndex = 1;
                      });
                    },
                    child: Container(
                      child: Text('${_selectedDate!.hour}:${_selectedDate!.minute}'),
                    ),
                  )
                ],
              )),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child: Text("确定",
                      style: TextStyle(color: themeData.colorPrimary)),
                ),
                onTap: () {
                  widget.onOk?.call(_selectedDate);
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
              AntCalendarView(
                value: _selectedDate,
                onSelected: (date) {
                  setState(() {
                    _selectedDate = _selectedDate?.copyWith(
                      year: date.year,
                      month: date.month,
                      day: date.day,
                    );
                  });
                },
                onRendered: (double? value) {
                  setState(() {
                    _height = value;
                  });
                },
              ),
              AntPickerViewMultiColumns(
                columns: [
                  List.generate(24, (index) {
                    return AntPickerOption(value: '$index', label: '$index');
                  }),
                  List.generate(60, (index) {
                    return AntPickerOption(value: '$index', label: '$index');
                  }),
                ],
                itemHeight: 34,
                value: ['${_selectedDate?.hour ?? 0}', '${_selectedDate?.minute ?? 0}'],
                onColumnSelected: (value, index) {
                  if (index == 0) {
                    setState(() {
                      _selectedDate = _selectedDate?.copyWith(hour: int.parse(value!.value!));
                    });
                  } else {
                    setState(() {
                      _selectedDate = _selectedDate?.copyWith(minute: int.parse(value!.value!));
                    });
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import '../theme/theme.dart';
import 'calendar_view.dart';

class AntCalendarPickerView extends StatefulWidget {
  const AntCalendarPickerView({super.key, this.onOk, this.value});
  final DateTime? value;
  final ValueChanged<DateTime?>? onOk;

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
    AntThemeData themeData = AntTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_selectedDate != null
                  ? DateFormat("yyyy-MM-dd").format(_selectedDate!)
                  : '请选择日期'),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child:
                      Text("确定", style: TextStyle(color: themeData.colorPrimary)),
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


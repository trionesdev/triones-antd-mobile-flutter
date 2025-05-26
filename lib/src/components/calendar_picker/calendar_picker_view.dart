import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntCalendarPickerView extends StatefulWidget {
  const AntCalendarPickerView({super.key, this.onOk, this.value});

  final DateTime? value;
  final ValueChanged<DateTime?>? onOk;

  @override
  State<StatefulWidget> createState() => _AntCalendarPickerViewState();
}

class _AntCalendarPickerViewState extends State<AntCalendarPickerView> {
  final ValueNotifier<DateTime?> _selectedValue = ValueNotifier(null);

  DateTime? valueInitialize(DateTime? value){
    return value != null
        ? DateTime(value.year, value.month, value.day)
        : null;
  }

  @override
  void initState() {
    super.initState();
    _selectedValue.value = valueInitialize(widget.value);
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
              ValueListenableBuilder(
                  valueListenable: _selectedValue,
                  builder: (context, value, child) {
                    return Text(_selectedValue.value != null
                        ? DateFormat("yyyy-MM-dd").format(_selectedValue.value!)
                        : '请选择日期');
                  }),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child: Text("确定",
                      style: TextStyle(color: themeData.colorPrimary)),
                ),
                onTap: () {
                  widget.onOk?.call(_selectedValue.value);
                },
              )
            ],
          ),
        ),
        AntCalendar(
          value: _selectedValue.value,
          onChange: (newVal) {
            _selectedValue.value = newVal;
          },
        ),
      ],
    );
  }
}

class AntCalendarRangePickerView extends StatefulWidget {
  const AntCalendarRangePickerView({super.key, this.onOk, this.value});

  final List<DateTime?>? value;
  final ValueChanged<List<DateTime?>?>? onOk;

  @override
  State<StatefulWidget> createState() => _AntCalendarRangePickerViewState();
}

class _AntCalendarRangePickerViewState
    extends State<AntCalendarRangePickerView> {
  final ValueNotifier<List<DateTime?>?> _selectedValue = ValueNotifier(null);

  List<DateTime?>? valueInitialize(List<DateTime?>? value) {
    DateTime? startDate = value?.elementAtOrNull(0);
    DateTime? endDate = value?.elementAtOrNull(1);
    List<DateTime?> newValue = [null,null];
    if(startDate!=null){
      newValue[0] = DateTime(startDate.year,startDate.month,startDate.day);
    }
    if(endDate!=null){
      newValue[1] = DateTime(endDate.year,endDate.month,endDate.day);
    }
    return newValue;
  }
  
  @override
  void initState() {
    super.initState();
    _selectedValue.value = valueInitialize(widget.value);
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
              ValueListenableBuilder(
                  valueListenable: _selectedValue,
                  builder: (context, value, child) {
                    return Text((_selectedValue.value?.elementAtOrNull(0) !=
                                null &&
                            _selectedValue.value?.elementAtOrNull(1) != null)
                        ? '${DateFormat("yyyy-MM-dd").format(_selectedValue.value!.elementAt(0)!)}~${DateFormat("yyyy-MM-dd").format(_selectedValue.value!.elementAt(1)!)}'
                        : '请选择日期范围');
                  }),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child: Text("确定",
                      style: TextStyle(color: themeData.colorPrimary)),
                ),
                onTap: () {
                  widget.onOk?.call(_selectedValue.value);
                },
              )
            ],
          ),
        ),
        AntCalendarRange(
          value: _selectedValue.value,
          onChange: (newVal) {
            _selectedValue.value = newVal;
          },
        ),
      ],
    );
  }
}

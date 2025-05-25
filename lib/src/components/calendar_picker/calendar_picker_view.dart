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
  DateTime? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
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
              Text(_value != null
                  ? DateFormat("yyyy-MM-dd").format(_value!)
                  : '请选择日期'),
              GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child:
                      Text("确定", style: TextStyle(color: themeData.colorPrimary)),
                ),
                onTap: () {
                  widget.onOk?.call(_value);
                },
              )
            ],
          ),
        ),
        AntCalendar(
          value: _value,
          onChange: (newVal){
            _value = newVal;
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

class _AntCalendarRangePickerViewState extends State<AntCalendarRangePickerView> {
  List<DateTime?>? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
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
              Text((_value?.elementAtOrNull(0) != null && _value?.elementAtOrNull(1) != null)
                  ? '${DateFormat("yyyy-MM-dd").format(_value!.elementAt(0)!)}~${DateFormat("yyyy-MM-dd").format(_value!.elementAt(1)!)}'
                  : '请选择日期范围'),
              GestureDetector(
                child: Container(
                  padding:
                  EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child:
                  Text("确定", style: TextStyle(color: themeData.colorPrimary)),
                ),
                onTap: () {
                  widget.onOk?.call(_value);
                },
              )
            ],
          ),
        ),
        AntCalendarRange(
          value: _value,
          onChange: (newVal){
            _value = newVal;
          },
        ),
      ],
    );
  }
}

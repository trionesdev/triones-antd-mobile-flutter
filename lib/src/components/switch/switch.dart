import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/theme/theme.dart';

import '../../../antd.dart';

class AntSwitch extends StatefulWidget {
  const AntSwitch({
    super.key,
    this.defaultChecked = false,
    this.checked = false,
    this.onChange,
    this.style,
    this.disabled = false,
  });

  final bool? disabled;
  final bool? defaultChecked;
  final bool? checked;
  final ValueChanged<bool>? onChange;
  final StateStyle? style;

  @override
  State<StatefulWidget> createState() => _AntSwitchState();
}

class _AntSwitchState extends State<AntSwitch> with MaterialStateMixin {
  bool _checked = false;

  bool get checked {
    if (widget.checked != null) {
      return widget.checked!;
    } else {
      return widget.defaultChecked!;
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _checked = checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return SizedBox(
      width: 100,
      height: 20,
      child: Switch(
        value: _checked,
        onChanged: widget.disabled!
            ? null
            : (value) {
          setState(() {
            _checked = value;
            widget.onChange?.call(value);
          });
        },
        splashRadius: 0,
        padding: EdgeInsets.zero,
        trackOutlineWidth:
        WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          return 0;
        }),
        trackOutlineColor:
        WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          return Colors.transparent;
        }),
        inactiveTrackColor: Color(0xffBFBFBF),
        activeTrackColor: themeData.colorPrimary,
        inactiveThumbColor: Colors.white,
        activeColor: Colors.white,
      )
    );
  }
}

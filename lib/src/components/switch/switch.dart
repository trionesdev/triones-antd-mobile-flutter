import 'package:flutter/widgets.dart';

import '../../../antd.dart';

class AntSwitch extends StatefulWidget {

  final bool? checked;
  final Function? onChange;
  final StateStyle? style;

  const AntSwitch({super.key, this.checked, this.onChange, this.style});

  @override
  State<StatefulWidget> createState() => _AntSwitchState();
}

class _AntSwitchState extends State<AntSwitch> {

  @override
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
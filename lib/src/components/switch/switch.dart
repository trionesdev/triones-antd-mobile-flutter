import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/src/components/theme/theme.dart';

import '../../../antd.dart';

enum AntSwitchSize { small, middle, large }

class AntSwitch extends StatefulWidget {
  const AntSwitch({
    super.key,
    this.defaultChecked = false,
    this.checked,
    this.onChange,
    this.style,
    this.disabled = false,
    this.size = AntSwitchSize.middle,
  });

  final bool? disabled;
  final bool? defaultChecked;
  final bool? checked;
  final ValueChanged<bool>? onChange;
  final AntSwitchSize? size;
  final StateStyle? style;

  @override
  State<StatefulWidget> createState() => _AntSwitchState();
}

class _AntSwitchState extends State<AntSwitch>
    with SingleTickerProviderStateMixin {
  bool _checked = false;
  double padding = 2;
  late AnimationController _animationController;

  bool get checked {
    if (widget.checked != null) {
      return widget.checked!;
    } else {
      return widget.defaultChecked!;
    }
  }

  double get width {
    switch (widget.size) {
      case AntSwitchSize.small:
        return 28;
      case AntSwitchSize.middle:
        return 44;
      case AntSwitchSize.large:
        return 60;
      default:
        return 44;
    }
  }

  double get height {
    switch (widget.size) {
      case AntSwitchSize.small:
        return 16;
      case AntSwitchSize.middle:
        return 22;
      case AntSwitchSize.large:
        return 30;
      default:
        return 22;
    }
  }

  int get duration {
    return 300;
  }

  @override
  void initState() {
    super.initState();
    _checked = widget.checked ?? widget.defaultChecked ?? false;
    _animationController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
      value: _checked ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(covariant AntSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.checked != widget.checked) {
      _checked = widget.checked ?? widget.defaultChecked ?? false;
      _animationController.animateTo(_checked ? 1 : 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          _checked = !_checked;
        });
        widget.onChange?.call(_checked);
        _animationController.animateTo(_checked ? 1 : 0);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: duration),
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _checked ? themeData.colorPrimary : themeData.colorBorder,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: duration),
              left: _checked ? null : 0,
              right: _checked ? 0 : null,
              child: Container(
                width: height - 2 * padding,
                height: height - 2 * padding,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            // AnimatedPositioned(
            //   duration: Duration(milliseconds: 100),
            //   left: _checked?0:null,
            //   right: _checked?null:0,
            //   child: Container(child: Icon(Icons.add_circle,color: Colors.white,size: 12),),
            // )
          ],
        ),
      ),
    );
  }
}

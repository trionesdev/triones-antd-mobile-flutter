import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/src/components/steps/horizontal_step_item.dart';

import 'types.dart';
import 'vertical_step_item.dart';

class AntSteps extends StatefulWidget {
  const AntSteps({
    super.key,
    this.direction = AntStepsDirection.horizontal,
    this.iconSize,
    this.current = 0,
    this.items,
    this.children,
  });

  final AntStepsDirection direction;
  final int? current;
  final double? iconSize;
  final List<AntStepItemStruct>? items;
  final List<AntStepItem>? children;

  static AntStepsState? maybeOf(BuildContext context) {
    final _AntStepsScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntStepsScope>();
    return scope?._stepsState;
  }

  @override
  State<StatefulWidget> createState() => AntStepsState();
}

class AntStepsState extends State<AntSteps> {
  int _generation = 0;
  List<AntStepItem> _children = [];

  Widget get child {
    switch (widget.direction) {
      case AntStepsDirection.horizontal:
        List<Widget> children = [];
        for (var element in _children) {
          children.add(Expanded(child: element));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children ?? [],
        );
      case AntStepsDirection.vertical:
        List<Widget> children = [];
        for (var element in _children) {
          children.add(element);
        }
        return Column(mainAxisSize: MainAxisSize.min, children: children ?? []);
    }
  }

  void updateChildren() {
    if (widget.items?.isNotEmpty == true) {
      _children =
          widget.items!.map((e) {
            return AntStepItem(icon: e.icon);
          }).toList();
    }
    _children = widget.children ?? [];
  }

  @override
  void initState() {
    updateChildren();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AntSteps oldWidget) {
    setState(() {
      _generation++;
      updateChildren();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: _AntStepsScope(
        stepsState: this,
        generation: _generation,
        child: child,
      ),
    );
  }
}

class _AntStepsScope extends InheritedWidget {
  const _AntStepsScope({
    required super.child,
    required AntStepsState stepsState,
    required int generation,
  }) : _stepsState = stepsState,
       _generation = generation;
  final AntStepsState _stepsState;
  final int _generation;

  @override
  bool updateShouldNotify(covariant _AntStepsScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}

class AntStepItem extends StatefulWidget {
  const AntStepItem({
    super.key,

    this.current,
    this.disabled = false,
    this.icon,
    this.iconSize,
    this.status = AntStepStatus.wait,
    this.subTitle,
    this.title,
  });


  final int? current;
  final bool disabled;
  final Widget? icon;
  final double? iconSize;
  final AntStepStatus status;
  final Widget? subTitle;
  final Widget? title;

  @override
  State<StatefulWidget> createState() => _StepItemState();
}

class _StepItemState extends State<AntStepItem> {
  _AntStepsScope? _stepsScope;

  int get _index {
    return _stepsScope?._stepsState._children.indexOf(widget) ?? 0;
  }

  bool get _isFirst {
    return _stepsScope?._stepsState._children.indexOf(widget) == 0;
  }

  bool get _isLast {
    return _stepsScope?._stepsState._children.indexOf(widget) ==
        (_stepsScope!._stepsState._children.length - 1);
  }

  @override
  void didChangeDependencies() {
    _stepsScope = context.dependOnInheritedWidgetOfExactType<_AntStepsScope>();
    super.didChangeDependencies();
  }

  AntStepsDirection get direction {
    return _stepsScope?._stepsState.widget.direction ??
        AntStepsDirection.horizontal;
  }

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case AntStepsDirection.horizontal:
        return HorizontalStepItem(
          isFirst: _isFirst,
          isLast: _isLast,
          index: _index,
          current: _stepsScope?._stepsState.widget.current ?? 0,
          icon: widget.icon,
          iconSize: widget.iconSize,
          title: widget.title,
          subTitle: widget.subTitle,
          status: widget.status,
          disabled: widget.disabled,

        );
      case AntStepsDirection.vertical:
        return VerticalStepItem(
          isFirst: _isFirst,
          isLast: _isLast,
          index: _index,
          current: _stepsScope?._stepsState.widget.current ?? 0,
          icon: widget.icon,
          iconSize: widget.iconSize,
          title: widget.title,
          subTitle: widget.subTitle,
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/src/components/steps/horizontal_step_item.dart';

import 'types.dart';
import 'vertical_step_item.dart';

class AntSteps extends StatefulWidget {
  const AntSteps({
    super.key,
    this.direction = AntStepsDirection.horizontal,
    this.iconSize,
    this.defaultIconSize = 24,
    this.current = 0,
    this.stretch = true,
    this.itemMinWidth,
    this.items,
    this.children,
  });

  /// @description 步骤条方向
  /// @default AntStepsDirection.horizontal
  final AntStepsDirection direction;
  /// @description 指定当前步骤，从 0 开始记数。在子 Step 元素中，可以通过 status 属性覆盖状态
  /// @default 0
  final int? current;
  /// @description 指定图标大小
  /// @default null
  final double? iconSize;
  /// @description 默认图标大小
  /// @default 24
  final double defaultIconSize;
  /// @description 是否拉伸，只对 type='horizontal' 的有效
  /// @default true
  final bool stretch;
  /// @description 步骤条子项最小宽度, 仅在 type='horizontal' 时有效
  /// @default null
  final double? itemMinWidth;
  /// @description 步骤条子项
  /// @default null
  final List<AntStepItemStruct>? items;
  /// @description 步骤条子项
  /// @default null
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
          if(widget.stretch){
            children.add(Flexible(
                fit: widget.stretch? FlexFit.tight : FlexFit.loose,
                child: element));
          }else{
            children.add(element);
          }
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    this.disabled = false,
    this.icon,
    this.iconSize,
    this.status = AntStepStatus.wait,
    this.subTitle,
    this.title,
    this.child,
  });

  final bool disabled;
  /// @description 图标
  /// @default null
  final Widget? icon;
  /// @description 指定图标大小
  /// @default null
  final double? iconSize;
  /// @description 指定状态。当不配置该属性时，会使用 Steps 的 current 来自动指定状态；如果该属性与 current 指定的状态不匹配会覆盖自动匹配的状态
  /// @default AntStepStatus.wait
  final AntStepStatus status;
  /// @description 标题
  /// @default null
  final Widget? title;
  /// @description 子标题
  /// @default null
  final Widget? subTitle;
  final Widget? child;


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
          iconSize: widget.iconSize ?? _stepsScope?._stepsState.widget.iconSize,
          stretch: _stepsScope?._stepsState.widget.stretch ?? false,
          minWidth: _stepsScope?._stepsState.widget.itemMinWidth,
          title: widget.title,
          subTitle: widget.subTitle,
          status: widget.status,
          disabled: widget.disabled,
          child: widget.child,
        );
      case AntStepsDirection.vertical:
        return VerticalStepItem(
          isFirst: _isFirst,
          isLast: _isLast,
          index: _index,
          current: _stepsScope?._stepsState.widget.current ?? 0,
          icon: widget.icon,
          iconSize: widget.iconSize ?? _stepsScope?._stepsState.widget.iconSize,
          defaultIconSize: _stepsScope?._stepsState.widget.defaultIconSize,
          title: widget.title,
          subTitle: widget.subTitle,
          status: widget.status,
          disabled: widget.disabled,
          child: widget.child,
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// @component AntGrid
class AntGrid extends StatefulWidget {
  const AntGrid({
    super.key,
    this.children,
    this.columns = 1,
    this.decoration,
    this.spacing = 0,
  });

  /// @description 列数
  /// @default 1
  final int? columns;

  /// @description 子项间距
  /// @default 0
  final double? spacing;

  /// @description 子项
  final List<AntGridItem>? children;

  /// @description 装饰
  /// @default null
  final BoxDecoration? decoration;

  static AntGridState? maybeOf(BuildContext context) {
    final _AntGridScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntGridScope>();
    return scope?._gridState;
  }

  static AntGridState of(BuildContext context) {
    final AntGridState? gridState = AntGrid.maybeOf(context);
    return gridState!;
  }

  @override
  State<StatefulWidget> createState() => AntGridState();
}

class AntGridState extends State<AntGrid> {
  int _generation = 0;
  double _gridWidth = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: _AntGridScope(
        gridState: this,
        generation: _generation,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            _gridWidth = constraints.maxWidth;
            return Container(
              decoration: widget.decoration,
              padding: EdgeInsets.only(
                left: widget.spacing! / 2,
                right: widget.spacing! / 2,
              ),
              child: Wrap(
                spacing: widget.spacing ?? 0,
                runSpacing: widget.spacing ?? 0,
                children: widget.children ?? [],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AntGridScope extends InheritedWidget {
  const _AntGridScope({
    required super.child,
    required AntGridState gridState,
    required int generation,
  }) : _gridState = gridState,
       _generation = generation;

  final AntGridState _gridState;
  final int _generation;

  @override
  bool updateShouldNotify(_AntGridScope old) => _generation != old._generation;
}

class AntGridItem extends StatefulWidget {
  const AntGridItem({super.key, this.span = 1, this.child, this.decoration});

  final int? span;
  final Widget? child;
  final BoxDecoration? decoration;

  @override
  State<StatefulWidget> createState() => _AntGridItemState();
}

class _AntGridItemState extends State<AntGridItem> {
  double get itemWidth {
    final AntGridState gridState = AntGrid.of(context);
    final double gridWidth = gridState._gridWidth;

    final columns = gridState.widget.columns!;
    final gap = gridState.widget.spacing!;
    final span = widget.span!;

    double width =
        ((gridWidth - ((columns) * gap)) / columns) * span + (span - 1) * gap;
    return width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth,
      decoration: widget.decoration,
      child: widget.child,
    );
  }
}

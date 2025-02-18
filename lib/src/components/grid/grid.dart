import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AntGrid extends StatefulWidget {
  const AntGrid({super.key, this.children, this.columns = 1, this.gap = 0, this.decoration});

  final int? columns;
  final double? gap;
  final List<AntGridItem>? children;
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
  double gridWidth = 0;
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: _AntGridScope(
            gridState: this,
            generation: _generation,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              print(constraints.maxWidth);
              gridWidth = constraints.maxWidth;
              return Container(
                decoration: widget.decoration,
                padding: EdgeInsets.only(
                    left: widget.gap! / 2, right: widget.gap! / 2),
                child: Wrap(
                  spacing: widget.gap ?? 0,
                  runSpacing: widget.gap ?? 0,
                  children: widget.children ?? [],
                ),
              );
            })));
  }
}

class _AntGridScope extends InheritedWidget {
  const _AntGridScope({
    required super.child,
    required AntGridState gridState,
    required int generation,
  })  : _gridState = gridState,
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
    final double gridWidth = gridState.gridWidth;

    final columns = gridState.widget.columns!;
    final gap = gridState.widget.gap!;
    final span = widget.span!;
    print(
        {"gridWidth": gridWidth, "columns": columns, "gap": gap, "span": span});

    double width =
        ((gridWidth - ((columns) * gap)) / columns) * span + (span - 1) * gap;
    print(width);
    return width;
  }

  @override
  Widget build(BuildContext context) {
    print(itemWidth);
    return Container(
      width: itemWidth,
      decoration: widget.decoration,
      child: widget.child,
    );
  }
}

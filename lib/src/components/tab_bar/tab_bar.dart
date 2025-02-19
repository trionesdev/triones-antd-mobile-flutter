import 'package:flutter/material.dart';

typedef TabBarChangeCallback = void Function(String id);

class AntTabBar extends StatefulWidget {
  const AntTabBar({super.key,
    this.padding,
    this.height = 54,
    this.items,
    this.color = Colors.black,
    this.activeColor = defaultActiveColor,
    this.activeId,
    this.defaultActiveId,
    this.onChange, this.decoration});

  static const Color defaultActiveColor = Color(0xff1677FF);
  final BoxDecoration? decoration;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? activeColor;
  final List<AntTabBarItem>? items;
  final String? activeId;
  final String? defaultActiveId;
  final TabBarChangeCallback? onChange;

  static AntTabBarState? maybeOf(BuildContext context) {
    _AntTabBarScope? scope =
    context.dependOnInheritedWidgetOfExactType<_AntTabBarScope>();
    return scope?._tabBarState;
  }

  static AntTabBarState of(BuildContext context) {
    AntTabBarState? result = maybeOf(context);
    return result!;
  }

  @override
  State<StatefulWidget> createState() => AntTabBarState();
}

class AntTabBarState extends State<AntTabBar> {
  int _generation = 0;
  final Set<AntTabBarItemState> _items = <AntTabBarItemState>{};
  String? _currentActiveId;

  Color? get color {
    return widget.color;
  }

  Color? get activeColor {
    return widget.activeColor;
  }

  void _itemDidChange() {
    _forceRebuild();
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  void _register(AntTabBarItemState item) {
    _items.add(item);
  }

  bool isActive(String id) {
    return _currentActiveId == id;
  }

  void _setCurrentActiveId(String id) {
    if (id == _currentActiveId) {
      return;
    }
    setState(() {
      _currentActiveId = id;
    });
    _itemDidChange();
    widget.onChange?.call(id);
  }

  @override
  void initState() {
    super.initState();
    _currentActiveId = (widget.activeId ?? widget.defaultActiveId)?? widget.items?.first.id;
  }

  @override
  void didUpdateWidget(AntTabBar oldWidget) {

    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeId != widget.activeId) {
      setState(() {
        _currentActiveId = widget.activeId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: _AntTabBarScope(
            tabBarState: this,
            generation: _generation,
            child: Container(
              decoration: widget.decoration,
              child: BottomAppBar(
                color: Colors.transparent,
                height: widget.height!,
                padding: widget.padding ?? EdgeInsets.only(top: 4, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.items ?? [],
                ),
              ),
            )));
  }
}

class _AntTabBarScope extends InheritedWidget {
  const _AntTabBarScope({required super.child,
    required int generation,
    required AntTabBarState tabBarState})
      : _generation = generation,
        _tabBarState = tabBarState;
  final int _generation;
  final AntTabBarState _tabBarState;

  @override
  bool updateShouldNotify(_AntTabBarScope old) =>
      _generation != old._generation;
}

typedef TabBarItemTapCallback = void Function(String id);

class AntTabBarItem extends StatefulWidget {
  const AntTabBarItem({super.key,
    required this.id,
    this.child,
    this.icon,
    this.label,
    this.onPressed,
    this.color,
    this.activeColor, this.stopPropagation});

  final String id;
  final Widget? child;
  final IconData? icon;
  final String? label;
  final TabBarItemTapCallback? onPressed;
  final Color? color;
  final Color? activeColor;
  final bool? stopPropagation;

  @override
  State<StatefulWidget> createState() => AntTabBarItemState();
}

class AntTabBarItemState extends State<AntTabBarItem> {
  Color? get color {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    if (widget.color != null) {
      return widget.color!;
    }
    if (tabBar?.color != null) {
      return tabBar?.color;
    }
    return null;
  }

  Color? get activeColor {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    if (widget.activeColor != null) {
      return widget.activeColor!;
    }
    if (tabBar?.activeColor != null) {
      return tabBar?.activeColor;
    }
    return null;
  }

  void didChange() {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    tabBar?._itemDidChange();
  }

  @override
  Widget build(BuildContext context) {
    AntTabBarState? tabBar = AntTabBar.maybeOf(context);
    tabBar?._register(this);

    List<Widget> children = [];
    if (widget.icon != null) {
      children.add(Icon(
        widget.icon! as IconData?,
        color: tabBar!.isActive(widget.id) ? activeColor : color,
      ));
    }
    if (widget.label != null) {
      children.add(Text(
        widget.label ?? '',
        style: TextStyle(
            fontSize: 10,
            color: tabBar!.isActive(widget.id) ? activeColor : color),
      ));
    }

    return Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            if (widget.stopPropagation == true) {
              return;
            }
            tabBar?._setCurrentActiveId(widget.id);
            widget.onPressed?.call(widget.id);
          },
          child: widget.child ??
              Column(
                children: children,
              ),
        ));
  }
}

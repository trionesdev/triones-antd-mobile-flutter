import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntTabItemStruct {
  AntTabItemStruct({required this.key, this.label, this.content});

  String key;
  Widget? label;
  Widget? content;
}

class AntTabStyles {
  StateStyle? tab;
  StateStyle? activeTab;
  StateStyle? body;
}

class AntTabs extends StatefulWidget {
  const AntTabs(
      {super.key,
      this.items,
      this.stretch = true,
      this.defaultActiveKey,
      this.activeKey,
      this.children,
      this.style,
      this.styles,
      this.decoration,
      this.itemBuilder,
      this.tabDecoration});

  final String? defaultActiveKey;
  final String? activeKey;
  final List<AntTabItemStruct>? items;
  final bool stretch;
  final List<AntTab>? children;
  final BoxDecoration? decoration;
  final BoxDecoration? tabDecoration;
  final StateStyle? style;
  final AntTabStyles? styles;
  final Widget Function(AntTabItemStruct item)? itemBuilder;

  @override
  State<StatefulWidget> createState() => AntTabsState();

  static AntTabsState? maybeOf(BuildContext context) {
    final _AntTabsScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntTabsScope>();
    return scope?._tabsState;
  }
}

class AntTabsState extends State<AntTabs> with MaterialStateMixin {
  ScrollController? _scrollController;
  List<AntTabItemStruct> _items = [];
  int _generation = 0;
  String? _activeKey;
  int _index = 0;
  List<Widget> _tabs = [];
  List<Widget> _contents = [];

  final Set<AntTabState> _tabStates = <AntTabState>{};

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  int getIndex(String? tabKey) {
    for (int i = 0; i < _tabStates.length; i++) {
      if (_tabStates.elementAtOrNull(i)?.widget.antKey == tabKey) {
        return i;
      }
    }
    return -1;
  }

  int getStateIndex(AntTabState state) {
    for (int i = 0; i < _tabStates.length; i++) {
      if (_tabStates.elementAtOrNull(i) == state) {
        return i;
      }
    }
    return -1;
  }

  void _didTabChange(AntTabState state) {
    _activeKey = state.widget.antKey;
    _index = getStateIndex(state);
    _forceRebuild();
    if (_tabStates.isNotEmpty) {
      for (var state in _tabStates) {
        state._tabsActiveTabChange(_activeKey);
      }
    }
  }

  List<Widget> _itemTabs() {
    return _items.map((item) {
      return AntTab(
        antKey: item.key,
        label: item.label,
        style: widget.styles?.tab,
        activeStyle: widget.styles?.activeTab,
        bodyStyle: widget.styles?.body,
      );
    }).toList();
  }

  List<Widget> _itemContents() {
    return _items.map((item) {
      return item.content ?? Container();
    }).toList();
  }

  void _generateTabsFromItems() {
    _items = widget.items ?? [];
    _tabs = _itemTabs();
    _contents = _itemContents();
  }

  void _generateTabsFromChildren() {
    List<Widget> tabWidgets = [];
    List<Widget> contentWidgets = [];
    for (var child in widget.children!) {
      tabWidgets.add(child);
      contentWidgets.add(child.content ?? Container());
    }
    _tabs = tabWidgets;
    _contents = contentWidgets;
  }


  void _register(AntTabState tabState) {
    _tabStates.add(tabState);
    tabState._tabsActiveTabChange(_activeKey);
  }

  void _unregister(AntTabState tabState) {
    _tabStates.remove(tabState);
  }

  Widget _tabHeader() {
    Widget tabHeader;
    if (widget.stretch) {
      tabHeader = Row(
        children: _tabs.map((tab) {
          return Expanded(child: tab);
        }).toList(),
      );
    } else {
      if (kIsWeb) {
        tabHeader = Scrollbar(
            controller: _scrollController,
            thickness: 2,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _tabs,
              ),
            ));
      } else {
        tabHeader = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _tabs,
          ),
        );
      }
    }
    return tabHeader;
  }

  void init() {
    if (widget.children != null && widget.children!.isNotEmpty) {
      _generateTabsFromChildren();
    } else if (widget.items != null && widget.items!.isNotEmpty) {
      _generateTabsFromItems();
    }

    _activeKey = widget.activeKey ?? widget.defaultActiveKey;
    // _index = getIndex(_activeKey);
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _scrollController = ScrollController();
    }
    init();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _forceRebuild();
    });
  }

  @override
  void didUpdateWidget(covariant AntTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items ||
        widget.activeKey != oldWidget.activeKey ||
        widget.children != oldWidget.children) {
      init();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (kIsWeb) {
      _scrollController?.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    StateStyle stateStyle = _AntTabsStyle(context);
    stateStyle = stateStyle.merge(widget.style);
    return PopScope(
        child: _AntTabsScope(
            tabsState: this,
            generation: _generation,
            child: Container(
              // width: double.infinity,
              decoration: widget.decoration ??
                  stateStyle.resolve(materialStates)?.decoration,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: themeData.colorBorder))),
                    child: _tabHeader(),
                  ),
                  Expanded(
                      child: IndexedStack(index: _index, children: _contents))
                ],
              ),
            )));
  }
}

class _AntTabsStyle extends StateStyle {
  _AntTabsStyle(this.context);

  final BuildContext context;

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    return Style();
  }
}

class _AntTabsScope extends InheritedWidget {
  const _AntTabsScope({
    required super.child,
    required AntTabsState tabsState,
    required int generation,
  })  : _tabsState = tabsState,
        _generation = generation;

  final int _generation;
  final AntTabsState _tabsState;

  @override
  bool updateShouldNotify(covariant _AntTabsScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}

class AntTab extends StatefulWidget {
  const AntTab({
    super.key,
    this.style,
    required this.antKey,
    this.label,
    this.content,
    this.onTab,
    this.activeStyle,
    this.bodyStyle,
    this.decoration,
  });

  final StateStyle? style;
  final String antKey;

  final Widget? label;
  final Widget? content;
  final BoxDecoration? decoration;
  final Function(AntTabState? state)? onTab;

  final StateStyle? activeStyle;
  final StateStyle? bodyStyle;

  @override
  State<StatefulWidget> createState() => AntTabState();
}

class AntTabState extends State<AntTab> with MaterialStateMixin {
  bool _active = false;
  _AntTabsScope? _ancestor;

  int get index {
    return AntTabs.maybeOf(context)?.getStateIndex(this) ?? -1;
  }

  void _tabsActiveTabChange(String? activeKey) {
    if (activeKey == null) {
      if (index == 0) {
        setState(() {
          _active = true;
        });
      }
      return;
    }
    bool active = (widget.antKey == activeKey);

    if (_active != active) {
      setState(() {
        _active = active;
      });
    }
  }

  Widget? _labelRender() {
    AntThemeData themeData = AntTheme.of(context);

    Widget? label = widget.label;
    if (_active && label != null && label is Text) {
      return WidgetUtils.textMerge(
          Text(
            label.data ?? "",
            style: TextStyle(color: themeData.colorPrimary),
          ),
          label);
    }
    return label;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _ancestor?._tabsState._unregister(this);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AntTab oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ancestor = context.dependOnInheritedWidgetOfExactType<_AntTabsScope>();
  }

  @override
  Widget build(BuildContext context) {
    AntTabsState? tabsState = AntTabs.maybeOf(context);
    tabsState?._register(this);
    StateStyle stateStyle = _AntTabItemStyle(context, _active);
    stateStyle = stateStyle.merge(widget.style);
    return GestureDetector(
      onTap: () {
        tabsState?._didTabChange(this);
      },
      child: Container(
        decoration: widget.decoration ??
            (_active
                ? stateStyle
                    .merge(widget.activeStyle)
                    .resolve(materialStates)
                    ?.decoration
                : stateStyle.resolve(materialStates)?.decoration),
        padding: stateStyle.resolve(materialStates)?.computedPadding,
        child: Center(child: _labelRender()),
      ),
    );
  }
}

class _AntTabItemStyle extends StateStyle {
  const _AntTabItemStyle(this.context, this.active);

  final BuildContext context;
  final bool active;

  @override
  Style get style {
    AntThemeData themeData = AntTheme.of(context);
    return Style(
        color: active ? themeData.colorPrimary : null,
        backgroundColor: Colors.white,
        padding: StylePadding.symmetric(vertical: 8, horizontal: 8),
        borderBottom: active
            ? StyleBorder(
                color: themeData.colorPrimary,
                width: 1,
                style: BorderStyle.solid)
            : null);
  }
}

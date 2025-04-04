import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AntTabItemRecord {
  AntTabItemRecord({this.key, this.label, this.content});

  String? key;
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
      this.activeKey,
      this.style,
      this.styles,
      this.decoration,
      this.itemRender,
      this.tabDecoration});

  final String? activeKey;
  final List<AntTabItemRecord>? items;
  final bool stretch;
  final BoxDecoration? decoration;
  final BoxDecoration? tabDecoration;
  final StateStyle? style;
  final AntTabStyles? styles;
  final Widget Function(AntTabItemRecord item)? itemRender;

  @override
  State<StatefulWidget> createState() => _AntTabsState();
}

class _AntTabsState extends State<AntTabs> with MaterialStateMixin {
  late ScrollController _scrollController;
  List<AntTabItemRecord> _items = [];
  late String? _activeKey;
  int _index = 0;

  int getIndex(String? key) {
    return _items.indexWhere((item) {
      return item.key == key;
    });
  }

  Widget _generateTabs() {
    List<Widget> tabs = _items.map((item) {
      return AntTabItem(
        item: item,
        activeKey: _activeKey,
        style: widget.styles?.tab,
        activeStyle: widget.styles?.activeTab,
        bodyStyle: widget.styles?.body,
        onTab: (k) {
          setState(() {
            _activeKey = k;
            _index = getIndex(k);
          });
        },
      );
    }).toList();
    Widget tabHeader;
    if (widget.stretch) {
      tabHeader = Row(
        children: tabs.map((tab) {
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
                children: tabs,
              ),
            ));
      } else {
        tabHeader = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tabs,
          ),
        );
      }
    }
    return tabHeader;
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _scrollController = ScrollController();
    }
    setState(() {
      _items = widget.items ?? [];
      _activeKey = widget.activeKey ?? _items.elementAtOrNull(0)?.key;
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (kIsWeb) {
      _scrollController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    StateStyle stateStyle = _AntTabsStyle(context);
    stateStyle = stateStyle.merge(widget.style);
    return Container(
      width: double.infinity,
      decoration:
          widget.decoration ?? stateStyle.resolve(materialStates)?.decoration,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: themeData.colorBorder))),
            child: _generateTabs(),
          ),
          Expanded(
              child: IndexedStack(
            index: _index,
            children: _items.map((item) {
              return item.content ?? Container();
            }).toList(),
          ))
        ],
      ),
    );
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

class AntTabItem extends StatefulWidget {
  const AntTabItem(
      {super.key,
      this.item,
      this.activeKey,
      this.onTab,
      this.style,
      this.itemRender,
      this.activeStyle,
      this.bodyStyle,
      this.decoration});

  final StateStyle? style;
  final AntTabItemRecord? item;
  final String? activeKey;
  final BoxDecoration? decoration;
  final Function(String? key)? onTab;
  final Widget Function(AntTabItemRecord item, bool active)? itemRender;

  final StateStyle? activeStyle;
  final StateStyle? bodyStyle;

  @override
  State<StatefulWidget> createState() => _AntTabItemState();
}

class _AntTabItemState extends State<AntTabItem> with MaterialStateMixin {
  bool _active = false;

  Widget? _labelRender() {
    AntThemeData themeData = AntTheme.of(context);
    if (widget.itemRender != null) {
      return widget.itemRender?.call(widget.item!, _active);
    }
    Widget? label = widget.item?.label;
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
    setState(() {
      _active = widget.item?.key == widget.activeKey;
    });
  }

  @override
  void didUpdateWidget(covariant AntTabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.activeKey != oldWidget.activeKey) {
      _active = widget.item?.key == widget.activeKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    StateStyle stateStyle = _AntTabItemStyle(context, _active);
    stateStyle = stateStyle.merge(widget.style);
    return GestureDetector(
      onTap: () {
        widget.onTab?.call(widget.item!.key);
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
        padding: StylePadding.symmetric(vertical: 8, horizontal: 8),
        borderBottom: active
            ? StyleBorder(
                color: themeData.colorPrimary,
                width: 1,
                style: BorderStyle.solid)
            : null);
  }
}

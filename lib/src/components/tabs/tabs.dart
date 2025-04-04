import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

class AntTabItemRecord {
  AntTabItemRecord({this.key, this.label, this.content});

  String? key;
  Widget? label;
  Widget? content;
}

class AntTabs extends StatefulWidget {
  const AntTabs({super.key, this.items, this.stretch = true, this.activeKey});

  final String? activeKey;
  final List<AntTabItemRecord>? items;
  final bool stretch;

  @override
  State<StatefulWidget> createState() => _AntTabsState();
}

class _AntTabsState extends State<AntTabs> {
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
    return Container(
      child: Column(
        children: [
          Container(
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

class AntTabItem extends StatefulWidget {
  const AntTabItem({super.key, this.item, this.activeKey, this.onTab});

  final AntTabItemRecord? item;
  final String? activeKey;
  final Function(String? key)? onTab;

  @override
  State<StatefulWidget> createState() => _AntTabItemState();
}

class _AntTabItemState extends State<AntTabItem> {
  bool _active = false;

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
    AntThemeData themeData = AntTheme.of(context);
    return GestureDetector(
      onTap: () {
        widget.onTab?.call(widget.item!.key);
      },
      child: Container(
        decoration: BoxDecoration(
            border: _active
                ? Border(
                    bottom: BorderSide(color: themeData.colorPrimary, width: 1))
                : null),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Center(
          child: widget.item?.label,
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntBreadcrumbItemRecord {
  AntBreadcrumbItemRecord({this.title, this.onTap});

  String? title;
  void Function()? onTap;
}

class AntBreadcrumb extends StatefulWidget {
  const AntBreadcrumb({super.key, this.separator, this.items, this.itemRender});

  final List<AntBreadcrumbItemRecord>? items;
  final Widget? separator;
  final Widget? Function(AntBreadcrumbItemRecord item, int index)? itemRender;

  @override
  State<StatefulWidget> createState() => _AntBreadcrumbState();
}

class _AntBreadcrumbState extends State<AntBreadcrumb> {

  late ScrollController _scrollController;

  List<Widget> _buildItems(List<AntBreadcrumbItemRecord> records) {
    AntThemeData    themeData =  AntTheme.of(context);
    List<Widget> result = [];
    for (var i = 0; i < records.length; i++) {
      bool isLast = i == records.length - 1;
      result.add(GestureDetector(
        onTap: (){
          records[i].onTap?.call();
        },
        child: widget.itemRender?.call(records[i], i) ??
            Text(
              records[i].title ?? '',
              style: TextStyle(color: isLast ? null : themeData.colorBorder),
            ),
      ));
      if (isLast) {
        break;
      }
      result.add(widget.separator ??
          Text(' / ', style: TextStyle(color: themeData.colorBorder)));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _scrollController = ScrollController();
    }
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
    if (kIsWeb) {
      return Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Row(
              spacing: 4,
              children: _buildItems(widget.items ?? []),
            ),
          ));
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 4,
          children: _buildItems(widget.items ?? []),
        ),
      );
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AntBreadcrumbItemRecord {
  AntBreadcrumbItemRecord({this.title, this.onTap});

  String? title;
  Function(BuildContext context)? onTap;
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
    List<Widget> result = [];
    for (var i = 0; i < records.length; i++) {
      bool isLast = i == records.length - 1;
      result.add(GestureDetector(
        onTap: records[i].onTap?.call(context),
        child: widget.itemRender?.call(records[i], i) ??
            Text(
              records[i].title ?? '',
              style: TextStyle(color: isLast ? null : Color(0xff8C8C8C)),
            ),
      ));
      if (isLast) {
        break;
      }
      result.add(widget.separator ??
          const Text(' / ', style: TextStyle(color: Color(0xff8C8C8C))));
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

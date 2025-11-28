import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../trionesdev_antd_mobile.dart';

class AntBreadcrumbItemStruct {
  AntBreadcrumbItemStruct({this.title, this.onTap});

  /// @description 标题
  /// @default null
  String? title;

  /// @description 点击事件
  /// @default null
  void Function()? onTap;
}

/// @component Breadcrumb 面包屑
class AntBreadcrumb extends StatefulWidget {
  const AntBreadcrumb({super.key, this.separator, this.items, this.itemRender});

  /// @description 面包屑项
  /// @default null
  final List<AntBreadcrumbItemStruct>? items;

  /// @description 分隔符
  /// @default null
  final Widget? separator;

  /// @description 自定义渲染
  /// @default null
  final Widget? Function(AntBreadcrumbItemStruct item, int index)? itemRender;

  @override
  State<StatefulWidget> createState() => _AntBreadcrumbState();
}

class _AntBreadcrumbState extends State<AntBreadcrumb> {
  late ScrollController _scrollController;

  List<Widget> _buildItems(List<AntBreadcrumbItemStruct> records) {
    AntThemeData themeData = AntTheme.of(context);
    List<Widget> result = [];
    for (var i = 0; i < records.length; i++) {
      bool isLast = i == records.length - 1;
      result.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            records[i].onTap?.call();
          },
          child:
              widget.itemRender?.call(records[i], i) ??
              Text(
                records[i].title ?? '',
                style: TextStyle(color: isLast ? null : themeData.colorBorder),
              ),
        ),
      );
      if (isLast) {
        break;
      }
      result.add(
        widget.separator ??
            Text(' / ', style: TextStyle(color: themeData.colorBorder)),
      );
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
          child: Row(spacing: 4, children: _buildItems(widget.items ?? [])),
        ),
      );
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(spacing: 4, children: _buildItems(widget.items ?? [])),
      );
    }
  }
}

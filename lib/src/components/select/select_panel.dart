import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class SelectPanel extends StatefulWidget {
  const SelectPanel({
    super.key,
    this.multiple = false,
    this.showSearch = false,
    this.placeholder,
    this.fieldsNames,
    required this.options,
    this.onSearch,
    this.onChange,
    this.searchPlaceholder,
    this.value,
    this.optionBuilder,
    this.onRefresh,
    //距顶部多远时（单位px），触发 scrolltoupper 事件
    this.upperThreshold = 50,
    //距底部多远时（单位px），触发 scrolltolower 事件
    this.lowerThreshold = 50,
    this.onScrollToLower,
    this.padding,
  });

  final bool? multiple;
  final bool showSearch;
  final String? placeholder;
  final String? searchPlaceholder;
  final AntFieldsNames? fieldsNames;
  final ValueNotifier<List<dynamic>> options;
  final ValueChanged<dynamic>? onSearch;
  final dynamic value;
  final ValueChanged<dynamic>? onChange;
  final AntSelectOptionBuilder? optionBuilder;
  final AsyncCallback? onRefresh;
  final int upperThreshold;
  final int lowerThreshold;
  final AsyncCallback? onScrollToLower;
  final EdgeInsetsGeometry? padding;

  @override
  State<StatefulWidget> createState() => SelectPanelState();
}

class SelectPanelState extends State<SelectPanel> {
  final ScrollController _scrollController = ScrollController();
  late AntFieldsNames _fieldsNames = AntFieldsNames(
    label: NamePath("label"),
    value: NamePath("value"),
  );

  dynamic _value;
  bool _loadingMore = false;

  void selectItem(value) {
    setState(() {
      if (widget.multiple == true) {
        _value ??= [];
        if (_value.contains(value)) {
          _value.remove(value);
        } else {
          _value.add(value);
        }
        widget.onChange?.call(_value);
      } else {
        _value = value;
        Navigator.of(context).maybePop(true).then((_) {
          widget.onChange?.call(_value);
        });
      }
    });
  }

  void _scheduleCheckNeedLoadMore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkNeedLoadMore();
    });
  }

  /// 当前数据未撑满可视区域时无法触发滚动监听，需主动加载下一页
  Future<void> _checkNeedLoadMore() async {
    if (!mounted || !_scrollController.hasClients) return;
    if (widget.onScrollToLower == null || _loadingMore) return;
    if (!_scrollController.position.hasContentDimensions) return;

    if (_scrollController.position.maxScrollExtent <= widget.lowerThreshold) {
      final lengthBefore = widget.options.value.length;
      _loadingMore = true;
      try {
        await widget.onScrollToLower!.call();
      } finally {
        _loadingMore = false;
        if (mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // 仅在有新增数据时继续补页，避免无更多数据时死循环
            if (widget.options.value.length > lengthBefore) {
              _checkNeedLoadMore();
            }
          });
        }
      }
    }
  }

  void _onOptionsChanged() {
    _scheduleCheckNeedLoadMore();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_loadingMore) return;
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - widget.lowerThreshold) {
        widget.onScrollToLower?.call();
      }
    });
    _fieldsNames = AntFieldsNames(
      label: widget.fieldsNames?.label ?? NamePath("label"),
      value: widget.fieldsNames?.value ?? NamePath("value"),
    );

    _value = widget.value ?? (widget.multiple == true ? [] : null);
    widget.options.addListener(_onOptionsChanged);
    super.initState();
    _scheduleCheckNeedLoadMore();
  }

  @override
  void didUpdateWidget(covariant SelectPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.options != widget.options) {
      oldWidget.options.removeListener(_onOptionsChanged);
      widget.options.addListener(_onOptionsChanged);
    }
  }

  @override
  void dispose() {
    widget.options.removeListener(_onOptionsChanged);
    _scrollController.dispose();
    super.dispose();
  }

  bool handleSelected(item) {
    if (widget.multiple == true) {
      if (_value == null || _value.isEmpty) {
        return false;
      }
      return _value.contains(MapUtils.getPathValue(item, _fieldsNames.value?.value));
    } else {
      if (_value == null) {
        return false;
      }
      return _value == MapUtils.getPathValue(item, _fieldsNames.value?.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return Column(
      children: [
        if (widget.showSearch)
          Container(
            padding: EdgeInsets.all(8),
            child: AntSearchBar(
              showSearchButton: true,
              placeholder: widget.searchPlaceholder,
              onChange: (value) {
                widget.onSearch?.call(value);
              },
            ),
          ),
        Expanded(
          child: RefreshIndicator(
            notificationPredicate: (notification) {
              return widget.onRefresh != null;
            },
            onRefresh: () async {
              await widget.onRefresh?.call();
            },
            child: ValueListenableBuilder<List<dynamic>>(
              valueListenable: widget.options,
              builder: (context, options, _) {
                return AntList(
                  padding: widget.padding,
                  controller: _scrollController,
                  dataSource: options,
                  itemBuilder: (context, item, index) {
                    var selected = handleSelected(item);
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        selectItem(
                          MapUtils.getPathValue(
                            item,
                            _fieldsNames.value?.value,
                          ),
                        );
                      },
                      child:
                          widget.optionBuilder != null
                              ? widget.optionBuilder!(
                                context,
                                item,
                                index,
                                selected,
                              )
                              : Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      MapUtils.getPathValue(
                                            item,
                                            _fieldsNames.label?.value,
                                          ) ??
                                          "",
                                      style: TextStyle(
                                        color:
                                            selected
                                                ? themeData.colorPrimary
                                                : null,
                                      ),
                                    ),
                                    if (selected)
                                      Icon(
                                        AntIcons.checkOutline,
                                        size: 16,
                                        color:
                                            selected
                                                ? themeData.colorPrimary
                                                : null,
                                      ),
                                  ],
                                ),
                              ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

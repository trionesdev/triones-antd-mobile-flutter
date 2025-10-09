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

  @override
  State<StatefulWidget> createState() => SelectPanelState();
}

class SelectPanelState extends State<SelectPanel> {
  final ScrollController _scrollController = ScrollController();
  late AntFieldsNames _fieldsNames = AntFieldsNames(
    label: "label",
    value: "value",
  );

  dynamic _value;

  void refreshUI() {
    setState(() {});
  }

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

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - widget.lowerThreshold) {
        widget.onScrollToLower?.call();
      }
    });
    _fieldsNames = AntFieldsNames(
      label: widget.fieldsNames?.label ?? "label",
      value: widget.fieldsNames?.value ?? "value",
    );

    _value = widget.value ?? (widget.multiple == true ? [] : null);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            child: AntList(
              controller: _scrollController,
              dataSource: widget.options.value,
              itemBuilder: (context, item, index) {
                var selected =
                    (widget.multiple == true)
                        ? _value.contains(item[_fieldsNames.value])
                        : _value == item[_fieldsNames.value];
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    selectItem(item[_fieldsNames.value]);
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item[_fieldsNames.label],
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
            ),
          ),
        ),
      ],
    );
  }
}

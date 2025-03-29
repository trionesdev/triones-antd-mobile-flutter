import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

import '../theme/theme.dart';
import 'cascader_picker.dart';

class TabItem {
  final String tabKey;
  final String? label;
  final AntCascaderPickerOption? value;
  final List<AntCascaderPickerOption>? options;

  const TabItem({
    required this.tabKey,
    this.label,
    this.value,
    this.options,
  });
}

class CascaderPickerColumn {
  final AntCascaderPickerOption? value;
  final List<AntCascaderPickerOption>? options;

  const CascaderPickerColumn({
    this.value,
    this.options,
  });
}

class AntCascaderPickerView extends StatefulWidget {
  const AntCascaderPickerView({
    super.key,
    this.options,
    this.onOk,
    this.onCancel,
    this.value,
    this.title,
    this.itemHeight = 34,
  });

  final List<AntCascaderPickerOption>? options;
  final List<String>? value;
  final VoidCallback? onCancel;
  final ValueChanged<List<AntCascaderPickerOption?>?>? onOk;
  final Widget? title;
  final double? itemHeight;

  @override
  State<StatefulWidget> createState() => _AntCascaderPickerViewState();
}

class _AntCascaderPickerViewState extends State<AntCascaderPickerView> {
  int _activeIndex = 0;
  double viewHeight = 0;

  List<AntCascaderPickerOption> _options = [];
  List<CascaderPickerColumn> _columns = [];

  AntCascaderPickerOption? findOptionByValue(
      List<AntCascaderPickerOption>? options, String? value) {
    print(options);
    print(value);
    if (value == null || options == null || options.isEmpty) {
      return null;
    }
    for (int i = 0; i < options.length; i++) {
      if (options.elementAtOrNull(i)?.value == value) {
        return options.elementAtOrNull(i);
      }
    }
    return null;
  }

  AntCascaderPickerOption? findOptionByValues(
      List<AntCascaderPickerOption>? options, List<String>? values) {
    if (values == null ||
        values.isEmpty ||
        options == null ||
        options.isEmpty) {
      return null;
    }
    List<AntCascaderPickerOption>? levelOptions = options;
    AntCascaderPickerOption? matchOption;
    for (int i = 0; i < values.length; i++) {
      matchOption = findOptionByValue(levelOptions, values.elementAtOrNull(i));
      levelOptions = matchOption?.children;
    }
    return matchOption;
  }

  List<CascaderPickerColumn> generateColumnsByValues(List<String>? values) {
    if (widget.options == null || widget.options!.isEmpty) {
      return [];
    }
    if (values == null || values.isEmpty) {
      return [CascaderPickerColumn(options: _options)];
    }
    List<CascaderPickerColumn> columns = [];
    AntCascaderPickerOption? value;
    List<AntCascaderPickerOption>? options = _options;
    for (int i = 0; i < values.length; i++) {
      value = findOptionByValue(options, values.elementAtOrNull(i));
      CascaderPickerColumn column = CascaderPickerColumn(
        value: value,
        options: options,
      );
      columns.add(column);
      options = value?.children;
    }
    if (options != null && options.isNotEmpty) {
      columns.add(CascaderPickerColumn(
        options: options,
      ));
    }
    return columns;
  }

  @override
  void initState() {
    super.initState();
    _options = widget.options ?? [];
    _columns = generateColumnsByValues(widget.value);
    _activeIndex = _columns.length - 1;
  }

  @override
  void didUpdateWidget(AntCascaderPickerView oldWidget) {
    if (widget.value != oldWidget.value) {
      _columns = generateColumnsByValues(widget.value);
      _activeIndex = _columns.length - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: themeData.colorBorder, width: 0.5),
            ),
          ),
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                child: Text(
                  "取消",
                  style: TextStyle(color: themeData.colorPrimary),
                ),
              ),
              onTap: () {
                widget.onCancel?.call();
              },
            ),
            if (widget.title != null)
              Expanded(
                  child: Center(
                child: widget.title!,
              )),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                child:
                    Text("确定", style: TextStyle(color: themeData.colorPrimary)),
              ),
              onTap: () {
                List<AntCascaderPickerOption?>? result = _columns.map((column) {
                  return column.value;
                }).toList();
                widget.onOk?.call(result);
              },
            ),
          ]),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Row(
            children: _columns.asMap().keys.map((index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _activeIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: (index == _activeIndex)
                        ? Border(
                            bottom: BorderSide(
                                color: themeData.colorPrimary, width: 1),
                          )
                        : null,
                  ),
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                  child: Text(
                    _columns[index].value?.label ?? '请选择',
                    style: TextStyle(
                        color: (index == _activeIndex)
                            ? themeData.colorPrimary
                            : null),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          print(constraints.maxHeight);
          viewHeight = constraints.maxHeight;
          return IndexedStack(
            index: _activeIndex,
            children: _columns.asMap().keys.map((index) {
              return AntCascaderPickerViewColumn(
                itemHeight: widget.itemHeight,
                value: _columns.elementAtOrNull(index)?.value,
                options: _columns.elementAtOrNull(index)?.options,
                onSelected: (option) {
                  setState(() {
                    List<CascaderPickerColumn> newColumns = [];
                    for (int i = 0; i < index; i++) {
                      newColumns.add(_columns[i]);
                    }
                    newColumns.add(CascaderPickerColumn(
                      value: option,
                      options: _columns[index].options,
                    ));
                    if (option?.children != null &&
                        option!.children!.isNotEmpty) {
                      newColumns.add(CascaderPickerColumn(
                        options: option.children,
                      ));
                      _activeIndex = index + 1;
                    }
                    _columns = newColumns;
                  });
                },
              );
            }).toList(),
          );
        }))
      ],
    );
  }
}

class AntCascaderPickerViewColumn extends StatefulWidget {
  const AntCascaderPickerViewColumn(
      {super.key,
      this.options,
      this.onSelected,
      this.value,
      this.itemHeight = 34});

  final List<AntCascaderPickerOption>? options;
  final ValueChanged<AntCascaderPickerOption?>? onSelected;
  final AntCascaderPickerOption? value;
  final double? itemHeight;

  @override
  State<StatefulWidget> createState() => _AntCascaderPickerViewColumnState();
}

class _AntCascaderPickerViewColumnState
    extends State<AntCascaderPickerViewColumn> {
  ScrollController _controller = ScrollController();

  bool selected(index) {
    return widget.value?.value == widget.options?[index].value;
  }

  int selectedIndex(AntCascaderPickerOption? value) {
    if (value == null) {
      return -1;
    }
    for (int i = 0; i < (widget.options?.length ?? 0); i++) {
      if (value.value == widget.options?[i].value) {
        return i;
      }
    }
    return -1;
  }

  double scrollOffsetByValue(AntCascaderPickerOption? value) {
    int index = selectedIndex(value);
    if (index == -1) {
      return 0;
    }
    return index * widget.itemHeight!;
  }

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      _controller = ScrollController(
          initialScrollOffset: scrollOffsetByValue(widget.value));
    }
  }

  @override
  void didUpdateWidget(AntCascaderPickerViewColumn oldWidget) {
    if (oldWidget.value != widget.value) {
      _controller = ScrollController(
          initialScrollOffset: scrollOffsetByValue(widget.value));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return ListView.builder(
        itemExtent: widget.itemHeight,
        controller: _controller,
        itemCount: widget.options?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (widget.options?.elementAtOrNull(index)?.value !=
                    widget.value?.value) {
                  widget.onSelected?.call(widget.options?[index]);
                }
              });
            },
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    widget.options?[index].label ?? "",
                    style: TextStyle(
                        color: selected(index) ? themeData.colorPrimary : null),
                  )),
                  if (selected(index))
                    Icon(
                      Icons.check,
                      color: themeData.colorPrimary,
                    )
                ],
              ),
            ),
          );
        });
  }
}

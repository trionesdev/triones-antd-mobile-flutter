import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

enum AntSelectMode { multiple, tags }

enum AntSelectModalMode { page, popup }

class AntFieldsNames {
  String label;
  String value;

  AntFieldsNames({this.label = "label", this.value = "value"});
}

typedef AntSelectOptionBuilder =
    Widget Function(
      BuildContext context,
      dynamic item,
      int index,
      bool selected,
    );

class AntSelect extends StatefulWidget {
  const AntSelect({
    super.key,
    this.mode,
    this.modalMode = AntSelectModalMode.popup,
    this.showSearch = false,
    this.title,
    this.placeholder,
    this.arrow = false,
    this.fieldsNames,
    this.options = const [],
    this.onSearch,
    this.onChange,
    this.searchPlaceholder,
    this.value,
    this.optionBuilder,
  });

  final AntSelectMode? mode;
  final AntSelectModalMode modalMode;
  final bool showSearch;
  final String? title;
  final String? placeholder;
  final String? searchPlaceholder;
  final bool arrow;
  final AntFieldsNames? fieldsNames;
  final List<dynamic> options;
  final ValueChanged<dynamic>? onSearch;
  final dynamic value;
  final ValueChanged<dynamic>? onChange;
  final AntSelectOptionBuilder? optionBuilder;

  @override
  State<StatefulWidget> createState() => _AntSelectState();
}

class _AntSelectState extends State<AntSelect> {
  late AntFieldsNames _fieldsNames = AntFieldsNames(
    label: "label",
    value: "value",
  );
  dynamic _value;

  Widget? get content {
    print("content");
    if (_value == null) {
      return null;
    }
    if (widget.options.isEmpty) {
      return null;
    }
    if (widget.mode != null) {
      print(_value);
      var labels = widget.options
          .where((item) {
            return (_value as List).contains(item[_fieldsNames.value]);
          })
          .map((item) => item[_fieldsNames.label]);
      return (labels != null && labels.isNotEmpty)
          ? Text(labels.join(","))
          : null;
    } else {
      var label =
          widget.options.firstWhereOrNull((item) {
            return item[_fieldsNames.value] == _value;
          })?[_fieldsNames.label];
      print(label);
      return label != null ? Text(label!) : null;
    }
  }

  @override
  void initState() {
    super.initState();
    _fieldsNames = AntFieldsNames(
      label: widget.fieldsNames?.label ?? "label",
      value: widget.fieldsNames?.value ?? "value",
    );
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);
    return AntCell(
      placeholder: widget.placeholder,
      arrow: widget.arrow,
      child: content,
      onTap: () {
        Widget content = _SelectPanel(
          mode: widget.mode,
          showSearch: widget.showSearch,
          placeholder: widget.placeholder,
          fieldsNames: widget.fieldsNames,
          onSearch: widget.onSearch,
          searchPlaceholder: widget.searchPlaceholder,
          options: widget.options,
          value: _value,
          onChange: (value) {
            print("onChange");
            setState(() {
              _value = value;
            });
            widget.onChange?.call(value);
          },
        );

        if (widget.modalMode == AntSelectModalMode.page) {
          final result = Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true, // 关键参数
              builder:
                  (context) => AntScaffold(
                    appBar: AntAppBar(
                      backIcon: Icon(Icons.arrow_back, color: Colors.white),
                      title:
                          widget.title != null
                              ? Text(
                                widget.title!,
                                style: TextStyle(color: Colors.white),
                              )
                              : null,
                      onBack: () {
                        Navigator.of(context).maybePop(true).then((_) {});
                      },
                    ),
                    body: content,
                    bottomNavigationBar: SafeArea(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: AntButton(
                                type: AntButtonType.text,
                                text: "取消",
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).maybePop(true).then((_) {});
                                },
                              ),
                            ),
                            Expanded(
                              child: AntButton(
                                type: AntButtonType.primary,
                                text: "确定",
                                onPressed: () {
                                  Navigator.of(context).maybePop(true).then((
                                    _,
                                  ) {
                                    widget.onChange?.call(_value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          );
        } else {
          var result = showModalBottomSheet(
            context: context,
            enableDrag: false,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height - 50,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AntButton(
                            type: AntButtonType.text,
                            text: "取消",
                            onPressed: () {
                              print("cancel");
                              Navigator.of(context).maybePop(true).then((_) {});
                            },
                          ),
                          Container(
                            child:
                                widget.title != null
                                    ? Text(
                                      widget.title!,
                                      style: TextStyle(color: Colors.black),
                                    )
                                    : null,
                          ),
                          AntButton(
                            type: AntButtonType.text,
                            text: "确定",
                            style: StateStyle(
                              style: Style(color: theme.colorPrimary),
                            ),
                            onPressed: () {
                              Navigator.of(context).maybePop(true).then((_) {
                                widget.onChange?.call(_value);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SafeArea(bottom: true, child: content)),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}

class _SelectPanel extends StatefulWidget {
  const _SelectPanel({
    super.key,
    this.mode = AntSelectMode.multiple,
    this.showSearch = false,
    this.placeholder,
    this.fieldsNames,
    this.options = const [],
    this.onSearch,
    this.onChange,
    this.searchPlaceholder,
    this.value,
    this.optionBuilder,
  });

  final AntSelectMode? mode;
  final bool showSearch;
  final String? placeholder;
  final String? searchPlaceholder;
  final AntFieldsNames? fieldsNames;
  final List<dynamic> options;
  final ValueChanged<dynamic>? onSearch;
  final dynamic value;
  final ValueChanged<dynamic>? onChange;
  final AntSelectOptionBuilder? optionBuilder;

  @override
  State<StatefulWidget> createState() => _SelectPanelState();
}

class _SelectPanelState extends State<_SelectPanel> {
  late AntFieldsNames _fieldsNames = AntFieldsNames(
    label: "label",
    value: "value",
  );
  dynamic _value;
  bool _multipleValue = false;

  void selectItem(value) {
    print("selectItem");
    setState(() {
      if (_multipleValue) {
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
    _fieldsNames = AntFieldsNames(
      label: widget.fieldsNames?.label ?? "label",
      value: widget.fieldsNames?.value ?? "value",
    );
    _multipleValue = widget.mode == null ? false : true;
    _value = widget.value ?? (_multipleValue ? [] : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData themeData = AntTheme.of(context);
    return Column(
      children: [
        if (widget.showSearch)
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: AntSearchBar(placeholder: widget.searchPlaceholder),
                ),
                AntButton(type: AntButtonType.primary, text: "搜索"),
              ],
            ),
          ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {},
            child: AntList(
              dataSource: widget.options,
              itemBuilder: (context, item, index) {
                var selected =
                    _multipleValue
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
                                    Icons.check,
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

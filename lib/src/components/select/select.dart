import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntSelect extends StatefulWidget {
  const AntSelect({
    super.key,
    /**
     * 显示的标签
     */
    this.cellLabel,
    this.mode,
    this.pickerMode = AntSelectPickerMode.popup,
    this.showSearch = false,
    this.appBar,
    this.title,
    this.placeholder,
    this.arrow = false,
    this.fieldsNames,
    this.options = const [],
    this.onSearch,
    this.onChange,
    this.searchPlaceholder,
    /**
     * 值
     */
    this.value,
    /**
     * 值选项
     */
    this.valueOption,
    /**
     * 选项构建器
     */
    this.optionBuilder,
    /**
     * 刷新事件
     */
    this.onRefresh,
    this.onScrollToLower,
    this.onOpenChange,
  });

  final String? cellLabel;
  final AntSelectMode? mode;
  final AntSelectPickerMode pickerMode;
  final bool showSearch;
  final PreferredSizeWidget? appBar;
  final String? title;
  final String? placeholder;
  final String? searchPlaceholder;
  final bool arrow;
  final AntFieldsNames? fieldsNames;
  final List<dynamic> options;
  final AntSelectOptionBuilder? optionBuilder;
  final ValueChanged<dynamic>? onSearch;
  final dynamic value;
  final dynamic valueOption;
  final AntSelectValueChanged? onChange;
  final AsyncCallback? onRefresh;
  final AsyncCallback? onScrollToLower;
  final ValueChanged<bool>? onOpenChange;

  @override
  State<StatefulWidget> createState() => AntSelectState();
}

class AntSelectState extends State<AntSelect> {
  final GlobalKey<SelectPanelState> _key = GlobalKey();
  final ValueNotifier<List<dynamic>> _options = ValueNotifier([]);
  late AntFieldsNames _fieldsNames = AntFieldsNames(
    label: NamePath("label"),
    value: NamePath("value"),
  );
  dynamic _value;
  bool _multipleValue = false;
  bool _isOpen = false;


  Widget? get content {
    if (_value == null) {
      return null;
    }
    if (widget.valueOption != null &&
        widget.value ==
            MapUtils.getPathValue(
              widget.valueOption,
              _fieldsNames.value?.value,
            )) {
      return Text(
        MapUtils.getPathValue(widget.valueOption, _fieldsNames.label?.value) ??
            "",
      );
    }

    if (widget.options.isEmpty) {
      return null;
    }
    if (_multipleValue) {
      var labels = widget.options
          .where((item) {
            return (_value as List).contains(
              MapUtils.getPathValue(item, _fieldsNames.value?.value),
            );
          })
          .map(
            (item) => MapUtils.getPathValue(item, _fieldsNames.label?.value),
          );
      return (labels.isNotEmpty) ? Text(labels.join(",")) : null;
    } else {
      var labelItem = widget.options.firstWhereOrNull((item) {
        return MapUtils.getPathValue(item, _fieldsNames.value?.value) == _value;
      });
      return labelItem != null
          ? Text(
            MapUtils.getPathValue(labelItem, _fieldsNames.label?.value) ?? "",
          )
          : null;
    }
  }

  dynamic valueOption(dynamic value) {
    if (_multipleValue) {
      return widget.options
          .where((item) {
            return (value as List).contains(
              MapUtils.getPathValue(item, _fieldsNames.value?.value),
            );
          })
          .map((item) => item);
    } else {
      return widget.options.firstWhereOrNull((item) {
        return MapUtils.getPathValue(item, _fieldsNames.value?.value) == value;
      });
    }
  }

  @override
  void initState() {
    _multipleValue = widget.mode != null;
    _fieldsNames = AntFieldsNames(
      label: widget.fieldsNames?.label ?? NamePath("label"),
      value: widget.fieldsNames?.value ?? NamePath("value"),
    );
    _options.value = widget.options ?? [];
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AntSelect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _value) {
      _value = widget.value;
    }
    if (widget.mode != oldWidget.mode) {
      _multipleValue = widget.mode != null;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.options != oldWidget.options) {
        _options.value = widget.options ?? [];
        _key.currentState?.refreshUI();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AntThemeData theme = AntTheme.of(context);

    return AntCell(
      placeholder: widget.placeholder,
      arrow: widget.arrow,
      label: widget.cellLabel,
      child: content,
      onTap: () {
        _isOpen = true;
        widget.onOpenChange?.call(_isOpen);
        SelectPanel selectPanel = SelectPanel(
          key: _key,
          multiple: _multipleValue,
          showSearch: widget.showSearch,
          placeholder: widget.placeholder,
          fieldsNames: widget.fieldsNames,
          onSearch: widget.onSearch,
          searchPlaceholder: widget.searchPlaceholder,
          options: _options,
          value: _value,
          optionBuilder: widget.optionBuilder,
          onChange: (value) {
            setState(() {
              _value = value;
            });
            widget.onChange?.call(value, valueOption(value));
          },
          onRefresh: widget.onRefresh,
          onScrollToLower: widget.onScrollToLower,
        );

        Future<dynamic> picker;

        if (widget.pickerMode == AntSelectPickerMode.page) {
          picker = Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true, // 关键参数
              builder:
                  (context) => AntScaffold(
                    appBar: widget.appBar ?? AntAppBar(
                      title:
                      widget.title != null
                          ? Text(
                          widget.title??""
                      )
                          : null,
                      onBack: () {
                        Navigator.of(context).maybePop(true).then((_) {});
                      },
                    ),
                    body: selectPanel,
                    bottomNavigationBar: SafeArea(child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: AntButton(
                              size: AntSize.large,
                              type: AntButtonType.text,
                              text:
                              AntdLocalizations.of(
                                context,
                              )?.button_cancel ??
                                  "取消",
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).maybePop(true).then((_) {});
                              },
                            ),
                          ),
                          Expanded(
                            child: AntButton(
                              size: AntSize.large,
                              type: AntButtonType.primary,
                              text:
                              AntdLocalizations.of(context)?.button_ok ??
                                  "确定",
                              onPressed: () {
                                Navigator.of(context).maybePop(true).then((
                                    _,
                                    ) {
                                  widget.onChange?.call(
                                    _value,
                                    valueOption(_value),
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
            ),
          );
        } else {
          picker = showModalBottomSheet(
            context: context,
            enableDrag: false,
            isScrollControlled: true,
            builder: (context) {
              return SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
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
                              text:
                                  AntdLocalizations.of(
                                    context,
                                  )?.button_cancel ??
                                  "取消",
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).maybePop(true).then((_) {});
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
                              text:
                                  AntdLocalizations.of(context)?.button_ok ??
                                  "确定",
                              style: StateStyle(
                                style: Style(color: theme.colorPrimary),
                              ),
                              onPressed: () {
                                Navigator.of(context).maybePop(true).then((_) {
                                  widget.onChange?.call(
                                    _value,
                                    valueOption(_value),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: selectPanel),
                    ],
                  ),
                ),
              );
            },
          );
        }
        picker.then((_) {
          _isOpen = true;
          widget.onOpenChange?.call(_isOpen);
        });
      },
    );
  }
}

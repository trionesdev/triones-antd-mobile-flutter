import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

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
    this.onRefresh,
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
  final AntSelectOptionBuilder? optionBuilder;
  final ValueChanged<dynamic>? onSearch;
  final dynamic value;
  final ValueChanged<dynamic>? onChange;
  final AsyncCallback? onRefresh;

  @override
  State<StatefulWidget> createState() => AntSelectState();
}

class AntSelectState extends State<AntSelect> {
  final GlobalKey<SelectPanelState> _key = GlobalKey();
  final ValueNotifier<List<dynamic>> _options = ValueNotifier([]);
  late AntFieldsNames _fieldsNames = AntFieldsNames(
    label: "label",
    value: "value",
  );
  dynamic _value;

  Widget? get content {
    if (_value == null) {
      return null;
    }
    if (widget.options.isEmpty) {
      return null;
    }
    if (widget.mode != null) {
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
    _options.value = widget.options;
  }

  @override
  void didUpdateWidget(covariant AntSelect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _value) {
      _value = widget.value;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.options != oldWidget.options) {
        _options.value = widget.options;
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
      child: content,
      onTap: () {
        SelectPanel selectPanel = SelectPanel(
          key: _key,
          mode: widget.mode,
          showSearch: widget.showSearch,
          placeholder: widget.placeholder,
          fieldsNames: widget.fieldsNames,
          onSearch: widget.onSearch,
          searchPlaceholder: widget.searchPlaceholder,
          options: _options,
          value: _value,
          onChange: (value) {
            setState(() {
              _value = value;
            });
            widget.onChange?.call(value);
          },
          onRefresh: widget.onRefresh,
        );

        if (widget.modalMode == AntSelectModalMode.page) {
          final result = Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true, // 关键参数
              builder:
                  (context) => SafeArea(
                    child: AntScaffold(
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
                      body: selectPanel,
                      bottomNavigationBar: Container(
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
                                  widget.onChange?.call(_value);
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
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class SelectPanel extends StatefulWidget {
  const SelectPanel({
    super.key,

    this.mode = AntSelectMode.multiple,
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
    this.onSetState,
  });

  final AntSelectMode? mode;
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
  final ValueChanged<StateSetter>? onSetState;

  @override
  State<StatefulWidget> createState() => SelectPanelState();
}

class SelectPanelState extends State<SelectPanel> {
  late AntFieldsNames _fieldsNames = AntFieldsNames(
    label: "label",
    value: "value",
  );
  List<dynamic> _options = [];
  dynamic _value;
  bool _multipleValue = false;

  void refreshUI(){
    print("=================================================refreshUI");
    setState(() {
      print(widget.options);
    });
  }


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
  void didUpdateWidget(covariant SelectPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
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
              dataSource: widget.options.value,
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

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

//region form
class AntForm extends StatefulWidget {
  const AntForm({
    super.key,
    this.spacing,
    this.rowSpacing,
    this.columnSpacing,
    this.layout = AntFormLayout.horizontal,
    // this.children,
    this.child,
    this.labelCol,
    this.wrapperCol,
    this.labelAlign = AntLabelAlign.left,
  });

  final double? spacing;
  final double? rowSpacing;
  final double? columnSpacing;
  final AntFormLayout? layout;
  final AntLabelAlign? labelAlign;
  final AntFormCol? labelCol;
  final AntFormCol? wrapperCol;

  // final List<Widget>? children;
  final Widget? child;

  static AntFormState? maybeOf(BuildContext context) {
    final _AntFormScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntFormScope>();
    return scope?._formState;
  }

  static AntFormState of(BuildContext context) {
    final AntFormState? formState = maybeOf(context);
    return formState!;
  }

  @override
  State<StatefulWidget> createState() => AntFormState();
}

class AntFormState extends State<AntForm> {
  int _generation = 0;
  Map<dynamic, dynamic>? _formValues = {};
  List<Map<String, dynamic>> errorFields = [];
  final Map<String, ValueNotifier> _watches = {};
  final Set<FieldState<dynamic>> _fields = <FieldState<dynamic>>{};

  AntFormLayout? get layout => widget.layout;

  double? get rowSpacing => widget.rowSpacing;

  double? get columnSpacing => widget.columnSpacing;

  AntFormCol? get labelCol => widget.labelCol;

  AntFormCol? get wrapperCol => widget.wrapperCol;

  AntLabelAlign? get labelAlign => widget.labelAlign;

  ValueNotifier _registerWatch(NamePath path) {
    var notifier = ValueNotifier(getFieldValue(path));
    _watches[path.jsonValue] = notifier;
    return notifier;
  }

  void _registerFieldWatch(FieldState<dynamic>? field) {
    if (field?.widget.notifier == null || field?.mergedName == null) {
      return;
    }
    _watches[field!.mergedName!.jsonValue] = field.widget.notifier!;
  }

  void _watchFieldChange(NamePath? path, dynamic value) {
    if (path != null) {
      _watches[path.jsonValue]?.value = value;
    }
  }

  void _fieldDidChange(NamePath? path, dynamic value) {
    _watchFieldChange(path, value);
    MapUtils.setPathValue(_formValues, path!.value, value);
    _forceRebuild();
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  /// 如果子项是后注册的，判断是否需要填充设置的值
  void _formValuesSet(FieldState<dynamic> field) {
    if (field.mergedName == null) {
      return;
    }
    Map<String, dynamic> pathMap = MapUtils.flattenMap(_formValues ?? {});
    if (pathMap.containsKey(field.mergedName?.jsonValue)) {
      _watchFieldChange(field.mergedName, pathMap[field.mergedName?.jsonValue]);
      field._formDidChange(pathMap[field.mergedName?.jsonValue]);
    } else {
      if (field.initialValue != null) {
        MapUtils.setPathValue(
          _formValues,
          field.mergedName!.value,
          field.initialValue,
        );
      }
    }
  }

  void _register(FieldState<dynamic> field) {
    _fields.add(field);
    _registerFieldWatch(field);
    _formValuesSet(field);
  }

  void _unregister(FieldState<dynamic> field) {
    _fields.remove(field);
    _watches.remove(field.mergedName?.jsonValue);
  }

  void save() {
    for (final FieldState<dynamic> field in _fields) {
      field.save();
    }
  }

  void reset() {
    for (final FieldState<dynamic> field in _fields) {
      if (field.mergedName != null) {
        setFieldValue(field.mergedName!, field.initialValue);
      }
    }
    _forceRebuild();
  }

  void setFieldsValue(Map<dynamic, dynamic>? values) {
    _formValues = values ?? {};
    Map<String, dynamic> pathMap = MapUtils.flattenMap(values ?? {});

    for (final FieldState<dynamic> field in _fields) {
      if (field.mergedName != null && field.mergedName!.value.isNotEmpty) {
        if (pathMap.containsKey(field.mergedName!.value.join("."))) {
          var value = pathMap[field.mergedName!.value.join(".")];
          _watchFieldChange(field.mergedName, value);
          field._formDidChange(value);
        }
      }
    }

    _forceRebuild();
  }

  void setFieldValue(NamePath name, dynamic value) {
    _formValues = _formValues ?? {};
    MapUtils.setPathValue(_formValues, name.value, value);

    var field = _fields.firstWhereOrNull((field) {
      return field.mergedName?.jsonValue == name.jsonValue;
    });
    if (field != null) {
      _watchFieldChange(field.mergedName, value);
      field._formDidChange(value);
    }
    _forceRebuild();
  }

  bool _validate() {
    errorFields = [];
    bool hasError = false;
    String errorMessage = '';
    for (final FieldState<dynamic> field in _fields) {
      if (!field.validate()) {
        if (field.mergedName != null) {
          errorFields.add({
            "name": field.mergedName?.value,
            "errors": field.getErrorText(),
          });
        }
        hasError = true;
      }
    }
    return !hasError;
  }

  /// 获取表单的值
  Map<String, dynamic> getFieldsValue() {
    Map<String, dynamic> values = {};
    for (final FieldState<dynamic> field in _fields) {
      dynamic fieldValues = values;
      if (field.mergedName != null && field.mergedName!.value.isNotEmpty) {
        List<dynamic> paths = field.mergedName!.value;
        for (int i = 0; i < paths.length; i++) {
          if (i < paths.length - 1) {
            fieldValues[paths[i]] ??= {};
            fieldValues = fieldValues[paths[i]];
          } else {
            fieldValues[paths[i]] = field.value;
          }
        }
      }
    }

    return values;
  }

  Future<Map<String, dynamic>> validateFields() async {
    if (!_validate()) {
      throw Exception({errorFields});
    }
    return getFieldsValue();
    // return Future.value(values);
  }

  dynamic getFieldValue(NamePath name) {
    FieldState<dynamic>? field = _fields.firstWhereOrNull((element) {
      return element.mergedName == name;
    });
    return field?._value;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: _AntFormScope(
        formState: this,
        generation: _generation,
        child: widget.child ?? Container(),
      ),
    );
  }
}

class _AntFormScope extends InheritedWidget {
  const _AntFormScope({
    required super.child,
    required AntFormState formState,
    required int generation,
  }) : _formState = formState,
       _generation = generation;

  final AntFormState _formState;

  final int _generation;

  AntForm get form => _formState.widget;

  @override
  bool updateShouldNotify(_AntFormScope old) => _generation != old._generation;
}
//endregion

//region field
class Field<T> extends StatefulWidget {
  const Field({
    super.key,
    this.isList,
    this.name,
    required this.child,
    this.onSaved,
    this.validator,
    this.notifier,
    this.value,
    this.initialValue,
    this.restorationId,
  });

  final bool? isList;
  final NamePath? name;
  final Widget child;
  final FormItemSetter<T>? onSaved;
  final FormItemValidator<T>? validator;
  final ValueNotifier<T>? notifier;
  final T? value;
  final T? initialValue;
  final String? restorationId;

  static FieldState<T>? maybeOf<T>(BuildContext context) {
    final _FieldScope<T>? scope =
        context.dependOnInheritedWidgetOfExactType<_FieldScope<T>>();
    return scope?._fieldState;
  }

  @override
  State<StatefulWidget> createState() => FieldState();
}

class FieldState<T> extends State<Field<T>> with RestorationMixin {
  late final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);
  int _generation = 0;

  NamePath? get mergedName {
    FieldState? fieldState = Field.maybeOf(context);
    if (fieldState?.name != null && widget.name != null) {
      return NamePath([...fieldState!.name!.value, ...widget.name!.value]);
    }
    return widget.name;
  }

  T? get initialValue => widget.initialValue;

  T? get value {
    return _value;
  }

  T? _value;

  NamePath? get name {
    return widget.name;
  }

  String? get errorText => _errorText.value;

  bool get hasError => _errorText.value != null;

  bool get hasInteractedByUser => _hasInteractedByUser.value;


  String? getErrorText() {
    return _errorText.value;
  }

  void _formDidChange(T? value) {
    _value = value;
  }

  void save() {
    // widget.onSaved?.call(value);
  }

  bool validate() {
    setState(() {
      _validate();
    });
    return !hasError;
  }

  void _validate() {
    if (widget.validator != null) {
      _errorText.value = widget.validator!(_value);
    } else {
      _errorText.value = null;
    }
  }

  void didChange(T? value) {
    if (value == _value) {
      return;
    }
    AntFormState? formState = AntForm.maybeOf(context);
    _value = value;
    _validate();
    if (formState != null) {
      formState._fieldDidChange(mergedName, value);
      return;
    }
    setState(() {});
  }

  @override
  void deactivate() {
    AntForm.maybeOf(context)?._unregister(this);
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    AntForm.maybeOf(context)?._register(this);
    return PopScope(
      child: _FieldScope(
        fieldState: this,
        generation: _generation,
        child: widget.child,
      ),
    );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_errorText, 'error_text');
  }
}

class _FieldScope<T> extends InheritedWidget {
  const _FieldScope({
    required super.child,
    required FieldState<T> fieldState,
    required int generation,
  }) : _fieldState = fieldState,
       _generation = generation;
  final FieldState<T> _fieldState;
  final int _generation;

  FieldState<T> get fieldState => _fieldState;

  @override
  bool updateShouldNotify(covariant _FieldScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}
//endregion

//region form item
class AntFormItem<T> extends StatelessWidget {
  const AntFormItem({
    super.key,
    this.layout,
    this.name,
    this.label,
    this.labelCol,
    this.wrapperCol,
    this.labelAlign,
    this.child,
    required this.builder,
    this.onSaved,
    this.initialValue,
    this.validator,
    this.restorationId,
    this.required,
    this.style,
    this.notifier,
  });

  final AntFormLayout? layout;
  final NamePath? name;
  final Widget? label;
  final AntFormCol? labelCol;
  final AntFormCol? wrapperCol;
  final AntLabelAlign? labelAlign;
  final Widget? child;
  final FormItemBuilder<T> builder;
  final FormItemSetter<T>? onSaved;
  final T? initialValue;
  final FormItemValidator<T>? validator;
  final String? restorationId;
  final bool? required;
  final StateStyle? style;
  final ValueNotifier<T>? notifier;

  @override
  Widget build(BuildContext context) {
    return Field(
      name: name,
      restorationId: restorationId,
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
      notifier: notifier,

      child: InternalFormItem(
          layout: layout,
          label: label,
          labelCol: labelCol,
          wrapperCol: wrapperCol,
          labelAlign: labelAlign,
          builder: builder,required:  required,style:  style),
    );
  }
}

class InternalFormItem<T> extends StatefulWidget {
  final AntFormLayout? layout;
  final Widget? label;
  final AntFormCol? labelCol;
  final AntFormCol? wrapperCol;
  final AntLabelAlign? labelAlign;
  final Widget? child;
  final FormItemBuilder<T> builder;
  final T? initialValue;
  final String? restorationId;
  final bool? required;
  final StateStyle? style;


  const InternalFormItem({
    super.key,
    this.initialValue,
    this.restorationId,
    this.child,
    this.layout,
    this.label,
    required this.builder,
    this.required,
    this.style,
    this.labelCol,
    this.wrapperCol,
    this.labelAlign,
  });

  @override
  State<StatefulWidget> createState() => InternalFormItemState<T>();
}

class InternalFormItemState<T> extends State<InternalFormItem<T>> {
  AntFormLayout? get layout {
    if (widget.layout != null) {
      return widget.layout;
    } else {
      return AntForm.maybeOf(context)?.layout;
    }
  }

  AntFormCol? get labelCol {
    if (widget.labelCol != null) {
      return widget.labelCol;
    } else {
      return AntForm.maybeOf(context)?.labelCol;
    }
  }

  AntFormCol? get wrapperCol {
    if (widget.wrapperCol != null) {
      return widget.wrapperCol;
    } else {
      return AntForm.maybeOf(context)?.wrapperCol;
    }
  }

  AntLabelAlign? get labelAlign {
    if (widget.labelAlign != null) {
      return widget.labelAlign;
    } else {
      return AntForm.maybeOf(context)?.labelAlign;
    }
  }

  Widget _labelCol(Widget fieldLabel) {
    if (labelCol?.flex != null) {
      return Container(
        width: labelCol!.flex,
        constraints: BoxConstraints(minHeight: 32),
        child: fieldLabel,
      );
    } else if (labelCol?.span != null) {
      return Expanded(
        flex: labelCol!.span!,
        child: Container(
          constraints: BoxConstraints(minHeight: 32),
          child: fieldLabel,
        ),
      );
    } else if (wrapperCol?.flex != null) {
      return Expanded(
        child: Container(
          constraints: BoxConstraints(minHeight: 32),
          child: fieldLabel,
        ),
      );
    } else if (wrapperCol?.span != null) {
      return Expanded(
        flex: 24 - wrapperCol!.span!,
        child: Container(
          constraints: BoxConstraints(minHeight: 32),
          child: fieldLabel,
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints(minHeight: 32),
        child: fieldLabel,
      );
    }
  }

  Widget _wrapperCol(Widget fieldInput) {
    if (wrapperCol?.flex != null) {
      return Container(
        alignment: Alignment.centerLeft,
        constraints: BoxConstraints(minHeight: 32),
        width: wrapperCol!.flex,
        child: fieldInput,
      );
    } else if (wrapperCol?.span != null) {
      return Expanded(
        flex: wrapperCol!.span!,
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: 32),
          child: fieldInput,
        ),
      );
    } else if (labelCol?.flex != null) {
      return Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: 32),
          child: fieldInput,
        ),
      );
    } else if (labelCol?.span != null) {
      return Expanded(
        flex: 24 - labelCol!.span!,
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: 32),
          child: fieldInput,
        ),
      );
    } else {
      return Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: 32),
          child: fieldInput,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    FieldState? fieldState = Field.maybeOf(context);

    StateStyle stateStyle = _AntFormItemStyle();
    stateStyle = stateStyle.merge(widget.style);

    List<Widget> fieldItemChildren = [];
    if (widget.label != null) {
      List<Widget> fieldLabelChildren = [];
      if (widget.required == true) {
        if (layout == AntFormLayout.vertical) {
          fieldLabelChildren.add(
            Container(
              width: 0,
              child: Text("*", style: TextStyle(color: Colors.red)),
            ),
          );
        } else {
          fieldLabelChildren.add(
            Container(
              width: 0,
              transform: Matrix4.translationValues(-8.0, 0.0, 0.0),
              child: Text("*", style: TextStyle(color: Colors.red)),
            ),
          );
        }
      }
      fieldLabelChildren.add(widget.label!);
      Widget fieldLabel = Container(
        // padding: (layout==AntFormLayout.horizontal)?EdgeInsets.only(left: 8):null,
        child: Row(
          mainAxisAlignment:
              labelAlign == AntLabelAlign.left
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
          children: fieldLabelChildren,
        ),
      );

      fieldItemChildren.add(_labelCol(fieldLabel));
    }
    if (widget.builder != null) {
      FieldState<T>? fieldState = Field.maybeOf(context);
      var child = widget.builder(fieldState!);
      List<Widget> filedInputChildren = [child];
      if (fieldState.errorText != null) {
        filedInputChildren.add(
          Container(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0),
            child: Text(
              fieldState.errorText ?? "",
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
          ),
        );
      }

      Widget fieldItem = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: filedInputChildren,
      );
      Widget filedInput =
          layout == AntFormLayout.horizontal
              ? _wrapperCol(fieldItem)
              : fieldItem;
      fieldItemChildren.add(filedInput);
    }

    return Container(
      decoration: stateStyle.resolve(<WidgetState>{})?.decoration,
      padding: stateStyle.resolve(<WidgetState>{})?.computedPadding,
      margin: stateStyle.resolve(<WidgetState>{})?.computedMargin,
      child:
          layout == AntFormLayout.horizontal
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AntForm.maybeOf(context)?.rowSpacing ?? 0,
                children: fieldItemChildren,
              )
              : Column(
                crossAxisAlignment:
                    labelAlign == AntLabelAlign.left
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                spacing: AntForm.maybeOf(context)?.columnSpacing ?? 0,
                children: fieldItemChildren,
              ),
    );
    // return child;
  }
}
//endregion

typedef FormItemBuilder<T> = Widget Function(FieldState<T> field);
typedef FormItemValidator<T> = String? Function(T? value);
typedef FormItemSetter<T> = void Function(T? newValue);

class _AntFormItemStyle extends StateStyle {
  const _AntFormItemStyle();

  @override
  Style get style {
    return Style(
      padding: StylePadding(left: 8, right: 8),
      // margin: StyleMargin(bottom: 8)
    );
  }
}

typedef AntFormListBuilder =
    Widget Function(
      BuildContext context,
      List<AntFormListField> fields,
      AntFormListOperations operations,
    );

class AntFormList extends StatefulWidget {
  const AntFormList({super.key, this.name, this.builder});

  final NamePath? name;
  final AntFormListBuilder? builder;

  @override
  State<StatefulWidget> createState() => AntFormListState();
}

class AntFormListState extends State<AntFormList> {
  NamePath get mergedName {
    FieldState? fieldState = Field.maybeOf(context);
    if (fieldState?.name != null && widget.name != null) {
      return NamePath([...fieldState!.name!.value, ...widget.name!.value]);
    }
    return widget.name ?? NamePath([]);
  }

  List<AntFormListField> get fields {
    AntFormState? formState = AntForm.maybeOf(context);
    var listValue = MapUtils.getPathValue(
      formState!._formValues,
      widget.name!.value,
    );
    print("listValue: $listValue");
    if (listValue == null) {
      return [];
    } else if (listValue is List) {
      return listValue
          .map((e) => AntFormListField(name: NamePath(listValue.indexOf(e))))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    AntFormState? formState = AntForm.maybeOf(context);
    return Field(
      isList: true,
      name: mergedName,
      child:
          widget.builder != null
              ? widget.builder!(
                context,
                fields,
                AntFormListOperations(
                  add: (dynamic defaultValue) {
                    List<dynamic>? listValue = MapUtils.getPathValue(
                      formState!._formValues,
                      widget.name!.value,
                    ) as List<dynamic>?;
                    if (listValue is List) {
                      listValue.add(defaultValue);
                    } else {
                      listValue = [defaultValue];
                    }
                    formState.setFieldValue(widget.name!, listValue);
                  },
                  remove: (int index) {
                    List<dynamic>? listValue = MapUtils.getPathValue(
                      formState!._formValues,
                      widget.name!.value,
                    ) as List<dynamic>?;
                    if (listValue is List) {
                      listValue.removeAt(index);
                    }
                    formState.setFieldValue(widget.name!, listValue);
                  },
                ),
              )
              : Container(),
    );
  }
}

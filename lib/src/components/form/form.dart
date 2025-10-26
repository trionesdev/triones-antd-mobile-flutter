import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

// 以Field作为基础，所有的属性和操作都在FieldState内部进行处理。

//region form
class AntForm extends StatefulWidget {
  const AntForm({
    super.key,
    this.spacing,
    this.rowSpacing,
    this.columnSpacing,
    this.layout = AntFormLayout.horizontal,
    this.child,
    this.labelCol,
    this.wrapperCol,
    this.labelAlign = AntLabelAlign.left,
    this.size = AntSize.middle,
  });

  final double? spacing;
  final double? rowSpacing;
  final double? columnSpacing;
  final AntFormLayout? layout;
  final AntLabelAlign? labelAlign;
  final AntCol? labelCol;
  final AntCol? wrapperCol;
  final AntSize? size;
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
  final Set<AntFieldState> _fields = <AntFieldState>{};

  AntFormLayout? get layout => widget.layout;

  double? get rowSpacing => widget.rowSpacing;

  double? get columnSpacing => widget.columnSpacing;

  AntCol? get labelCol => widget.labelCol;

  AntCol? get wrapperCol => widget.wrapperCol;

  AntLabelAlign? get labelAlign => widget.labelAlign;

  ValueNotifier _registerWatch(NamePath path) {
    var notifier = ValueNotifier(getFieldValue(path));
    _watches[path.jsonValue] = notifier;
    return notifier;
  }

  void _registerFieldWatch(AntFieldState? field) {
    if (field?.widget.notifier == null || field?.mergedName == null) {
      return;
    }
    _watches[field!.mergedName.jsonValue] = field.widget.notifier!;
  }

  void _watchFieldChange(NamePath? path, dynamic value) {
    if (path != null) {
      _watches[path.jsonValue]?.value = value;
    }
  }

  void _fieldDidChange(NamePath path, dynamic value) {
    _watchFieldChange(path, value);
    MapUtils.setPathValue(_formValues, path.value, value);
    _forceRebuild();
  }

  void _forceRebuild() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _generation++;
      });
    });
  }

  /// 如果子项是后注册的，判断是否需要填充设置的值
  void _formValuesSet(AntFieldState field) {
    if (field.mergedName == null || field.mergedName!.value.isEmpty) {
      return;
    }
    var fieldValue = MapUtils.getPathValue(_formValues, field.mergedName.value);
    field._formDidChange(fieldValue);
  }

  void _register<T>(AntFieldState<T?> field) {
    _fields.add(field);
    _registerFieldWatch(field);
    _formValuesSet(field);
  }

  void  _unregister<T>(AntFieldState<T?> field) {
    _fields.remove(field);
    _watches.remove(field.mergedName.jsonValue);
  }


  void save() {
    for (final AntFieldState field in _fields) {
      field.save();
    }
  }

  void reset<T>() {
    for (final AntFieldState field in _fields) {
      if (field.mergedName != null && field.mergedName.value.isNotEmpty) {
        setFieldValue(field.mergedName, field.initialValue);
      }
    }
    _forceRebuild();
  }

  void setFieldsValue(Map<dynamic, dynamic>? values) {
    _formValues = values ?? {};
    _forceRebuild();
  }

  void setFieldValue(NamePath name, dynamic value) {
    _formValues = _formValues ?? {};
    MapUtils.setPathValue(_formValues, name.value, value);

    var field = _fields.firstWhereOrNull((field) {
      return field.mergedName.jsonValue == name.jsonValue;
    });
    if (field != null) {
      _watchFieldChange(field.mergedName, value);
      field._formDidChange(value);
      _forceRebuild();
    }
  }

  bool _validate() {
    errorFields = [];
    bool hasError = false;
    for (final AntFieldState field in _fields) {
      if (!field.validate()) {
        if (field.mergedName != null && field.mergedName.value.isNotEmpty) {
          errorFields.add({
            "name": field.mergedName?.value,
            "errors": field.getErrorText(),
          });
        }
        hasError = true;
      }
    }
    _forceRebuild();
    return !hasError;
  }

  /// 获取表单的值
  Map<String, dynamic?> getFieldsValue() {
    Map<String, dynamic?> values = {};
    for (final AntFieldState field in _fields) {
      dynamic fieldValues = values;
      if (field.mergedName != null && field.mergedName!.value.isNotEmpty) {
        List<dynamic?> paths = field.mergedName!.value;
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
  }

  dynamic getFieldValue(NamePath name) {
    AntFieldState? field = _fields.firstWhereOrNull((element) {
      return element.mergedName == name;
    });
    return field?._value ?? MapUtils.getPathValue(_formValues, name.value);
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

  static  AntFieldState<T>? maybeOf<T>(BuildContext context) {
    final _FieldScope<T>? scope =
        context.dependOnInheritedWidgetOfExactType<_FieldScope<T>>();
    return scope?._fieldState;
  }

  @override
  State<StatefulWidget> createState() => AntFieldState<T>();
}

class AntFieldState<T> extends State<Field<T>> with RestorationMixin {
  _AntFormScope? _formScope;
  _FieldScope? _fieldScope;
  late final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);
  int _generation = 0;

  /// 获取 合并后的 name
  NamePath get mergedName {
    ///这里的 AntFieldState 不能带类型，如果上层是FormList 会找不到
    AntFieldState? fieldState = _fieldScope?.fieldState;
    if (fieldState?.mergedName != null && widget.name != null) {
      return NamePath([...fieldState!.mergedName.value, ...widget.name!.value]);
    } else {
      return widget.name ?? NamePath([]);
    }
  }

  T? get initialValue => widget.initialValue;

  T? get value {
    return _value;
  }

  T? _value;

  /// 获取组件传入name
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
    widget.onSaved?.call(value);
  }

  bool validate() {
    _validate();
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
    if (mergedName == null || mergedName.isEmpty) {
      return;
    }
    if (value == _value) {
      return;
    }
    _value = value;
    AntFormState? formState = _formScope?._formState;
    _validate();
    if (formState != null) {
      formState._fieldDidChange(mergedName, value);
      return;
    }
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    _value = widget.value ?? widget.initialValue;
  }

  @override
  void didChangeDependencies() {
    _formScope = context.dependOnInheritedWidgetOfExactType<_AntFormScope>();
    _fieldScope = context.dependOnInheritedWidgetOfExactType<_FieldScope>();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Field<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      _generation++;
    }
    if (oldWidget.value != widget.value) {
      _value = widget.value ?? widget.initialValue;
    }
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    if (widget.name != null) {
      _formScope?._formState._unregister(this);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name != null) {
      _formScope!._formState._register(this);
    }
    return PopScope(
      child: _FieldScope<T?>(
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

class  _FieldScope<T> extends InheritedWidget {
  const _FieldScope({
    required super.child,
    required AntFieldState<T> fieldState,
    required int generation,
  }) : _fieldState = fieldState,
       _generation = generation;
  final AntFieldState<T> _fieldState;
  final int _generation;

  AntFieldState<T> get fieldState => _fieldState;

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
    this.labelWidget,
    this.labelCol,
    this.wrapperCol,
    this.labelAlign,

    required this.builder,
    this.onSaved,
    this.initialValue,
    this.validator,
    this.restorationId,
    this.required,
    this.style,
    this.notifier,
    this.hidden = false,
    this.noStyle = false,
  });

  final AntFormLayout? layout;
  final NamePath? name;
  final Widget? labelWidget;
  final String? label;
  final AntCol? labelCol;
  final AntCol? wrapperCol;
  final AntLabelAlign? labelAlign;

  final FormItemBuilder<T?> builder;
  final FormItemSetter<T?>? onSaved;
  final T? initialValue;
  final FormItemValidator<T>? validator;
  final String? restorationId;
  final bool? required;
  final StateStyle? style;
  final ValueNotifier<T>? notifier;
  final bool hidden;
  final bool? noStyle;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: hidden,
      child: Field<T?>(
        name: name,
        restorationId: restorationId,
        initialValue: initialValue,
        validator: validator,
        onSaved: onSaved,
        notifier: notifier,

        child: InternalFormItem<T?>(
          layout: layout,
          labelWidget: labelWidget,
          label: label,
          labelCol: labelCol,
          wrapperCol: wrapperCol,
          labelAlign: labelAlign,
          builder: builder,
          required: required,
          noStyle: noStyle,
          style: style,
        ),
      ),
    );
  }
}

class InternalFormItem<T> extends StatefulWidget {
  final AntFormLayout? layout;
  final AntSize? size;
  final Widget? labelWidget;
  final String? label;
  final AntCol? labelCol;
  final AntCol? wrapperCol;
  final AntLabelAlign? labelAlign;
  final Widget? child;
  final FormItemBuilder<T?> builder;
  final T? initialValue;
  final String? restorationId;
  final bool? required;
  final bool? noStyle;
  final StateStyle? style;

  const InternalFormItem({
    super.key,
    this.initialValue,
    this.restorationId,
    this.child,
    this.layout,
    this.label,
    this.labelWidget,
    required this.builder,
    this.labelCol,
    this.wrapperCol,
    this.labelAlign,
    this.size,
    this.required,
    this.noStyle,
    this.style,
  });

  @override
  State<StatefulWidget> createState() => InternalFormItemState<T?>();
}

class InternalFormItemState<T> extends State<InternalFormItem<T?>> {
  double get height {
    AntFormState? formState = AntForm.maybeOf(context);
    AntSize size = widget.size ?? formState?.widget.size ?? AntSize.middle;
    switch (size) {
      case AntSize.large:
        return 48;
      case AntSize.middle:
        return 32;
      case AntSize.small:
        return 24;
    }
  }

  AntFormLayout? get layout {
    if (widget.layout != null) {
      return widget.layout;
    } else {
      return AntForm.maybeOf(context)?.layout;
    }
  }

  AntCol? get labelCol {
    if (widget.labelCol != null) {
      return widget.labelCol;
    } else {
      return AntForm.maybeOf(context)?.labelCol;
    }
  }

  AntCol? get wrapperCol {
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
        constraints: BoxConstraints(minHeight: height),
        child: fieldLabel,
      );
    } else if (labelCol?.span != null) {
      return Expanded(
        flex: labelCol!.span!,
        child: Container(
          constraints: BoxConstraints(minHeight: height),
          child: fieldLabel,
        ),
      );
    } else if (wrapperCol?.flex != null) {
      return Expanded(
        child: Container(
          constraints: BoxConstraints(minHeight: height),
          child: fieldLabel,
        ),
      );
    } else if (wrapperCol?.span != null) {
      return Expanded(
        flex: 24 - wrapperCol!.span!,
        child: Container(
          constraints: BoxConstraints(minHeight: height),
          child: fieldLabel,
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints(minHeight: height),
        child: fieldLabel,
      );
    }
  }

  Widget _wrapperCol(Widget fieldInput) {
    if (wrapperCol?.flex != null) {
      return Container(
        alignment: Alignment.centerLeft,
        constraints: BoxConstraints(minHeight: height),
        width: wrapperCol!.flex,
        child: fieldInput,
      );
    } else if (wrapperCol?.span != null) {
      return Expanded(
        flex: wrapperCol!.span!,
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: height),
          child: fieldInput,
        ),
      );
    } else if (labelCol?.flex != null) {
      return Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: height),
          child: fieldInput,
        ),
      );
    } else if (labelCol?.span != null) {
      return Expanded(
        flex: 24 - labelCol!.span!,
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: height),
          child: fieldInput,
        ),
      );
    } else {
      return Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: height),
          child: fieldInput,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AntFieldState<T?>? fieldState = Field.maybeOf<T?>(context);

    StateStyle stateStyle = _AntFormItemStyle();
    stateStyle = stateStyle.merge(widget.style);

    List<Widget> fieldItemChildren = [];
    if (widget.label != null) {
      List<Widget> fieldLabelChildren = [];
      if (widget.required == true) {
        if (layout == AntFormLayout.vertical) {
          fieldLabelChildren.add(
            SizedBox(
              width: 0,
              child: Text("*", style: TextStyle(color: Colors.red)),
            ),
          );
        } else {
          fieldLabelChildren.add(
            Container(
              padding: EdgeInsets.only(left: 0, right: 0, top: 0),
              // width: 0,
              // transform: Matrix4.translationValues(-8.0, 0.0, 0.0),
              child: Text("*", style: TextStyle(color: Colors.red)),
            ),
          );
        }
      }
      fieldLabelChildren.add(widget.labelWidget ?? Text(widget.label ?? ""));
      Widget fieldLabel = Row(
        mainAxisAlignment:
            labelAlign == AntLabelAlign.left
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
        children: fieldLabelChildren,
      );
      fieldItemChildren.add(_labelCol(fieldLabel));
    }
    if (widget.builder != null) {
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

    if (widget.noStyle == true) {
      if (widget.builder != null) {
        return widget.builder(fieldState!);
      } else {
        return Container();
      }
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

typedef FormItemBuilder<T> = Widget Function(AntFieldState<T> field);
typedef FormItemValidator<T> = String? Function(T? value);
typedef FormItemSetter<T> = void Function(T? newValue);

class _AntFormItemStyle extends StateStyle {
  const _AntFormItemStyle();

  @override
  Style get style {
    return Style(
      // padding: StylePadding(left: 8, right: 8),
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
  _AntFormScope? _formScope;

  NamePath get mergedName {
    AntFieldState? fieldState = Field.maybeOf(context);
    if (fieldState?.mergedName != null && widget.name != null) {
      return NamePath([...fieldState!.mergedName.value, ...widget.name!.value]);
    } else {
      return widget.name ?? NamePath([]);
    }
  }

  List<AntFormListField> get fields {
    AntFormState? formState = AntForm.maybeOf(context);
    var listValue = MapUtils.getPathValue(
      formState!._formValues,
      mergedName.value,
    );
    if (listValue == null) {
      return [];
    } else if (listValue is List) {
      return listValue.map((e) {
        int index = listValue.indexOf(e);
        return AntFormListField(name: NamePath(index), index: index);
      }).toList();
    } else {
      return [];
    }
  }

  @override
  void didChangeDependencies() {
    _formScope = context.dependOnInheritedWidgetOfExactType<_AntFormScope>();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AntFormState? formState = _formScope?._formState;
    return Field(
      isList: true,
      name: widget.name,
      child:
          widget.builder != null
              ? widget.builder!(
                context,
                fields,
                AntFormListOperations(
                  add: (dynamic defaultValue) {
                    List<dynamic>? listValue =
                        MapUtils.getPathValue(
                              formState!._formValues,
                              mergedName.value,
                            )
                            as List<dynamic>?;
                    if (listValue is List) {
                      listValue.add(defaultValue);
                    } else {
                      listValue = [defaultValue];
                    }
                    formState.setFieldValue(mergedName, listValue);
                  },
                  remove: (int index) {
                    List<dynamic>? listValue =
                        MapUtils.getPathValue(
                              formState!._formValues,
                              mergedName.value,
                            )
                            as List<dynamic>?;
                    if (listValue is List) {
                      listValue.removeAt(index);
                    }
                    formState.setFieldValue(mergedName, listValue);
                  },
                ),
              )
              : Container(),
    );
  }
}

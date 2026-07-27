import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../constants.dart';

// 以Field作为基础，所有的属性和操作都在FieldState内部进行处理。

//region form
/// @component AntForm 表单
class AntForm extends StatefulWidget {
  const AntForm({
    super.key,
    this.spacing,
    this.rowSpacing,
    this.columnSpacing,
    this.layout = AntFormLayout.horizontal,
    this.child,
    this.labelCol,
    this.labelTextStyle,
    this.wrapperCol,
    this.labelAlign = AntLabelAlign.left,
    this.size = AntSize.medium,
  });

  /// @description 子项间距
  /// @default null
  final double? spacing;

  /// @description 行间距（水平布局下 label 与控件间距）
  /// @default null
  final double? rowSpacing;

  /// @description 列间距（垂直布局下 label 与控件间距）
  /// @default null
  final double? columnSpacing;

  /// @description 表单布局
  /// @default horizontal
  final AntFormLayout? layout;

  /// @description 表单标签对齐方式
  /// @default left
  final AntLabelAlign? labelAlign;

  /// @description 表单标签宽度
  /// @default null
  final AntCol? labelCol;
  final TextStyle? labelTextStyle;

  /// @description 表单内容宽度
  /// @default null
  final AntCol? wrapperCol;

  /// @description 表单大小
  /// @default middle
  final AntSize? size;

  /// @description 子项
  /// @default null
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

  double? get spacing => widget.spacing;

  double? get rowSpacing => widget.rowSpacing;

  double? get columnSpacing => widget.columnSpacing;

  AntCol? get labelCol => widget.labelCol;

  AntCol? get wrapperCol => widget.wrapperCol;

  AntLabelAlign? get labelAlign => widget.labelAlign;

  TextStyle? get labelTextStyle => widget.labelTextStyle;

  /// 监听指定字段值变化
  ValueNotifier watch(NamePath path) {
    final existing = _watches[path.jsonValue];
    if (existing != null) {
      return existing;
    }
    final notifier = ValueNotifier(getFieldValue(path));
    _watches[path.jsonValue] = notifier;
    return notifier;
  }

  void _registerFieldWatch(AntFieldState? field) {
    if (field?.widget.notifier == null || field!.mergedName.isEmpty) {
      return;
    }
    _watches[field.mergedName.jsonValue] = field.widget.notifier!;
  }

  void _watchFieldChange(NamePath? path, dynamic value) {
    if (path != null && path.isNotEmpty) {
      _watches[path.jsonValue]?.value = value;
    }
  }

  void _fieldDidChange(NamePath path, dynamic value) {
    _watchFieldChange(path, value);
    MapUtils.setPathValue(_formValues, path.value, value);
  }

  void _forceRebuild() {
    void doRebuild() {
      if (!mounted) {
        return;
      }
      setState(() {
        _generation++;
      });
    }

    switch (SchedulerBinding.instance.schedulerPhase) {
      case SchedulerPhase.idle:
      case SchedulerPhase.postFrameCallbacks:
        doRebuild();
        break;
      default:
        WidgetsBinding.instance.addPostFrameCallback((_) => doRebuild());
    }
  }

  /// 如果子项是后注册的，判断是否需要填充设置的值
  void _formValuesSet(AntFieldState field) {
    if (field.mergedName.isEmpty) {
      return;
    }
    var fieldValue = MapUtils.getPathValue(_formValues, field.mergedName.value);
    if (fieldValue != null) {
      field._formDidChange(fieldValue);
    }
  }

  void _register<T>(AntFieldState<T?> field) {
    _fields.add(field);
    _registerFieldWatch(field);
    _formValuesSet(field);
  }

  void _unregister<T>(AntFieldState<T?> field) {
    _fields.remove(field);
  }

  void save() {
    for (final AntFieldState field in _fields) {
      field.save();
    }
  }

  void reset<T>() {
    for (final AntFieldState field in _fields) {
      if (field.mergedName.isNotEmpty) {
        MapUtils.setPathValue(
          _formValues,
          field.mergedName.value,
          field.initialValue,
        );
        _watchFieldChange(field.mergedName, field.initialValue);
        field._formDidChange(field.initialValue);
      }
    }
    _forceRebuild();
  }

  void setFieldsValue(Map<dynamic, dynamic>? values) {
    _formValues = values ?? {};
    for (final AntFieldState field in _fields) {
      if (field.mergedName.isEmpty) {
        continue;
      }
      final fieldValue =
          MapUtils.getPathValue(_formValues, field.mergedName.value);
      field._formDidChange(fieldValue);
      _watchFieldChange(field.mergedName, fieldValue);
    }
    _forceRebuild();
  }

  void setFieldValue(NamePath name, dynamic value) {
    _formValues = _formValues ?? {};
    MapUtils.setPathValue(_formValues, name.value, value);
    _watchFieldChange(name, value);

    final field = _fields.firstWhereOrNull((field) {
      return field.mergedName.jsonValue == name.jsonValue;
    });
    if (field != null) {
      field._formDidChange(value);
      field._notifyChanged();
      if (field.widget.isList == true) {
        _forceRebuild();
      }
    } else {
      _forceRebuild();
    }
  }

  bool _validate({List<NamePath>? nameList}) {
    errorFields = [];
    bool hasError = false;
    for (final AntFieldState field in _fields) {
      if ((nameList == null || nameList.isEmpty) ||
          nameList.contains(field.mergedName)) {
        if (!field.validate()) {
          if (field.mergedName.isNotEmpty) {
            errorFields.add({
              "name": field.mergedName.value,
              "errors": field.getErrorText(),
            });
          }
          hasError = true;
        }
      }
    }
    return !hasError;
  }

  /// 获取表单的值
  Map<String, dynamic?> getFieldsValue() {
    Map<String, dynamic?> values = {};
    for (final AntFieldState field in _fields) {
      dynamic fieldValues = values;
      if (field.mergedName.isNotEmpty) {
        List<dynamic?> paths = field.mergedName.value;
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

  Future<Map<String, dynamic>> validateFields({
    List<NamePath>? nameList,
  }) async {
    if (!_validate(nameList: nameList)) {
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
    return _AntFormScope(
      formState: this,
      generation: _generation,
      child: widget.child ?? const SizedBox.shrink(),
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

  static AntFieldState<T?>? maybeOf<T>(BuildContext context) {
    final _FieldScope<T?>? scope =
        context.dependOnInheritedWidgetOfExactType<_FieldScope<T?>>();
    return scope?._fieldState;
  }

  @override
  State<StatefulWidget> createState() => AntFieldState<T>();
}

class AntFieldState<T> extends State<Field<T?>> with RestorationMixin {
  _AntFormScope? _formScope;
  _FieldScope? _fieldScope;
  late final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);
  int _generation = 0;
  bool _registered = false;

  /// 获取 合并后的 name
  NamePath get mergedName {
    ///这里的 AntFieldState 不能带类型，如果上层是FormList 会找不到
    AntFieldState? fieldState = _fieldScope?.fieldState;
    if (fieldState != null &&
        fieldState.mergedName.isNotEmpty &&
        widget.name != null) {
      return NamePath([...fieldState.mergedName.value, ...widget.name!.value]);
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

  void _notifyChanged() {
    if (!mounted) {
      return;
    }
    setState(() {
      _generation++;
    });
  }

  void save() {
    widget.onSaved?.call(value);
  }

  bool validate() {
    _validate();
    _notifyChanged();
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
    if (mergedName.isEmpty) {
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
    }
    _notifyChanged();
  }

  @override
  void initState() {
    _value = widget.value ?? widget.initialValue;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _formScope = context.dependOnInheritedWidgetOfExactType<_AntFormScope>();
    _fieldScope = context.dependOnInheritedWidgetOfExactType<_FieldScope>();
    if (widget.name != null && _formScope != null && !_registered) {
      _formScope!._formState._register(this);
      _registered = true;
    } else if (widget.name != null && _formScope != null) {
      // 表单 store 更新后同步值（如 setFieldsValue）
      _formScope!._formState._formValuesSet(this);
    }
  }

  @override
  void didUpdateWidget(Field<T?> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      if (_registered && oldWidget.name != null) {
        _formScope?._formState._unregister(this);
        _registered = false;
      }
      if (widget.name != null && _formScope != null) {
        _formScope!._formState._register(this);
        _registered = true;
      }
      _generation++;
    }
    if (oldWidget.value != widget.value) {
      _value = widget.value ?? widget.initialValue;
    }
  }

  @override
  void dispose() {
    if (_registered) {
      _formScope?._formState._unregister(this);
      _registered = false;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _FieldScope<T?>(
      fieldState: this,
      generation: _generation,
      child: widget.child,
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
    required AntFieldState<T?> fieldState,
    required int generation,
  }) : _fieldState = fieldState,
       _generation = generation;
  final AntFieldState<T?> _fieldState;
  final int _generation;

  AntFieldState<T?> get fieldState => _fieldState;

  @override
  bool updateShouldNotify(covariant _FieldScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}
//endregion

//region form item
/// @component AntFormItem 表单项
class AntFormItem<T> extends StatelessWidget {
  const AntFormItem({
    super.key,
    this.layout,
    this.name,
    this.labelText,
    this.label,
    this.labelTextStyle,
    this.labelCol,
    this.wrapperCol,
    this.labelAlign,

    /// @description 组件
    /// @default null
    this.builder,

    /// @description 保存回调
    this.onSaved,

    /// @description 初始值
    this.initialValue,

    /// @description 验证器
    this.validator,

    this.restorationId,

    /// @description 是否必填
    /// @default false
    this.required,

    /// @description 组件样式
    this.style,
    this.notifier,

    /// @description 是否隐藏
    /// @default false
    this.hidden = false,

    /// @description 是否无样式
    /// @default false
    this.noStyle = false,
  });

  final AntFormLayout? layout;
  final NamePath? name;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final AntCol? labelCol;
  final AntCol? wrapperCol;
  final AntLabelAlign? labelAlign;

  final FormItemBuilder<T?>? builder;
  final FormItemSetter<T?>? onSaved;
  final T? initialValue;
  final FormItemValidator<T>? validator;
  final String? restorationId;
  final bool? required;
  final StateStyle? style;
  final ValueNotifier<T>? notifier;
  final bool hidden;
  final bool? noStyle;

  FormItemValidator<T>? _resolveValidator() {
    if (required != true && validator == null) {
      return validator;
    }
    return (T? value) {
      if (required == true) {
        final isEmpty =
            value == null || (value is String && value.isEmpty);
        if (isEmpty) {
          final label = labelText;
          return (label != null && label.isNotEmpty) ? '请输入$label' : '请输入';
        }
      }
      return validator?.call(value);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: hidden,
      child: Field<T?>(
        name: name,
        restorationId: restorationId,
        initialValue: initialValue,
        validator: _resolveValidator(),
        onSaved: onSaved,
        notifier: notifier,
        child: InternalFormItem<T?>(
          layout: layout,
          label: label,
          labelText: labelText,
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
  final Widget? label;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final AntCol? labelCol;
  final AntCol? wrapperCol;
  final AntLabelAlign? labelAlign;
  final Widget? child;
  final FormItemBuilder<T?>? builder;
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
    this.labelText,
    this.labelTextStyle,
    this.label,
    this.builder,
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
    AntSize size = widget.size ?? formState?.widget.size ?? AntSize.medium;
    switch (size) {
      case AntSize.large:
        return sizeLg;
      case AntSize.medium:
        return sizeMd;
      case AntSize.small:
        return sizeSm;
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

  Widget get label {
    AntFormState? formState = AntForm.maybeOf(context);
    List<Widget> fieldLabelChildren = [];
    if (widget.required == true) {
      if (layout == AntFormLayout.vertical) {
        fieldLabelChildren.add(
          const SizedBox(
            width: 0,
            child: Text("*", style: TextStyle(color: Colors.red)),
          ),
        );
      } else {
        fieldLabelChildren.add(
          const Text("*", style: TextStyle(color: Colors.red)),
        );
      }
    }
    fieldLabelChildren.add(
      widget.label ??
          Text(
            widget.labelText ?? "",
            style: widget.labelTextStyle ?? formState?.labelTextStyle,
          ),
    );
    Widget fieldLabel = Row(
      mainAxisAlignment:
          labelAlign == AntLabelAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
      children: fieldLabelChildren,
    );

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
    final formSpacing = AntForm.maybeOf(context)?.spacing;

    StateStyle stateStyle = _AntFormItemStyle(
      spacing: widget.style?.style?.margin == null ? formSpacing : null,
    );
    stateStyle = stateStyle.merge(widget.style);

    List<Widget> fieldItemChildren = [];
    if (widget.label != null || widget.labelText != null) {
      fieldItemChildren.add(label);
    }
    if (widget.builder != null) {
      var child = widget.builder!(fieldState!);
      List<Widget> filedInputChildren = [child];
      if (fieldState.errorText != null) {
        filedInputChildren.add(
          Text(
            fieldState.errorText ?? "",
            style: const TextStyle(fontSize: 12, color: Colors.red),
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
        return widget.builder!(fieldState!);
      } else {
        return const SizedBox.shrink();
      }
    }

    final resolvedStyle = stateStyle.resolve(<WidgetState>{});
    return Container(
      decoration: resolvedStyle?.decoration,
      padding: resolvedStyle?.computedPadding,
      margin: resolvedStyle?.computedMargin,
      child:
          layout == AntFormLayout.horizontal
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
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
  }
}
//endregion

typedef FormItemBuilder<T> = Widget Function(AntFieldState<T> field);
typedef FormItemValidator<T> = String? Function(T? value);
typedef FormItemSetter<T> = void Function(T? newValue);

class _AntFormItemStyle extends StateStyle {
  const _AntFormItemStyle({this.spacing});

  final double? spacing;

  @override
  Style get style {
    return Style(
      margin: spacing != null ? StyleMargin(bottom: spacing) : null,
    );
  }
}

typedef AntFormListBuilder =
    Widget Function(
      BuildContext context,
      List<AntFormListField> fields,
      AntFormListOperations operations,
    );

/// @component AntFormList 表单列表
class AntFormList extends StatefulWidget {
  const AntFormList({super.key, this.name, this.builder});

  /// @description 组件名称
  /// @default null
  final NamePath? name;

  /// @description 表单列表子组件
  /// @default null
  final AntFormListBuilder? builder;

  @override
  State<StatefulWidget> createState() => AntFormListState();
}

class AntFormListState extends State<AntFormList> {
  _AntFormScope? _formScope;

  NamePath get mergedName {
    AntFieldState? fieldState = Field.maybeOf(context);
    if (fieldState != null &&
        fieldState.mergedName.isNotEmpty &&
        widget.name != null) {
      return NamePath([...fieldState.mergedName.value, ...widget.name!.value]);
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
    if (listValue is List) {
      return listValue.asMap().entries.map((entry) {
        return AntFormListField(
          name: NamePath(entry.key),
          index: entry.key,
        );
      }).toList();
    }
    return [];
  }

  @override
  void didChangeDependencies() {
    _formScope = context.dependOnInheritedWidgetOfExactType<_AntFormScope>();
    super.didChangeDependencies();
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
                    final existing =
                        MapUtils.getPathValue(
                              formState!._formValues,
                              mergedName.value,
                            )
                            as List<dynamic>?;
                    final List<dynamic> listValue =
                        existing != null
                            ? List<dynamic>.from(existing)
                            : <dynamic>[];
                    listValue.add(defaultValue);
                    formState.setFieldValue(mergedName, listValue);
                  },
                  remove: (int index) {
                    final existing =
                        MapUtils.getPathValue(
                              formState!._formValues,
                              mergedName.value,
                            )
                            as List<dynamic>?;
                    if (existing is! List) {
                      return;
                    }
                    final List<dynamic> listValue = List<dynamic>.from(
                      existing,
                    );
                    if (index < 0 || index >= listValue.length) {
                      return;
                    }
                    listValue.removeAt(index);
                    formState.setFieldValue(mergedName, listValue);
                  },
                ),
              )
              : const SizedBox.shrink(),
    );
  }
}

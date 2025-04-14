import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

enum AntFormLayout { horizontal, vertical }

enum AntLabelAlign { left, right }

class AntFormCol {
  const AntFormCol({this.flex, this.span});

  final double? flex;
  final int? span;
}

class AntForm extends StatefulWidget {
  const AntForm({
    super.key,
    this.spacing,
    this.rowSpacing,
    this.columnSpacing,
    this.layout = AntFormLayout.horizontal,
    this.children,
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

  final List<Widget>? children;
  final Widget? child;

  static void watch(
      BuildContext context, NamePath name, Function(dynamic val) callback) {
    AntFormState? formState = AntForm.maybeOf(context);
    formState?._registerWatch(name, callback);
  }

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
  bool _hasInteractedByUser = false;
  List<Map<String, dynamic>> errorFields = [];
  final Map<NamePath, Function(dynamic val)> _watches = {};
  final Set<AntFormItemState<dynamic>> _fields = <AntFormItemState<dynamic>>{};

  AntFormLayout? get layout => widget.layout;

  double? get rowSpacing => widget.rowSpacing;

  double? get columnSpacing => widget.columnSpacing;

  AntFormCol? get labelCol => widget.labelCol;

  AntFormCol? get wrapperCol => widget.wrapperCol;

  AntLabelAlign? get labelAlign => widget.labelAlign;

  void _registerWatch(NamePath path, Function(dynamic val) callback) {
    _watches[NamePath(path)] = callback;
  }

  void _watchFieldChange(NamePath? path, dynamic value) {
    if (path != null) {
      _watches[path]?.call(value);
    }
  }

  void _fieldDidChange(NamePath? path, dynamic value) {
    _watchFieldChange(path, value);
    _forceRebuild();
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  /// 如果子项是后注册的，判断是否需要填充设置的值
  void _formValuesSet(AntFormItemState<dynamic> field) {
    if (field.name == null) {
      return;
    }
    Map<String, dynamic> pathMap = MapUtils.flattenMap(_formValues ?? {});
    if (pathMap.containsKey(field.name?.jsonValue)) {
      field._formDidChange(pathMap[field.name?.jsonValue]);
    } else {
      MapUtils.setPathValue(_formValues, field.name!.value, field.value);
    }
  }

  void _register(AntFormItemState<dynamic> field) {
    _fields.add(field);
    _formValuesSet(field);
  }

  void _unregister(AntFormItemState<dynamic> field) {
    _fields.remove(field);
  }

  void save() {
    for (final AntFormItemState<dynamic> field in _fields) {
      field.save();
    }
  }

  void reset() {
    for (final AntFormItemState<dynamic> field in _fields) {
      field.reset();
      _watchFieldChange(field.name, field.initialValue);
    }
    _hasInteractedByUser = false;
  }

  void setFieldsValue(Map<dynamic, dynamic>? values) {
    _formValues = values ?? {};
    Map<String, dynamic> pathMap = MapUtils.flattenMap(values ?? {});

    for (final AntFormItemState<dynamic> field in _fields) {
      if (field.name != null && field.name!.value.isNotEmpty) {
        if (pathMap.containsKey(field.name!.value.join("."))) {
          var value = pathMap[field.name!.value.join(".")];
          field._formDidChange(value);
        }
      }
    }
    _forceRebuild();
  }

  bool _validate() {
    errorFields = [];
    bool hasError = false;
    String errorMessage = '';
    for (final AntFormItemState<dynamic> field in _fields) {
      if (!field.validate()) {
        if (field.name != null) {
          errorFields
              .add({"name": field.name?.value, "errors": field.getErrorText()});
        }
        hasError = true;
      }
    }
    return !hasError;
  }

  Future<Map<dynamic, dynamic>> validateFields() async {
    if (!_validate()) {
      throw Exception({errorFields});
    }
    Map<dynamic, dynamic> values = {};
    for (final AntFormItemState<dynamic> field in _fields) {
      Map<dynamic, dynamic> fieldValues = values;
      if (field.name != null && field.name!.value.isNotEmpty) {
        List<dynamic> paths = field.name!.value;
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
    // return Future.value(values);
  }

  dynamic getFieldValue(NamePath name) {
    AntFormItemState<dynamic>? field = _fields.firstWhereOrNull((element) {
      return element.name == name;
    });
    if (field != null) {
      return field._value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: _AntFormScope(
            formState: this,
            generation: _generation,
            child: widget.child ?? Container()));
  }
}

class _AntFormScope extends InheritedWidget {
  const _AntFormScope({
    required super.child,
    required AntFormState formState,
    required int generation,
  })  : _formState = formState,
        _generation = generation;

  final AntFormState _formState;

  /// Incremented every time a form field has changed. This lets us know when
  /// to rebuild the form.
  final int _generation;

  /// The [Form] associated with this widget.
  AntForm get form => _formState.widget;

  @override
  bool updateShouldNotify(_AntFormScope old) => _generation != old._generation;
}

class NamePath {
  List<dynamic> _namePaths = [];

  NamePath(dynamic namePath) {
    if (namePath is List) {
      _namePaths = namePath;
    } else {
      _namePaths = [namePath];
    }
  }

  List<dynamic> get value => _namePaths;

  String get jsonValue => _namePaths.map((item) {
        return item.toString();
      }).join(".");
}

typedef FormItemBuilder<T> = Widget Function(AntFormItemState<T> field);
typedef FormItemValidator<T> = String? Function(T? value);
typedef FormItemSetter<T> = void Function(T? newValue);

class AntFormItem<T> extends StatefulWidget {
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

  const AntFormItem(
      {super.key,
      this.initialValue,
      this.validator,
      this.restorationId,
      this.child,
      this.layout,
      this.name,
      this.label,
      required this.builder,
      this.onSaved,
      this.required,
      this.style,
      this.labelCol,
      this.wrapperCol,
      this.labelAlign});

  @override
  State<StatefulWidget> createState() => AntFormItemState<T>();
}

class AntFormItemState<T> extends State<AntFormItem<T>> with RestorationMixin {
  T? _value;
  late final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  dynamic get value => _value;

  NamePath? get name => widget.name;

  T? get initialValue => widget.initialValue;

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

  String? get errorText => _errorText.value;

  bool get hasError => _errorText.value != null;

  bool get hasInteractedByUser => _hasInteractedByUser.value;

  String? getErrorText() {
    return errorText;
  }

  void save() {
    widget.onSaved?.call(value);
  }

  // void setFormSettings({}){}

  void reset() {
    setState(() {
      _value = widget.initialValue;
      _hasInteractedByUser.value = false;
      _errorText.value = null;
    });
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
    print("form item changed:" + value.toString());
    AntFormState? formState = AntForm.maybeOf(context);
    _value = value;
    _validate();
    if (formState != null) {
      formState._fieldDidChange(widget.name, value);
      return;
    }
    setState(() {});
  }

  /// form 触发的边跟
  void _formDidChange(T? value) {
    print("form item changed:" + value.toString());
    _value = value;
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

  Widget _labelCol(Widget fieldLabel) {
    if (labelCol?.flex != null) {
      return SizedBox(
        width: labelCol!.flex,
        child: fieldLabel,
      );
    } else if (labelCol?.span != null) {
      return Expanded(flex: labelCol!.span!, child: fieldLabel);
    } else if (wrapperCol?.flex != null) {
      return Expanded(
        child: fieldLabel,
      );
    } else if (wrapperCol?.span != null) {
      return Expanded(flex: 24 - wrapperCol!.span!, child: fieldLabel);
    } else {
      return fieldLabel;
    }
  }

  Widget _wrapperCol(Widget fieldInput) {
    if (wrapperCol?.flex != null) {
      return SizedBox(
        width: wrapperCol!.flex,
        child: fieldInput,
      );
    } else if (wrapperCol?.span != null) {
      return Expanded(flex: wrapperCol!.span!, child: fieldInput);
    } else if (labelCol?.flex != null) {
      return Expanded(child: fieldInput);
    } else if (labelCol?.span != null) {
      return Expanded(flex: 24 - labelCol!.span!, child: fieldInput);
    } else {
      return Expanded(child: fieldInput);
    }
  }

  @override
  Widget build(BuildContext context) {
    AntForm.maybeOf(context)?._register(this);

    StateStyle stateStyle = _AntFormItemStyle();
    stateStyle = stateStyle.merge(widget.style);

    List<Widget> fieldItemChildren = [];
    if (widget.label != null) {
      List<Widget> fieldLabelChildren = [];
      if (widget.required == true) {
        fieldLabelChildren.add(Container(
          width: 0,
          transform: Matrix4.translationValues(-8.0, 0.0, 0.0),
          child: Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
        ));
      }
      fieldLabelChildren.add(widget.label!);
      Widget fieldLabel = Container(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: labelAlign == AntLabelAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: fieldLabelChildren,
        ),
      );
      fieldItemChildren.add(_labelCol(fieldLabel));
    }
    if (widget.builder != null) {
      var child = widget.builder(this);
      List<Widget> filedInputChildren = [child];
      if (errorText != null) {
        filedInputChildren.add(Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 0),
          child: Text(
            errorText!,
            style: TextStyle(fontSize: 12, color: Colors.red),
          ),
        ));
      }

      Widget fieldItem = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: filedInputChildren,
      );
      Widget filedInput = layout == AntFormLayout.horizontal
          ? _wrapperCol(fieldItem)
          : fieldItem;
      fieldItemChildren.add(filedInput);
    }

    return Container(
      decoration: stateStyle.resolve(<WidgetState>{})?.decoration,
      padding: stateStyle.resolve(<WidgetState>{})?.computedPadding,
      margin: stateStyle.resolve(<WidgetState>{})?.computedMargin,
      child: layout == AntFormLayout.horizontal
          ? Row(
              spacing: AntForm.maybeOf(context)?.rowSpacing ?? 0,
              children: fieldItemChildren,
            )
          : Column(
              crossAxisAlignment: labelAlign == AntLabelAlign.left
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              spacing: AntForm.maybeOf(context)?.columnSpacing ?? 0,
              children: fieldItemChildren,
            ),
    );
    // return child;
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_errorText, 'error_text');
    // registerForRestoration(_hasInteractedByUser, 'has_interacted_by_user');
  }
}

class _AntFormItemStyle extends StateStyle {
  const _AntFormItemStyle();

  @override
  Style get style {
    return Style(
        // padding: StylePadding(left: 8, right: 8),
        margin: StyleMargin(bottom: 8));
  }
}

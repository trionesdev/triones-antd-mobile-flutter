import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

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
  bool _hasInteractedByUser = false;
  List<Map<String, dynamic>> errorFields = [];
  final Map<String, ValueNotifier> _watches = {};
  final Set<AntFormItemState<dynamic>> _fields = <AntFormItemState<dynamic>>{};

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

  void _registerFieldWatch(AntFormItemState<dynamic>? field) {
    if(field?.widget.notifier == null || field?.name == null){
      return;
    }
    _watches[field!.name!.jsonValue] = field.widget.notifier!;
  }

  void _watchFieldChange(NamePath? path, dynamic value) {
    if (path != null) {
      _watches[path.jsonValue]?.value = value;
    }
  }

  void _fieldDidChange(NamePath? path, dynamic value) {
    _watchFieldChange(path, value);
    MapUtils.setPathValue(_formValues, path?.value, value);
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
      _watchFieldChange(field.name,pathMap[field.name?.jsonValue]);
      field._formDidChange(pathMap[field.name?.jsonValue]);
    } else {
      if (field.initialValue != null) {
        MapUtils.setPathValue(
            _formValues, field.name!.value, field.initialValue);
      }
    }
  }

  void _register(AntFormItemState<dynamic> field) {
    _fields.add(field);
    _registerFieldWatch(field);
    _formValuesSet(field);
  }

  void _unregister(AntFormItemState<dynamic> field) {
    _fields.remove(field);
    _watches.remove(field.name?.jsonValue);
  }

  void save() {
    for (final AntFormItemState<dynamic> field in _fields) {
      field.save();
    }
  }

  void reset() {
    for (final AntFormItemState<dynamic> field in _fields) {
      if(field.name!=null){
        setFieldValue(field.name!, field.initialValue);
      }
    }
    _hasInteractedByUser = false;
    _forceRebuild();
  }

  void setFieldsValue(Map<dynamic, dynamic>? values) {
    _formValues = values ?? {};
    Map<String, dynamic> pathMap = MapUtils.flattenMap(values ?? {});

    for (final AntFormItemState<dynamic> field in _fields) {
      if (field.name != null && field.name!.value.isNotEmpty) {
        if (pathMap.containsKey(field.name!.value.join("."))) {
          var value = pathMap[field.name!.value.join(".")];
          _watchFieldChange(field.name, value);
          field._formDidChange(value);
        }
      }
    }
    _forceRebuild();
  }

  void setFieldValue(NamePath name, dynamic value) {

    _formValues = _formValues ?? {};
    MapUtils.setPathValue(_formValues, name.value, value);

    var field = _fields.firstWhereOrNull((field){
      return field.name?.jsonValue == name.jsonValue;
    });
    if(field != null){
      _watchFieldChange(field.name, value);
      field._formDidChange(value);
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

  Map<String, dynamic> getFieldsValue() {
    Map<String, dynamic> values = {};
    for (final AntFormItemState<dynamic> field in _fields) {
      Map<String, dynamic> fieldValues = values;
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
  }

  Future<Map<String, dynamic>> validateFields() async {
    if (!_validate()) {
      throw Exception({errorFields});
    }
    return getFieldsValue();
    // return Future.value(values);
  }

  dynamic getFieldValue(NamePath name) {
    AntFormItemState<dynamic>? field = _fields.firstWhereOrNull((element) {
      return element.name == name;
    });
    return field?._value;
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

  NamePath append(dynamic name) {
    _namePaths.add(name);
    return this;
  }

  @override
  bool operator ==(Object other) {
    if (other is! NamePath) {
      return false;
    }
    return jsonValue == other.jsonValue;
  }

  String get jsonValue => _namePaths.map((item) {
        return item.toString();
      }).join(".");
}

typedef FormItemBuilder<T> = Widget Function(AntFormItemState<T> field);
typedef FormItemValidator<T> = String? Function(T? value);
typedef FormItemSetter<T> = void Function(T? newValue);

enum AntFormLabelVerticalAlign { start, center, end }

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
  final ValueNotifier<T>? notifier;

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
      this.labelAlign,
      this.notifier
      });

  @override
  State<StatefulWidget> createState() => AntFormItemState<T>();
}

class AntFormItemState<T> extends State<AntFormItem<T>> with RestorationMixin {
  late T? _value;
  late final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  T? get value => _value;

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

  void reset() {
    _value = widget.initialValue;
    _hasInteractedByUser.value = false;
    _errorText.value = null;
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
      formState._fieldDidChange(widget.name, value);
      return;
    }
    setState(() {});
  }

  /// form 触发的边跟
  void _formDidChange(T? value) {
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
          ));
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
          ));
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
          ));
    } else if (labelCol?.flex != null) {
      return Expanded(
          child: Container(
        alignment: Alignment.centerLeft,
        constraints: BoxConstraints(minHeight: 32),
        child: fieldInput,
      ));
    } else if (labelCol?.span != null) {
      return Expanded(
          flex: 24 - labelCol!.span!,
          child: Container(
            alignment: Alignment.centerLeft,
            constraints: BoxConstraints(minHeight: 32),
            child: fieldInput,
          ));
    } else {
      return Expanded(
          child: Container(
        alignment: Alignment.centerLeft,
        constraints: BoxConstraints(minHeight: 32),
        child: fieldInput,
      ));
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
        if(layout==AntFormLayout.vertical){
          fieldLabelChildren.add(Container(
            width: 0,
            child: Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ));
        }else{
          fieldLabelChildren.add(Container(
            width: 0,
            transform: Matrix4.translationValues(-8.0, 0.0, 0.0),
            child: Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ));
        }
      }
      fieldLabelChildren.add(widget.label!);
      Widget fieldLabel = Container(
        // padding: (layout==AntFormLayout.horizontal)?EdgeInsets.only(left: 8):null,
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
          padding: EdgeInsets.only(left: 0, right: 0, top: 0),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
        padding: StylePadding(left: 8, right: 8),
        // margin: StyleMargin(bottom: 8)
        );
  }
}

class AntFormField{
  NamePath name;
  AntFormField({required this.name});
}

class AntFormList extends StatelessWidget {
  NamePath? name;
  Widget Function(BuildContext context, List<AntFormField> fields) builder;
  AntFormList({super.key, this.name, required this.builder});


  @override
  Widget build(BuildContext context) {

    void add(){
      final form = AntForm.maybeOf(context);
      var values = form?.getFieldValue(name!)??[];
      form!.setFieldValue(name!, [ ...values,{}]);
    }

    // ListView.builder(itemBuilder: itemBuilder);
    final form = AntForm.maybeOf(context);
    if(form != null && name!=null){
      List<dynamic> values = (form.getFieldValue(name!)??[]) as List;
      // List<AntFormField> fields1 = values.map(( item, index){
      //   return AntFormField(name: name!.append( index));
      // }).toList();
      print(form.getFieldValue(name!));
      if(form.getFieldValue(name!) is List){
        print("sssssssssssssssssssssssss");
      }
      List<AntFormField> fields = [AntFormField(name: name!.append(0))];
      return builder(context, fields);
    }


    return Container();
  }

}
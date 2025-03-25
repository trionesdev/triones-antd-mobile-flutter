import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd_mobile/antd.dart';

enum FormLayout { horizontal, vertical }

enum LabelAlign { left, right }

class Col {
  const Col({this.flex, this.span});

  final double? flex;
  final int? span;
}

class AntForm extends StatefulWidget {
  const AntForm({
    super.key,
    this.spacing,
    this.rowSpacing,
    this.columnSpacing,
    this.layout = FormLayout.horizontal,
    required this.children,
    this.labelCol,
    this.wrapperCol,
    this.labelAlign = LabelAlign.left,
  });

  final double? spacing;
  final double? rowSpacing;
  final double? columnSpacing;
  final FormLayout? layout;
  final LabelAlign? labelAlign;
  final Col? labelCol;
  final Col? wrapperCol;

  final List<Widget> children;

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
  bool _hasInteractedByUser = false;
  List<Map<String, dynamic>> errorFields = [];
  final Set<AntFormItemState<dynamic>> _fields = <AntFormItemState<dynamic>>{};

  FormLayout? get layout => widget.layout;

  double? get rowSpacing => widget.rowSpacing;

  double? get columnSpacing => widget.columnSpacing;

  Col? get labelCol => widget.labelCol;

  Col? get wrapperCol => widget.wrapperCol;

  LabelAlign? get labelAlign => widget.labelAlign;

  void _fieldDidChange() {
    _forceRebuild();
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  void _register(AntFormItemState<dynamic> field) {
    _fields.add(field);
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
    }
    _hasInteractedByUser = false;
    _fieldDidChange();
  }

  void setFieldsValue(Map<dynamic, dynamic>? values) {
    print(values);

    dynamic getValue(NamePath name, Map<dynamic, dynamic>? currentValues) {
      Map<dynamic, dynamic>? currentValues2 = currentValues;
      for (int i = 0; i < name.value.length; i++) {
        if (i < name.value.length - 1) {
          if (currentValues2![name.value[i]] == null) {
            return null;
          } else {
            currentValues2 = currentValues2[name.value[i]];
          }
        } else {
          return currentValues2![name.value[i]];
        }
      }
    }

    for (final AntFormItemState<dynamic> field in _fields) {
      var v = getValue(field.name!, values);
      field.didChange(v);
    }
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
      print(field.value);
      Map<dynamic, dynamic> fieldValues = values;
      if (field.name != null && field.name!.value.isNotEmpty) {
        List<dynamic> paths = field.name!.value;
        for (int i = 0; i < paths.length; i++) {
          if (i < paths.length - 1) {
            fieldValues[paths[i]] = {};
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

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: widget.children,
    // );

    return PopScope(
        child: _AntFormScope(
            formState: this,
            generation: _generation,
            child: Column(
              spacing: widget.spacing ?? 0,
              children: widget.children,
            )));
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
}

typedef FormItemBuilder<T> = Widget Function(AntFormItemState<T> field);
typedef FormItemValidator<T> = String? Function(T? value);
typedef FormItemSetter<T> = void Function(T? newValue);

class AntFormItem<T> extends StatefulWidget {
  final FormLayout? layout;
  final NamePath? name;
  final Widget? label;
  final Col? labelCol;
  final Col? wrapperCol;
  final LabelAlign? labelAlign;
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
  late dynamic _value = widget.initialValue;
  late final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  dynamic get value => _value;

  NamePath? get name => widget.name;

  FormLayout? get layout {
    if (widget.layout != null) {
      return widget.layout;
    } else {
      return AntForm.maybeOf(context)?.layout;
    }
  }

  Col? get labelCol {
    if (widget.labelCol != null) {
      return widget.labelCol;
    } else {
      return AntForm.maybeOf(context)?.labelCol;
    }
  }

  Col? get wrapperCol {
    if (widget.wrapperCol != null) {
      return widget.wrapperCol;
    } else {
      return AntForm.maybeOf(context)?.wrapperCol;
    }
  }

  LabelAlign? get labelAlign {
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

  void didChange(dynamic value) {
    setState(() {
      _value = value;
      // _hasInteractedByUser.value = true;
    });
    AntForm.maybeOf(context)?._fieldDidChange();
    _validate();
    print("form item changed:" + value.toString());
  }

  @override
  void deactivate() {
    AntForm.maybeOf(context)?._unregister(this);
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();
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
          padding: EdgeInsets.only(right: 4),
          child: Text(
            "*",
            style: TextStyle(color: material.Colors.red),
          ),
        ));
      }
      fieldLabelChildren.add(widget.label!);
      Row fieldLabel = Row(
        mainAxisAlignment: labelAlign == LabelAlign.left
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: fieldLabelChildren,
      );
      fieldItemChildren.add(_labelCol(fieldLabel));
    }
    if (widget.builder != null) {
      var child = widget.builder(this);
      List<Widget> filedInputChildren = [child];
      if (errorText != null) {
        filedInputChildren.add(Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 0),
          child: Text(
            errorText!,
            style: TextStyle(color: material.Colors.red),
          ),
        ));
      }
// print(errorText);
      Widget fieldItem = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: filedInputChildren,
      );
      Widget filedInput =
          layout == FormLayout.horizontal ? _wrapperCol(fieldItem) : fieldItem;
      fieldItemChildren.add(filedInput);
    }

    return Container(
      decoration: stateStyle.resolve(<WidgetState>{})?.decoration,
      padding: stateStyle.resolve(<WidgetState>{})?.computedPadding,
      margin: stateStyle.resolve(<WidgetState>{})?.computedMargin,
      child: layout == FormLayout.horizontal
          ? Row(
              spacing: AntForm.maybeOf(context)?.rowSpacing ?? 8,
              children: fieldItemChildren,
            )
          : Column(
              crossAxisAlignment: labelAlign == LabelAlign.left
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              spacing: AntForm.maybeOf(context)?.columnSpacing ?? 8,
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
    return Style(margin: StyleMargin(bottom: 8));
  }
}

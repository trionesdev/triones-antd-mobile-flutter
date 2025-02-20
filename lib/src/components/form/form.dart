import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

enum FormLayout { horizontal, vertical }

class AntForm extends StatefulWidget {
  const AntForm(
      {super.key, this.layout = FormLayout.horizontal, required this.children});

  final FormLayout? layout;

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
  final Widget? child;
  final FormItemBuilder<T> builder;
  final FormItemSetter<T>? onSaved;
  final T? initialValue;
  final FormItemValidator<T>? validator;
  final String? restorationId;
  final bool? required;

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
      this.required});

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

  @override
  Widget build(BuildContext context) {
    AntForm.maybeOf(context)?._register(this);

    List<Widget> fieldItemChildren = [];
    if (widget.label != null) {
      List<Widget> fieldLabelChildren = [];
      if (widget.required == true) {
        fieldLabelChildren.add(Text(
          widget.required == true ? "*" : "",
          style: TextStyle(color: material.Colors.red),
        ));
      }
      fieldLabelChildren.add(widget.label!);
      Row fieldLabel = Row(
        children: fieldLabelChildren,
      );
      fieldItemChildren.add(fieldLabel);
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
      Widget filedInput = layout == FormLayout.horizontal
          ? Expanded(child: fieldItem)
          : fieldItem;
      fieldItemChildren.add(filedInput);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: layout == FormLayout.horizontal
          ? Row(
        children: fieldItemChildren,
      )
          : Column(
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

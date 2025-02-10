import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:trionesdev_antd/antd.dart';

class Form extends StatefulWidget {
  const Form({super.key, required this.children});

  final List<Widget> children;

  static FormState? maybeOf(BuildContext context) {
    final _FormScope? scope =
        context.dependOnInheritedWidgetOfExactType<_FormScope>();
    return scope?._formState;
  }

  static FormState of(BuildContext context) {
    final FormState? formState = maybeOf(context);
    return formState!;
  }

  @override
  State<StatefulWidget> createState() => FormState();
}

class FormState extends State<Form> {
  int _generation = 0;
  bool _hasInteractedByUser = false;
  List<Map<String, dynamic>> errorFields = [];
  final Set<FormItemState<dynamic>> _fields = <FormItemState<dynamic>>{};

  void _fieldDidChange() {
    _forceRebuild();
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  void _register(FormItemState<dynamic> field) {
    _fields.add(field);
  }

  void _unregister(FormItemState<dynamic> field) {
    _fields.remove(field);
  }

  void save() {
    for (final FormItemState<dynamic> field in _fields) {
      field.save();
    }
  }

  void reset() {
    for (final FormItemState<dynamic> field in _fields) {
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

    for (final FormItemState<dynamic> field in _fields) {
      var v = getValue(field.name!, values);
      field.didChange(v);
    }
  }

  bool _validate() {
    bool hasError = false;
    String errorMessage = '';
    for (final FormItemState<dynamic> field in _fields) {
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
    for (final FormItemState<dynamic> field in _fields) {
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
        child: _FormScope(
            formState: this,
            generation: _generation,
            child: Column(
              children: widget.children,
            )));
  }
}

class _FormScope extends InheritedWidget {
  const _FormScope({
    required super.child,
    required FormState formState,
    required int generation,
  })  : _formState = formState,
        _generation = generation;

  final FormState _formState;

  /// Incremented every time a form field has changed. This lets us know when
  /// to rebuild the form.
  final int _generation;

  /// The [Form] associated with this widget.
  Form get form => _formState.widget;

  @override
  bool updateShouldNotify(_FormScope old) => _generation != old._generation;
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

typedef FormItemBuilder<T> = Widget Function(FormItemState<T> field);
typedef FormItemValidator<T> = String? Function(T? value);
typedef FormItemSetter<T> = void Function(T? newValue);

enum Layout { horizontal, vertical }

class FormItem<T> extends StatefulWidget {
  final Layout? layout;
  final NamePath? name;
  final String? label;
  final Widget? child;
  final FormItemBuilder<T> builder;
  final FormItemSetter<T>? onSaved;
  final T? initialValue;
  final FormItemValidator<T>? validator;
  final String? restorationId;
  final bool? required;

  const FormItem(
      {super.key,
      this.initialValue,
      this.validator,
      this.restorationId,
      this.child,
      this.layout = Layout.horizontal,
      this.name,
      this.label,
      required this.builder,
      this.onSaved,
      this.required});

  @override
  State<StatefulWidget> createState() => FormItemState<T>();
}

class FormItemState<T> extends State<FormItem<T>> with RestorationMixin {
  late dynamic _value = widget.initialValue;
  late final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  dynamic get value => _value;

  NamePath? get name => widget.name;

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
    Form.maybeOf(context)?._fieldDidChange();
    print("form item changed:" + value.toString());
  }

  @override
  void deactivate() {
    Form.maybeOf(context)?._unregister(this);
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Form.maybeOf(context)?._register(this);
    var child = widget.builder(this);

    Row fieldLabel = Row(
      children: [
        Text(
          widget.required == true ? "*" : "",
          style: TextStyle(color: material.Colors.red),
        ),
        Text(widget.label ?? ''),
      ],
    );

    List<Widget> filedChildren = [child];
    if (errorText != null) {
      filedChildren.add(Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Text(
          errorText!,
          style: TextStyle(color: material.Colors.red),
        ),
      ));
    }
// print(errorText);
    Expanded filedInput = Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: filedChildren,
    ));

    return widget.layout == Layout.horizontal
        ? Row(
            children: [
              fieldLabel,
              filedInput,
            ],
          )
        : Column(
            children: [
              fieldLabel,
              filedInput,
            ],
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

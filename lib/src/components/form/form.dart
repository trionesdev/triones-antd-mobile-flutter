import 'package:flutter/material.dart';
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
  final Set<FormItemState<dynamic>> _fields = <FormItemState<dynamic>>{};

  void _fieldDidChange() {}

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
      // field.save();
    }
  }

  void reset() {
    for (final FormItemState<dynamic> field in _fields) {
      field.reset();
    }
    _hasInteractedByUser = false;
    _fieldDidChange();
  }

  Future<dynamic> validateFields() async{
    return "";
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


typedef FormItemBuilder<T> = Widget Function(FormItemState<T> field);
typedef FormItemValidator<T> = String? Function(T? value);
typedef FormItemSetter<T> = void Function(T? newValue);

enum Layout { horizontal, vertical }

class FormItem<T> extends StatefulWidget {
  final Layout? layout;
  final String? name;
  final String? label;
  final Widget? child;
  final FormItemBuilder<T> builder;
  final FormItemSetter<T>? onSaved;
  final T? initialValue;
  final FormItemValidator<T>? validator;
  final String? restorationId;

  const FormItem(
      {super.key,
        this.initialValue,
        this.validator,
        this.restorationId,
        this.child,
        this.layout = Layout.horizontal, this.name, this.label, required this.builder, this.onSaved});

  @override
  State<StatefulWidget> createState() => FormItemState<T>();
}

class FormItemState<T> extends State<FormItem<T>> with RestorationMixin {
  late T? _value = widget.initialValue;
  late final RestorableStringN _errorText;
  final RestorableBool _hasInteractedByUser = RestorableBool(false);
  T? get value => _value;
  String? get errorText => _errorText.value;
  bool get hasError => _errorText.value != null;
  bool get hasInteractedByUser => _hasInteractedByUser.value;

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

  void didChange(T? value) {
    setState(() {
      _value = value;
      // _hasInteractedByUser.value = true;
    });
    print("form item changed:"+value.toString());
  }

  @override
  Widget build(BuildContext context) {
    Form.maybeOf(context)?._register(this);
    var child = widget.builder(this);
    return widget.layout == Layout.horizontal
        ? Row(
      children: [
        Text(widget.label ?? ''),
        Expanded(child: child),
      ],
    )
        : Column(
      children: [
        Text(widget.label ?? ''),
        Expanded(child: child),
      ],
    );
    // return child;
    return TextField();
  }

  @override
  String? get restorationId => widget.restorationId;


  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // registerForRestoration(_errorText, 'error_text');
    // registerForRestoration(_hasInteractedByUser, 'has_interacted_by_user');
  }
}
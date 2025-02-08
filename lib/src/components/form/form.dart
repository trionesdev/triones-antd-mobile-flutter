import 'package:flutter/material.dart';
import 'package:trionesdev_antd/antd.dart';

class Form extends StatefulWidget {
  const Form({super.key, required this.children});

  final List<Widget> children;

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

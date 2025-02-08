import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {


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

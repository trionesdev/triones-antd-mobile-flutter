import 'package:flutter/widgets.dart';

typedef FormFieldValidator<T> = String? Function(T? value);

enum Layout { horizontal, vertical }

class FormItem<T> extends StatefulWidget {
  final Layout? layout;
  final String? name;
  final Widget? label;
  final Widget? child;
  final Widget Function(FormItemState<T> field) builder;
  final T? initialValue;
  final FormFieldValidator<T>? validator;
  final String? restorationId;

  const FormItem(
      {super.key,
      this.initialValue,
      this.validator,
      this.restorationId,
      this.child,
      this.layout = Layout.horizontal, this.name, this.label, required this.builder});

  @override
  State<StatefulWidget> createState() => FormItemState();
}

class FormItemState<T> extends State<FormItem<T>> with RestorationMixin {
  late T? _value = widget.initialValue;
  late final RestorableStringN _errorText;
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  String? get errorText => _errorText.value;

  T? get value => _value;

  @override
  Widget build(BuildContext context) {


    var child = widget.builder(this);
    return widget.layout == Layout.horizontal
        ? Row(
            children: [
              Text(errorText ?? ''),
              Expanded(child: child),
            ],
          )
        : Column(
            children: [
              Text(errorText ?? ''),
              Expanded(child: child),
            ],
          );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_errorText, 'error_text');
    registerForRestoration(_hasInteractedByUser, 'has_interacted_by_user');
  }
}

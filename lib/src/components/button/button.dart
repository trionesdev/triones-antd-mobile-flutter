library;

import 'package:flutter/material.dart';

enum ButtonType { primary, text, dashed, link }
enum ButtonVariant{
  outlined,
  dashed,
  solid,
  filled,
  text,
  link,
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.type = ButtonType.primary,
    this.block,
    this.disabled,
    this.text,
    this.icon,
    this.onPressed,
    this.variant
  });

  final ButtonType type;
  final bool? block;
  final bool? disabled;
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final ButtonVariant? variant;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {



  @override
  Widget build(BuildContext context) {

    ButtonStyle buttonStyleBuild(){
      ButtonStyle buttonStyle = ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide.none
        )),
      );
      if (widget.type == ButtonType.primary) {
        buttonStyle = buttonStyle.merge(ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Color(0xFF1777ff)),
            side: WidgetStateProperty.all(BorderSide.none)));
      } else if (widget.type == ButtonType.link) {
        buttonStyle = buttonStyle.merge(ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
           side: WidgetStateProperty.all(BorderSide.none)
        ));
      }
      if(widget.variant == ButtonVariant.solid){
        buttonStyle = buttonStyle.merge(ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Color(0xFF1777ff)),
            side: WidgetStateProperty.all(BorderSide.none)));
      }else if (widget.variant == ButtonVariant.outlined){
        buttonStyle = buttonStyle.merge(ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            side: WidgetStateProperty.all(BorderSide(color: Color(0xFFd9d9d9)))));
      }else if (widget.variant == ButtonVariant.dashed){
        buttonStyle = buttonStyle.merge(ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ));
      }else if(widget.variant == ButtonVariant.filled){
        buttonStyle = buttonStyle.merge(ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ));
      }else if(widget.variant == ButtonVariant.text){
        buttonStyle = buttonStyle.merge(ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ));
      }
      else if(widget.variant == ButtonVariant.link){
        buttonStyle = buttonStyle.merge(ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ));
      }
      return buttonStyle;
    }

    ButtonStyle buttonStyle = buttonStyleBuild();
    TextStyle textStyle = TextStyle(color: Colors.black);


    if (widget.icon != null) {
      return IconButton(
          onPressed: widget.onPressed, icon: widget.icon!, style: buttonStyle);
    }
    return TextButton.icon(
      onPressed: widget.onPressed,
      icon: widget.icon,
      label: Text(widget.text != null ? widget.text! : '', style: textStyle),
      style: buttonStyle,
    );
  }
}

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  @override
  const InputField({
    Key key,
    this.lableText ,
    this.child,
    this.icon,
    this.hintText,
    this.IanputBorder,
    this.IsPassword,
    this.size,
    this.keyboardtype,
    this.maxLine,

  }) : super(key: key);

  final  Icon icon;
  final String lableText;
  final Widget child;
  final String hintText;
  final InputBorder IanputBorder;
  final bool IsPassword;
  final double size;
  final TextInputType keyboardtype;
  final int maxLine;
  Widget build(BuildContext context,) {
    return Column(
      children: <Widget>[
        Container(

          child: TextField(
            obscureText: IsPassword,
            obscuringCharacter: "*",
            decoration: InputDecoration(icon: icon,
                border: IanputBorder,
                labelText: lableText,
                hintText: hintText,
              contentPadding:  EdgeInsets.symmetric(vertical: size),
              

            ),
            keyboardType:keyboardtype,
            maxLines: maxLine,
          ),
        ),
      ],
    );
  }
}

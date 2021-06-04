import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  @override
  const InputField({
    Key key,
    this.lableText ,
    this.child,
    this.icon,
    this.hintText,
    this.isPassword= false

  }) : super(key: key);

  final  Icon icon;
  final String lableText;
  final Widget child;
  final String hintText;
  final bool isPassword;
  Widget build(BuildContext context,) {

    return Column(
      children: <Widget>[
        Container(

          child: TextField(
            obscureText: isPassword,
            obscuringCharacter: "*",
            decoration: InputDecoration(icon: icon,
                labelText: lableText,
                hintText: hintText,

            ),
          ),
        ),
      ],
    );
  }
}

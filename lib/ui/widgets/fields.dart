  import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

FormBuilderTextField textField(BuildContext context,
      {@required String name,
      @required String label,
      @required String hint,
      Icon icon,
      bool isPassword = false,
      @required Function onChanged}) {
    return FormBuilderTextField(
      name: name,
      onChanged: onChanged ??
          (str) {
            return str;
          },
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context)]),
      obscureText: isPassword,
      obscuringCharacter: '*',
      decoration: InputDecoration(
          focusColor: Colors.indigo[400],
          icon: icon?? null,
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }

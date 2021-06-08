import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

FormBuilderTextField textField(BuildContext context,
    {@required String name,
    @required String label,
    @required String hint,
    Icon icon,
    bool isPassword = false,
    bool isNote = false,
    bool filled = true,
    @required Function onChanged}) {
  return FormBuilderTextField(
    name: name,
    onChanged: onChanged ??
        (str) {
          return str;
        },
    maxLines: isNote ? 5 : 1,
    maxLength: isNote ? 255 : null,
    validator: FormBuilderValidators.compose(
        [FormBuilderValidators.required(context)]),
    obscureText: isPassword,
    obscuringCharacter: '*',
    decoration: InputDecoration(
        filled: filled,
        fillColor: Colors.grey[200],
        border: filled ? OutlineInputBorder(borderSide: BorderSide.none) : null,
        contentPadding: EdgeInsets.all(15),
        focusColor: Colors.indigo[400],
        icon: icon ?? null,
        labelText: label,
        alignLabelWithHint: true,
        labelStyle: TextStyle(color: Colors.indigo),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400])),
  );
}

FormBuilderDateTimePicker datePicker(
    {@required String name,
    @required String label,
    @required String hint,
    Icon icon,
    @required Function onChanged}) {
  return FormBuilderDateTimePicker(
    name: name,
    inputType: InputType.date,
    onChanged: onChanged,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        focusColor: Colors.indigo[400],
        icon: icon ?? null,
        labelText: label,
        labelStyle: TextStyle(color: Colors.indigo),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400])),
  );
}

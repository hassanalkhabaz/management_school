import 'package:flutter/material.dart';

Widget CustomButton({@required Function onPressed, @required String title}) {
  return FlatButton(
    onPressed: onPressed,
    height: 50,
    padding: EdgeInsets.symmetric(horizontal: 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Colors.blueGrey[600],
    child: Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

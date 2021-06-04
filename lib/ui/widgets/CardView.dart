import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CardView({
  @required Widget cardHeader,
  @required Widget cardBody,
  headerColor,
}) {
  return Card(
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: headerColor ?? Colors.grey[100],
          ),
          padding: EdgeInsets.all(10),
          child: cardHeader,
        ),
        cardBody,
      ],
    ),
  );
}

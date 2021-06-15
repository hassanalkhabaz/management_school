import 'package:flutter/material.dart';

Future dialog(BuildContext context, {onPressed}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Delete confirmation'),
        content: Text('Delete confirmation message'),
        actions: <Widget>[
          FlatButton(onPressed: onPressed, child: Text('delete')),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('cancel'),
          ),
        ],
      );
    },
  );
}

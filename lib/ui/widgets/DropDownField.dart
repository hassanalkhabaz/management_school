import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  final List<String> items;
  final Function onChange;
  final hint;
  DropDownField(
      {@required this.items,
      @required this.onChange,
      this.hint = 'Select item'});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(hint),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
      ),
      onChanged: onChange,
      items: items
          .map<DropdownMenuItem<String>>(
              (item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
    );
  }
}

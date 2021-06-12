import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddMark extends StatefulWidget {
  @override
  _AddMarkState createState() => _AddMarkState();
}

class _AddMarkState extends State<AddMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add mark'),
        backgroundColor: Colors.indigo,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DropDownField(
                  hint: "Class",
                  items: ['class1'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Subject",
                  items: ['subject'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Student",
                  items: ['student'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Mark type",
                  items: ['mark_type'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  label: "Mark",
                  name: "Mark",
                  hint: "student mark",
                  onChanged: (str) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

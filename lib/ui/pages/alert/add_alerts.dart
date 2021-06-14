import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddAlert extends StatefulWidget {
  @override
  _AddAlertState createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Alert'),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                textField(
                  context,
                  label: "Alert description",
                  name: "Mark",
                  hint: "student mark",
                  isNote: true,
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Section",
                  items: ['section1'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Student",
                  items: ['student'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Add Alert'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

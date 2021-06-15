import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddHomeWork extends StatefulWidget {
  @override
  _AddHomeWorkState createState() => _AddHomeWorkState();
}

class _AddHomeWorkState extends State<AddHomeWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add HomeWork'),
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
                datePicker(
                    label: "Submitting date",
                    name: "submitting_date",
                    onChanged: (str) {},
                    hint: "homework submitting date"),
                SizedBox(height: 20),
                DropDownField(
                  onChange: (val) {},
                  items: ['section1', 'section2'],
                  hint: 'Section',
                ),
                SizedBox(height: 20),
                DropDownField(
                  onChange: (val) {},
                  items: ['math', 'arabic'],
                  hint: 'Subject',
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  isNote: true,
                  label: "Description",
                  name: "description",
                  hint: "add homework description",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Add Homework'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/custom_button.dart';

class SubjectToTeacher extends StatefulWidget {
  @override
  _SubjectToTeacherState createState() => _SubjectToTeacherState();
}

class _SubjectToTeacherState extends State<SubjectToTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Teacher to subject'),
        backgroundColor: Colors.cyan,
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
                DropDownField(
                  hint: 'subject Name',
                  onChange: (val) {},
                  items: ['1', '2', '3'],
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: 'teacher Name',
                  onChange: (val) {},
                  items: ['1', '2', '3'],
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: 'section Name',
                  onChange: (val) {},
                  items: ['1', '2', '3'],
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Add'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';

class AddAttendance extends StatefulWidget {
  @override
  _AddAttendanceState createState() => _AddAttendanceState();
}

class _AddAttendanceState extends State<AddAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Attendance'),
        backgroundColor: Colors.cyan,
      ),
      drawer: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Navigator.of(context).pop(),
      ),
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
                FormBuilderCheckbox(
                  name: 'attendance',
                  title: Text('Is Attandees'),
                  initialValue: false,
                  selected: false,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Add Attendance'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

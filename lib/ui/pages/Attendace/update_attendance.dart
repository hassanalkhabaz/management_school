import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';

class UpdateAttendance extends StatefulWidget {
  @override
  _UpdateAttendanceState createState() => _UpdateAttendanceState();
}

class _UpdateAttendanceState extends State<UpdateAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Attendance'),
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
                CustomButton(onPressed: () {}, title: 'Update Attendance'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

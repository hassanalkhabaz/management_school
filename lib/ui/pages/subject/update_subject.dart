import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class UpdateSubject extends StatefulWidget {
  @override
  _UpdateSubjectState createState() => _UpdateSubjectState();
}

class _UpdateSubjectState extends State<UpdateSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Subject'),
        backgroundColor: Colors.indigo,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                textField(
                  context,
                  label: "Subject name",
                  name: "subject_name",
                  hint: "Enter subject name",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Update'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

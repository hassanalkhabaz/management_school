import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddSubject extends StatefulWidget {
  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subject'),
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
                  label: "Section id",
                  name: "section_id",
                  hint: "Enter section id",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  label: "Subject name",
                  name: "subject_name",
                  hint: "Enter subject name",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Add Subject'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

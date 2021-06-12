import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddActivity extends StatefulWidget {
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add activity'),
        backgroundColor: Colors.blueGrey[600],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                datePicker(
                    label: "Begin date",
                    name: "Begin_date",
                    onChanged: (str) {},
                    hint: "Activity Begin date"),
                SizedBox(height: 20),
                datePicker(
                    label: "end date",
                    name: "end_date",
                    onChanged: (str) {},
                    hint: "Activity end date"),
                SizedBox(height: 20),
                textField(
                  context,
                  label: "Activity type",
                  name: "activity_type",
                  hint: "enter activity type",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  isNote: true,
                  label: "Description",
                  name: "description",
                  hint: "add activity description",
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

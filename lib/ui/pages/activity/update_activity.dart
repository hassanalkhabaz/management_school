import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class UpdateActivity extends StatefulWidget {
  @override
  _UpdateActivityState createState() => _UpdateActivityState();
}

class _UpdateActivityState extends State<UpdateActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update activity'),
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

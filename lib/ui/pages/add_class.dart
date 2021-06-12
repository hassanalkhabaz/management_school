import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddClass extends StatefulWidget {
  @override
  _AddClassState createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Class'),
        backgroundColor: Colors.blueGrey[600],
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
                  label: "Class name",
                  name: "class_name",
                  hint: "Enter Class name",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  label: "Total fees",
                  name: "total_fees",
                  hint: "Enter total fees",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Add Class'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

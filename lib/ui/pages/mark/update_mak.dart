import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class UpdateMark extends StatefulWidget {
  @override
  _UpdateMarkState createState() => _UpdateMarkState();
}

class _UpdateMarkState extends State<UpdateMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update mark'),
        backgroundColor: Colors.indigo,
      ),
      drawer: MyDrawer(),
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
                  hint: "Subject",
                  items: ['subject'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Student",
                  items: ['student'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Mark type",
                  items: ['mark_type'],
                  onChange: (val) {},
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/add_mark_type');
                    },
                    child: Text("add new type",
                        style: TextStyle(
                            color: Colors.indigo[800],
                            decoration: TextDecoration.underline)),
                  ),
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  label: "Mark",
                  name: "mark",
                  hint: "student mark",
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

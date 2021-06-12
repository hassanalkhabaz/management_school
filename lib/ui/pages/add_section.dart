import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddSection extends StatefulWidget {
  @override
  _AddSectionState createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Section'),
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
                  label: "Section name",
                  name: "section_name",
                  hint: "Enter section name",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  onChange: (val) {},
                  items: ['c1', 'c2'],
                  hint: 'Class',
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Add Section'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

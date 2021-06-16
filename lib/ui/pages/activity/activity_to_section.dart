import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/custom_button.dart';

class ActivityToSection extends StatefulWidget {
  @override
  _ActivityToSectionState createState() => _ActivityToSectionState();
}

class _ActivityToSectionState extends State<ActivityToSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Activity to section'),
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
                  hint: 'Activity Id',
                  onChange: (val) {},
                  items: ['1', '2', '3'],
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: 'Section Id',
                  onChange: (val) {},
                  items: ['1', '2', '3'],
                ),
                SizedBox(height: 20),
                CustomButton(
                    onPressed: () {}, title: 'Add'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

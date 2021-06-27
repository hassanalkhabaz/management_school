import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/custom_button.dart';

class UpdateActivityToSection extends StatefulWidget {
  @override
  _UpdateActivityToSectionState createState() =>
      _UpdateActivityToSectionState();
}

class _UpdateActivityToSectionState extends State<UpdateActivityToSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Activity with section'),
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
                  hint: 'Activity Name',
                  onChange: (val) {},
                  items: ['1', '2', '3'],
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: 'Section Name',
                  onChange: (val) {},
                  items: ['1', '2', '3'],
                ),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Update activity'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

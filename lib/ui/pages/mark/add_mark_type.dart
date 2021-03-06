import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddMarkType extends StatefulWidget {
  @override
  _AddMarkTypeState createState() => _AddMarkTypeState();
}

class _AddMarkTypeState extends State<AddMarkType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new mark type'),
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
                textField(context,
                    name: 'type_name',
                    label: "Type name",
                    hint: "New Type name",
                    onChanged: (val) {}),
                SizedBox(height: 20),
                CustomButton(onPressed: () {}, title: 'Add'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

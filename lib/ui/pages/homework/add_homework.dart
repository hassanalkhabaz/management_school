import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddHomeWork extends StatefulWidget {
  @override
  _AddHomeWorkState createState() => _AddHomeWorkState();
}

class _AddHomeWorkState extends State<AddHomeWork> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String sectionId, subjectId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add HomeWork'),
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
                    label: "Submitting date",
                    name: "submitting_date",
                    onChanged: (str) {},
                    hint: "homework submitting date"),
                SizedBox(height: 20),
                DropDownField(
                  onChange: (val) {
                    sectionId = val;
                  },
                  items: ['section1', 'section2'],
                  hint: 'Section',
                ),
                SizedBox(height: 20),
                DropDownField(
                  onChange: (val) {
                    subjectId = val;
                  },
                  items: ['math', 'arabic'],
                  hint: 'Subject',
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  isNote: true,
                  label: "Description",
                  name: "description",
                  hint: "add homework description",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                !_isLoading
                    ? CustomButton(
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createHomework(
                              description:
                                  _formKey.currentState.fields['description'],
                              endDate: _formKey
                                  .currentState.fields['submitting_date'],
                              sectionId: sectionId,
                              subjectId: subjectId,
                            );
                          }
                        },
                        title: 'Add Homework')
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createHomework({description, endDate, sectionId, subjectId}) async {
    _isLoading = true;
    ApiHelper()
        .createHomework(
            description: description,
            endDate: endDate,
            sectionId: sectionId,
            subjectId: subjectId)
        .then((value) {
      // if(value){}
      // created!
      setState(() {
        _isLoading = false;
      });
    });
  }
}

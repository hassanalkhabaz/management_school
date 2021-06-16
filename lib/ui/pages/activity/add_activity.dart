import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddActivity extends StatefulWidget {
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add activity'),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                datePicker(
                    label: "Begin date",
                    name: "begin_date",
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
                !_isLoading
                    ? CustomButton(
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createActivity(
                              description:
                                  _formKey.currentState.fields['description'],
                              typeOf:
                                  _formKey.currentState.fields['activity_type'],
                              endDate: _formKey.currentState.fields['end_date'],
                            );
                          }
                        },
                        title: 'Add Activity')
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createActivity({description, typeOf, endDate}) {
    _isLoading = true;
    ApiHelper()
        .createActivity(
            description: description, typeOf: typeOf, endDate: endDate)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';
import 'package:management_school/api/api_helper.dart';

class AddAlert extends StatefulWidget {
  @override
  _AddAlertState createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlert> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  var studentId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Alert'),
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
                  hint: "Class",
                  items: ['Class1', 'Class3', 'Class3'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Section",
                  items: ['Section1', 'Section3', 'Section3'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Student",
                  items: ['Student1', 'Student3', 'Student3'],
                  onChange: (val) {
                    studentId = val;
                  },
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  label: "Alert description",
                  name: "Mark",
                  hint: "student mark",
                  isNote: true,
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                !_isLoading
                    ? CustomButton(
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createAlert(
                              alarmReason: _formKey.currentState.fields['Mark'],
                              id: studentId,
                            );
                          }
                        },
                        title: 'Add Alert')
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createAlert({id, alarmReason}) async {
    _isLoading = true;
    ApiHelper()
        .createAlarm(studentId: id, alarmReason: alarmReason)
        .then((value) {
      // if(value){}
      // created!
      setState(() {
        _isLoading = false;
      });
    });
  }
}

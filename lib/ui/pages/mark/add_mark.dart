import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddMark extends StatefulWidget {
  @override
  _AddMarkState createState() => _AddMarkState();
}

class _AddMarkState extends State<AddMark> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String userId, subId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Add mark'),
          backgroundColor: Colors.cyan,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DropDownField(
                  hint: "Class",
                  items: ['Class1', 'Class2', 'Class3'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                    //TODO:init values
                    hint: 'Select Section',
                    items: ['Section1', 'Section2', 'Section3'],
                    onChange: (val) {}),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Subject",
                  items: ['Subject1', 'Subject2', 'Subject3'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Student",
                  items: ['Student1', 'Student2', 'Student3'],
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
                            color: Colors.cyan[800],
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
                !_isLoading
                    ? CustomButton(
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createMark(
                              degree: _formKey.currentState.fields['mark'],
                              markTypeId:
                                  _formKey.currentState.fields['mark_type'],
                              userId: userId,
                              subId: subId,
                            );
                          }
                        },
                        title: 'Add Mark')
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createMark({degree, markTypeId, subId, userId}) {
    _isLoading = true;
    ApiHelper()
        .createMark(
            degree: degree,
            markTypeId: markTypeId,
            subId: subId,
            userId: userId)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }
}

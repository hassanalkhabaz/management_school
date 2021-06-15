import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddSection extends StatefulWidget {
  @override
  _AddSectionState createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String classId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Section'),
        backgroundColor: Colors.indigo,
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
                textField(
                  context,
                  label: "Section name",
                  name: "section_name",
                  hint: "Enter section name",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  onChange: (val) {
                    classId = val;
                  },
                  items: ['c1', 'c2'],
                  hint: 'Class',
                ),
                SizedBox(height: 20),
                !_isLoading
                    ? CustomButton(
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createSection(
                              name:
                                  _formKey.currentState.fields['section_name'],
                              classId: classId,
                            );
                          }
                        },
                        title: 'Add Section')
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createSection({name, classId}) {
    _isLoading = true;
    ApiHelper().createSection(name, classId).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }
}

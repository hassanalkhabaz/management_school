import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddClass extends StatefulWidget {
  @override
  _AddClassState createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Class'),
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
                textField(
                  context,
                  label: "Class name",
                  name: "class_name",
                  hint: "Enter Class name",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  label: "Total fees",
                  name: "total_fees",
                  hint: "Enter total fees",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                !_isLoading
                    ? CustomButton(
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createClass(
                              name: _formKey.currentState.fields['class_name'],
                              fees: _formKey.currentState.fields['total_fees'],
                            );
                          }
                        },
                        title: 'Add Class')
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createClass({name, fees}) {
    _isLoading = true;
    ApiHelper().createClass(name: name, fees: fees).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }
}

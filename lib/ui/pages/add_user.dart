import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddUser extends StatefulWidget {
  const AddUser();

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add User'),
          backgroundColor: Colors.indigo[400],
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
                    label: "First name",
                    name: "first_name",
                    hint: "enter user first name",
                    onChanged: (str) {},
                  ),
                  textField(
                    context,
                    label: "Last name",
                    name: "last_name",
                    hint: "enter user last name",
                    onChanged: (str) {},
                  ),
                  FormBuilderDateTimePicker(
                    name: 'date',
                    inputType: InputType.date,
                    onChanged: (value) {},
                    decoration: InputDecoration(hintText: 'Pick date'),
                    initialDate: DateTime.now(),
                  ),
                  DropDownField(
                    onChange: (val) {},
                    items: ['first'],
                  ),
                  textField(
                    context,
                    label: "Father name",
                    name: "father_name",
                    hint: "enter user father name",
                    onChanged: (str) {},
                  ),
                  textField(
                    context,
                    label: "Mother name",
                    name: "mother_name",
                    hint: "enter user mother name",
                    onChanged: (str) {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textField(
                    context,
                    label: "Username",
                    name: "username",
                    hint: "enter username",
                    onChanged: (str) {},
                  ),
                  textField(
                    context,
                    label: "Email",
                    name: "email",
                    hint: "enter user email",
                    onChanged: (str) {},
                  ),
                  textField(
                    context,
                    label: "Password",
                    name: "password",
                    hint: "enter password",
                    isPassword: true,
                    onChanged: (str) {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
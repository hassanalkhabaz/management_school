import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
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
          backgroundColor: Colors.indigo,
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
                  SizedBox(height: 20),
                  textField(
                    context,
                    label: "Last name",
                    name: "last_name",
                    hint: "enter user last name",
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  datePicker(
                      hint: "birthday",
                      name: "birthday",
                      onChanged: (str) {},
                      label: "Birthday"),
                  SizedBox(height: 20),
                  DropDownField(
                    items: ['female', 'male'],
                    onChange: (val) {},
                    hint: "Gender",
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.indigo,
                  ),
                  textField(
                    context,
                    label: "Father name",
                    name: "father_name",
                    hint: "enter user father name",
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  textField(
                    context,
                    label: "Mother name",
                    name: "mother_name",
                    hint: "enter user mother name",
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.indigo,
                  ),
                  textField(
                    context,
                    label: "Phone number",
                    name: "phone_number",
                    hint: "enter user phone number",
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  textField(
                    context,
                    label: "Home number",
                    name: "home_number",
                    hint: "enter user home number",
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  textField(
                    context,
                    label: "Mother phone number",
                    name: "mother_phonenumber",
                    hint: "enter mother phone number",
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  textField(
                    context,
                    label: "Father phone number",
                    name: "father_phonenumber",
                    hint: "enter father phone number",
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.indigo,
                  ),
                  textField(
                    context,
                    label: "Username",
                    name: "username",
                    hint: "enter username",
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  DropDownField(
                    items: ['s1', 's2'],
                    onChange: (val) {},
                    hint: "Section",
                  ),
                  SizedBox(height: 20),
                  textField(
                    context,
                    label: "Password",
                    name: "password",
                    hint: "enter password",
                    isPassword: true,
                    onChanged: (str) {},
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    title: 'Add user',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User settings'),
          backgroundColor: Colors.indigo,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      FormBuilderSwitch(
                        decoration: InputDecoration(border: InputBorder.none),
                        name: 'user_status',
                        title: Text('User status'),
                        subtitle: Text('Toggle user status'),
                        initialValue: true,
                        onChanged: (val) {},
                      ),
                      Divider(
                        thickness: 1.5,
                        height: 25,
                        color: Colors.indigo,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textField(
                        context,
                        label: "New password",
                        name: "password",
                        hint: "Change user password",
                        isPassword: true,
                        onChanged: (str) {},
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        title: 'Change password',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/fields.dart';

class LogIn extends StatelessWidget {
  ///default = 40
  double verticalSpacing = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, colors: [
              Colors.indigo[500],
              Colors.indigo[300],
              Colors.indigo[400]
            ]),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: verticalSpacing * 2,
              ),

              /// Header
              buildHeader(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),

                ///
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: verticalSpacing * 2,
                      horizontal: verticalSpacing),
                  child: buildLoginForm(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildLoginForm(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                textField(context,
                    icon: Icon(
                      Icons.person,
                      color: Colors.indigo,
                    ),
                    filled: false,
                    name: 'username',
                    label: 'Username',
                    hint: 'enter your username',
                    onChanged: (val) {}),
                SizedBox(
                  height: verticalSpacing * .5,
                ),
                textField(context,
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.indigo,
                    ),
                    filled: false,
                    name: 'password',
                    label: 'Password',
                    hint: 'enter your password here',
                    isPassword: true,
                    onChanged: (val) {}),
              ],
            ),
          ),
        ),
        SizedBox(
          height: verticalSpacing * .5,
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: verticalSpacing * .5), // to make an equal spacing
          ),
          child: Text(
            'forget password ?',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: verticalSpacing * .5,
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.indigo[400],
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Column buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Welcome to MY SCHOOL management',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

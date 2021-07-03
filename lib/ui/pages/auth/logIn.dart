import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/ui/widgets/fields.dart';
import 'package:bot_toast/bot_toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormBuilderState>();

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
              Colors.cyan,
              Colors.cyan[400],
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
                      color: Colors.cyan,
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
                      color: Colors.cyan,
                    ),
                    filled: false,
                    name: 'password',
                    label: 'Password',
                    hint: 'enter your password here',
                    isPassword: true,
                    onChanged: (val) {}),
                FormBuilderCheckbox(
                  name: 'remember_me',
                  title: Text('Remember me'),
                  activeColor: Colors.cyan[300],
                  tristate: false,
                  initialValue: false,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: verticalSpacing * .5,
        ),
        SizedBox(
          height: verticalSpacing * .5,
        ),
        FlatButton(
            onPressed: () {
              if (_formKey.currentState.saveAndValidate()) {
                login();
              }
            },
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.cyan,
            child: _isLoading
                ? CircularProgressIndicator()
                : Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
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

  void login() {
    setState(() {
      _isLoading = true;
    });
    ApiHelper()
        .login(_formKey.currentState.value['username'],
            _formKey.currentState.value['password'], true)
        .then((response) {
      setState(() {
        _isLoading = false;
      });
      response.succeeded
          ? Navigator.of(context).pushReplacementNamed('/home')
          : BotToast.showText(text: 'wrong username or password');
    });
  }
}

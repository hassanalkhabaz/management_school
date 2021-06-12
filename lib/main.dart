import 'package:management_school/ui/pages/add_activity.dart';
import 'package:management_school/ui/pages/class/add_class.dart';
import 'package:management_school/ui/pages/add_homeword.dart';
import 'package:management_school/ui/pages/add_mark.dart';
import 'package:management_school/ui/pages/add_programe.dart';
import 'package:management_school/ui/pages/add_subject.dart';
import 'package:management_school/ui/pages/class/list_classes.dart';
import 'package:management_school/ui/pages/section/add_section.dart';
import 'package:management_school/ui/pages/section/list_sections.dart';
import 'package:management_school/ui/pages/user/add_user.dart';
import 'package:management_school/ui/pages/auth/forgot_password.dart';
import 'package:management_school/ui/pages/auth/logIn.dart';
import 'package:management_school/ui/pages/home.dart';

import 'package:flutter/material.dart';
import 'package:management_school/ui/pages/user/list_users.dart';
import 'package:management_school/ui/pages/user/user_settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'MY SCHOOL',
      routes: {
        ///
        '/login': (context) => LogIn(),
        '/forgot_password': (context) => ForgotPassword(),
        '/auth_password': (context) => ForgotPassword(),

        ///
        '/add_user': (context) => AddUser(),
        '/list_users': (context) => ListUsers(),
        '/user_settings': (context) => UserSettings(),

        ///
        '/add_class': (context) => AddClass(),
        '/list_classes': (context) => ListClasses(),

        ///
        '/add_section': (context) => AddSection(),
        '/list_sections': (context) => ListSections(),

        ///
        '/add_homework': (context) => AddHomeWork(),
        '/add_activity': (context) => AddActivity(),
        '/add_programe': (context) => AddPrograme(),
        '/add_mark': (context) => AddMark(),

        '/add_subject': (context) => AddSubject(),
        '/home': (context) => Home(),
      },
      home: LogIn(),
    );
  }
}

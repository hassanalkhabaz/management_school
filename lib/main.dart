import 'package:management_school/ui/pages/add_activity.dart';
import 'package:management_school/ui/pages/add_class.dart';
import 'package:management_school/ui/pages/add_homeword.dart';
import 'package:management_school/ui/pages/add_mark.dart';
import 'package:management_school/ui/pages/add_programe.dart';
import 'package:management_school/ui/pages/add_section.dart';
import 'package:management_school/ui/pages/add_subject.dart';
import 'package:management_school/ui/pages/user/add_user.dart';
import 'package:management_school/ui/pages/alerts.dart';
import 'package:management_school/ui/pages/forgot_password.dart';
import 'package:management_school/ui/pages/marks.dart';
import 'package:management_school/ui/pages/notifications.dart';
import 'package:management_school/ui/pages/payments.dart';
import 'package:management_school/ui/pages/profile.dart';
import 'package:management_school/ui/pages/programs.dart';
import 'package:management_school/ui/pages/splash.dart';
import 'package:management_school/ui/pages/logIn.dart';
import 'package:management_school/ui/pages/home.dart';
import 'package:management_school/ui/pages/attendance.dart';

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
        '/splash': (context) => Splash(),
        '/login': (context) => LogIn(),
        '/forgot_password': (context) => ForgotPassword(),
        
        '/add_user': (context) => AddUser(),
        '/list_user': (context) => ListUsers(),
        '/user_settings': (context) => UserSettings(),

        '/add_homework': (context) => AddHomeWork(),
        '/add_activity': (context) => AddActivity(),
        '/add_programe': (context) => AddPrograme(),
        '/add_mark': (context) => AddMark(),
        '/add_class': (context) => AddClass(),
        '/add_section': (context) => AddSection(),
        '/add_subject': (context) => AddSubject(),
        '/profile': (context) => Profile(),
        '/home': (context) => Home(),
        '/alerts': (context) => Alerts(),
        '/payments': (context) => Payments(),
        '/marks': (context) => Marks(),
        '/notifications': (context) => Notifications(),
        '/programs': (context) => Programs(),
        '/attendance': (context) => Attendance(),
      },
      home: LogIn(),
    );
  }
}

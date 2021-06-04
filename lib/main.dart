import 'package:management_school/ui/pages/add_homeword.dart';
import 'package:management_school/ui/pages/add_user.dart';
import 'package:management_school/ui/pages/alerts.dart';
import 'package:management_school/ui/pages/forgot_password.dart';
import 'package:management_school/ui/pages/homeworks.dart';
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
        '/add_homework': (context) => AddHomeWork(),
        '/profile': (context) => Profile(),
        '/home': (context) => Home(),
        '/alerts': (context) => Alerts(),
        '/payments': (context) => Payments(),
        '/marks': (context) => Marks(),
        '/notifications': (context) => Notifications(),
        '/programs': (context) => Programs(),
        '/homeworks': (context) => Homeworks(),
        '/attendance': (context) => Attendance(),
      },
      home: LogIn(),
    );
  }
}

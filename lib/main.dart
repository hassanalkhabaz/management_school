import 'package:management_school/ui/pages/activity/activity_to_section.dart';
import 'package:management_school/ui/pages/activity/add_activity.dart';
import 'package:management_school/ui/pages/activity/list_activities.dart';
import 'package:management_school/ui/pages/alert/add_alerts.dart';
import 'package:management_school/ui/pages/homework/list_homework.dart';
import 'package:management_school/ui/pages/mark/add_mark_type.dart';
import 'package:management_school/ui/pages/payment/add_payment.dart';
import 'package:management_school/ui/pages/alert/list_alerts.dart';
import 'package:management_school/ui/pages/attendance.dart';
import 'package:management_school/ui/pages/class/add_class.dart';
import 'package:management_school/ui/pages/homework/add_homeword.dart';
import 'package:management_school/ui/pages/mark/add_mark.dart';
import 'package:management_school/ui/pages/add_programe.dart';
import 'package:management_school/ui/pages/class/list_classes.dart';
import 'package:management_school/ui/pages/payment/list_payments.dart';
import 'package:management_school/ui/pages/subject/add_subject.dart';
import 'package:management_school/ui/pages/subject/list_subjects.dart';
import 'package:management_school/ui/pages/section/add_section.dart';
import 'package:management_school/ui/pages/section/list_sections.dart';
import 'package:management_school/ui/pages/subject/subject_to_teacher.dart';
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
      debugShowCheckedModeBanner: false,
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
        '/add_activity': (context) => AddActivity(),
        '/list_activity': (context) => ListActivities(),
        '/activity_to_section': (context) => ActivityToSection(),

        ///
        '/list_subject': (context) => ListSubjects(),
        '/add_subject': (context) => AddSubject(),
        '/subject_to_teacher': (context) => SubjectToTeacher(),

        ///
        '/list_alert': (context) => ListAlerts(),
        '/add_alert': (context) => AddAlert(),

        ///
        '/add_mark': (context) => AddMark(),
        '/add_mark_type': (context) => AddMarkType(),

        ///
        '/list_payment': (context) => ListPayments(),
        '/add_payment': (context) => AddPayment(),

        ///
        '/add_homework': (context) => AddHomeWork(),
        '/list_homework': (context) => ListHomeWorks(),

        ///
        '/add_programe': (context) => AddPrograme(),
        '/attendance': (context) => Attendance(),

        '/home': (context) => Home(),
      },
      home: LogIn(),
    );
  }
}

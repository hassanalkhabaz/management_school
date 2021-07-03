import 'package:management_school/ui/pages/Attendace/list_attendance.dart';
import 'package:management_school/ui/pages/Attendace/update_attendance.dart';
import 'package:management_school/ui/pages/activity/activity_with_section/activity_to_section.dart';
import 'package:management_school/ui/pages/activity/activity_with_section/update_activity_with_section.dart';
import 'package:management_school/ui/pages/activity/add_activity.dart';
import 'package:management_school/ui/pages/activity/list_activities.dart';
import 'package:management_school/ui/pages/activity/update_activity.dart';
import 'package:management_school/ui/pages/alert/add_alerts.dart';
import 'package:management_school/ui/pages/alert/update_alert.dart';
import 'package:management_school/ui/pages/class/update_class.dart';
import 'package:management_school/ui/pages/homework/list_homework.dart';
import 'package:management_school/ui/pages/homework/update_homework.dart';
import 'package:management_school/ui/pages/mark/add_mark_type.dart';
import 'package:management_school/ui/pages/mark/list_marks.dart';
import 'package:management_school/ui/pages/mark/update_mak.dart';
import 'package:management_school/ui/pages/payment/add_payment.dart';
import 'package:management_school/ui/pages/alert/list_alerts.dart';
import 'package:management_school/ui/pages/attendace/add_attendance.dart';
import 'package:management_school/ui/pages/class/add_class.dart';
import 'package:management_school/ui/pages/homework/add_homework.dart';
import 'package:management_school/ui/pages/mark/add_mark.dart';
import 'package:management_school/ui/pages/programe/add_programe.dart';
import 'package:management_school/ui/pages/class/list_classes.dart';
import 'package:management_school/ui/pages/payment/list_payments.dart';
import 'package:management_school/ui/pages/payment/update_payment.dart';
import 'package:management_school/ui/pages/programe/list_programes.dart';
import 'package:management_school/ui/pages/section/update_section.dart';
import 'package:management_school/ui/pages/splash.dart';
import 'package:management_school/ui/pages/subject/add_subject.dart';
import 'package:management_school/ui/pages/subject/list_subjects.dart';
import 'package:management_school/ui/pages/section/add_section.dart';
import 'package:management_school/ui/pages/section/list_sections.dart';
import 'package:management_school/ui/pages/subject/subject_to_teacher.dart';
import 'package:management_school/ui/pages/subject/update_subject.dart';
import 'package:management_school/ui/pages/user/add_user.dart';
import 'package:management_school/ui/pages/auth/forgot_password.dart';
import 'package:management_school/ui/pages/auth/logIn.dart';
import 'package:management_school/ui/pages/home.dart';

import 'package:flutter/material.dart';
import 'package:management_school/ui/pages/user/list_users.dart';
import 'package:management_school/ui/pages/user/update_user.dart';
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
        '/login': (context) => Login(),
        '/forgot_password': (context) => ForgotPassword(),
        '/auth_password': (context) => ForgotPassword(),

        ///
        '/add_user': (context) => AddUser(),
        '/update_user': (context) => UpdateUser(),
        '/list_users': (context) => ListUsers(),
        '/user_settings': (context) => UserSettings(),

        ///
        '/add_class': (context) => AddClass(),
        '/update_class': (context) => UpdateClass(),
        '/list_classes': (context) => ListClasses(),

        ///
        '/add_section': (context) => AddSection(),
        '/update_section': (context) => UpdateSection(),
        '/list_sections': (context) => ListSections(),

        ///
        '/add_activity': (context) => AddActivity(),
        '/update_activity': (context) => UpdateActivity(),
        '/list_activity': (context) => ListActivities(),
        '/add_activity_to_section': (context) => ActivityToSection(),
        '/update_activity_to_section': (context) => UpdateActivityToSection(),

        ///
        '/list_subject': (context) => ListSubjects(),
        '/add_subject': (context) => AddSubject(),
        '/update_subject': (context) => UpdateSubject(),
        '/subject_to_teacher': (context) => SubjectToTeacher(),

        ///
        '/add_alert': (context) => AddAlert(),
        '/update_alert': (context) => UpdateAlert(),
        '/list_alert': (context) => ListAlerts(),

        ///
        '/list_mark': (context) => ListMarks(),
        '/add_mark': (context) => AddMark(),
        '/update_mark': (context) => UpdateMark(),
        '/add_mark_type': (context) => AddMarkType(),

        ///
        '/add_payment': (context) => AddPayment(),
        '/update_payment': (context) => UpdatePayment(),
        '/list_payment': (context) => ListPayments(),

        ///
        '/add_homework': (context) => AddHomeWork(),
        '/update_homework': (context) => UpdateHomeWork(),
        '/list_homework': (context) => ListHomeWorks(),

        ///
        '/add_programe': (context) => AddPrograme(),
        '/list_programe': (context) => ListPrograme(),

        ///
        '/add_attendance': (context) => AddAttendance(),
        '/list_attendance': (context) => ListAttendance(),
        '/update_attendance': (context) => UpdateAttendance(),

        '/home': (context) => Home(),
      },
      home: Splash(),
    );
  }
}

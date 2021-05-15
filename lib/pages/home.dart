import 'package:flutter/material.dart';
import 'package:management_school/pages/Home%20Work.dart';
import 'package:management_school/pages/LogIn.dart';
import 'package:management_school/pages/Marks.dart';
import 'package:management_school/pages/MyDrawer.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: ('Home'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Center(

            )
          ],
        ),
      ),
      routes: {
        'logout': (context) {
          return LogIn();
        },
        'home': (context) {
          return Home();
        },
        'Home Work':(context){
          return HomeWork();
        },
        'Marks':(context){
          return Marks();
        }

      },
    );
  }
}

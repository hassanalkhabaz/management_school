import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class AddHomeWork extends StatefulWidget {
  @override
  _AddHomeWorkState createState() => _AddHomeWorkState();
}

class _AddHomeWorkState extends State<AddHomeWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add HomeWork'),
        backgroundColor: Colors.indigo[400],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
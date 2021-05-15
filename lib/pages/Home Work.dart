import 'package:flutter/material.dart';
import 'package:management_school/pages/InputField.dart';
import 'package:management_school/pages/InputWrapper.dart';
import 'package:management_school/pages/MyDrawer.dart';

class HomeWork extends StatefulWidget {
  @override
  _HomeWorkState createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home Work'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: DropdownButton<String>(
                value: _chosenValue,
                elevation: 5,
                style: TextStyle(color: Colors.black),

                items: <String>[
                  'First grade',
                  'second grade',
                  'third grade',
                  'fourth grade',
                  'Fifth grade',
                  'Sixth grade'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(
                  "Please choose a grade",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String value) {
                  setState(() {
                    _chosenValue = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: InputField(
                IsPassword: false,
                lableText: "Job content",
                size: 40,
                maxLine: null,
                keyboardtype: TextInputType.multiline,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),

              onPressed: () { },
              child: Text('TextButton'),
            )
          ],
        ),
      ),
    );
  }
}

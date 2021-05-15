import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'InputField.dart';
import 'dart:convert';
import 'MyDrawer.dart';

class Marks extends StatefulWidget {
  @override
  _MarksState createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  String _chosenValue;
  String _chosenValue2;
  TextEditingController controler;


 Future<String> getdata() async{
    var response=await http.get(Uri.encodeFull( 'https://jsonplaceholder.typicode.com/todos/')
    , headers :{
      "acept":"application/json"
    });
    List data =jsonDecode(response.body);
    print(data[1]);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Marks'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                iconEnabledColor: Colors.blue,
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
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                iconEnabledColor: Colors.blue,
                value: _chosenValue2,
                elevation: 5,
                style: TextStyle(color: Colors.black),
                items: <String>[
                  'mohamad hassan alkhabaz',
                  'kamar zahw',
                  'gazal kalel',
                  'lilas alhamwe',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(
                  "Please choose a student",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String value) {
                  setState(() {
                    _chosenValue2 = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50, top: 50),
              child: TextField(
                maxLength: 3, controller: controler,
                decoration: new InputDecoration(
                    labelText: "Enter mark ",
                    counterText: '',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                // Only numbers can be entered
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  getdata();
                },
                child: Text('TextButton'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

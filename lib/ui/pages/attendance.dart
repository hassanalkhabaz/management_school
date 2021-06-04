import 'package:flu/ui/widgets/CardView.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  @override
  AattendanceState createState() => AattendanceState();
}

class AattendanceState extends State<Attendance> {
  double horizontalPadding = 10;
  TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    textStyle = TextStyle(
      fontSize: 20,
      color: Colors.black54,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Attendance'),
        backgroundColor: Colors.cyan[400],
        bottom: buildBottomShape(),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: attendData.length,
          itemBuilder: (context, index) {
            return CardView(
              cardHeader: Text(attendData[index]['date'],
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
              cardBody: buildCardBody(attendData[index]['attendees']),
            );
          },
        ),
      ),
    );
  }

  PreferredSize buildBottomShape() {
    return PreferredSize(
      preferredSize: Size(0, 20),
      child: Container(
        height: 15,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
        ),
      ),
    );
  }

  Widget buildCardBody(int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 10, right: 50),
          title: Text(
            'Attendees',
            style: textStyle,
          ),
          trailing: Text(
            value == 1 ? 'Yes' : 'No',
            style: TextStyle(
              fontSize: 16,
              color: value == 1 ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  //TODO: temp data for testingv
  List attendData = [
    {'date': 'May 1,2021', 'attendees': 1},
    {'date': 'May 2,2021', 'attendees': 0},
    {'date': 'May 3,2021', 'attendees': 1},
    {'date': 'May 4,2021', 'attendees': 0},
    {'date': 'May 5,2021', 'attendees': 0},
    {'date': 'May 6,2021', 'attendees': 1},
    {'date': 'May 7,2021', 'attendees': 1},
  ];
}

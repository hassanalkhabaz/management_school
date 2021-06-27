import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/model/attendance_model.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListAttendance extends StatefulWidget {
  @override
  _ListAttendanceState createState() => _ListAttendanceState();
}

class _ListAttendanceState extends State<ListAttendance> {
  List<AttendanceModel> attendanceData;
  bool _isLoading = true;
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Attendance'),
        backgroundColor: Colors.cyan,
        bottom: buildDropDwonSelectionField(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_attendance');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: !_isLoading
          ? attendanceData != null
              ? Container(
                  child: ListView.separated(
                      padding: EdgeInsets.all(10),
                      itemCount: attendanceData.length,
                      separatorBuilder: (context, i) {
                        return Divider(
                          height: 1,
                          thickness: 1.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        return attendanceTile(
                            studentName: 'student name', //fix name from api
                            isAttendees: attendanceData[index].isPresense != 0,
                            date: attendanceData[index].isPresense);
                      }))
              : Center(
                  child: Text('No Attendees Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ListTile attendanceTile(
      {String studentName,
      date,
      bool isAttendees,
      int studentId,
      Function onTap}) {
    return ListTile(
      title: Text(date.toString()),
      subtitle: Text(studentName),
      trailing: isAttendees
          ? Icon(
              Icons.check,
              color: Colors.green,
            )
          : Icon(Icons.close, color: Colors.red),
      onTap: () {
        Navigator.of(context)
            .pushNamed("/update_attendance", arguments: {'id': studentId});
      },
    );
  }

  PreferredSize buildDropDwonSelectionField() {
    double verticalSpacing = 40;
    double horizontalPadding = 10;
    double verticalPadding = 10;
    return PreferredSize(
      preferredSize: Size(0, verticalSpacing * (3.4)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(children: <Widget>[
          FormBuilder(
            key: _formKey,
            child: Column(children: [
              DropDownField(
                //TODO:init values
                hint: 'Select Class',
                items: ['student', 'teacher', 'manager'],
                onChange: (val) {
                  setState(() {});
                },
              ),
              SizedBox(
                height: 10,
              ),
              DropDownField(
                //TODO:init values
                hint: 'Select Section',
                items: ['section1', 'section2'],
                onChange: (val) {
                  setState(() {});
                },
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

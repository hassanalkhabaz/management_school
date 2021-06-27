import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/model/activity_model.dart';
import 'package:management_school/model/mark_model.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/dialog.dart';

class ListMarks extends StatefulWidget {
  @override
  _ListMarksState createState() => _ListMarksState();
}

class _ListMarksState extends State<ListMarks> {
  List<MarkModel> marksData;
  bool _isLoading = true;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    fetchActivitiesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Marks'),
        backgroundColor: Colors.cyan,
        bottom: buildDropDwonSelectionField(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_mark');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: !_isLoading
          ? marksData != null
              ? Container(
                  child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    itemCount: marksData.length,
                    separatorBuilder: (context, i) {
                      return Divider(
                        height: 10,
                        thickness: 1.5,
                      );
                    },
                    itemBuilder: (context, index) {
                      return markTile(
                        marksData[index],
                        onTap: () {
                          Navigator.of(context).pushNamed('/update_mark');
                        },
                        onLongPress: () async {
                          await dialog(context, onPressed: () {});
                        },
                      );
                    },
                  ),
                )
              : Center(
                  child: Text('No Marks Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

/////
  var fakeData = ActivityModel(
      description: "description here",
      id: 1,
      endDate: DateTime.now(),
      startDate: DateTime.now());
  ////
  Widget markTile(MarkModel mark, {onTap, onLongPress}) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPress,
      title: Text("Mark type: ${mark.markTypeName}"),
      subtitle: Text(
        "Mark: ${mark.degree}",
        style: TextStyle(color: Colors.cyan[300]),
      ),
    );
  }

  PreferredSize buildDropDwonSelectionField() {
    double verticalSpacing = 40;
    double horizontalPadding = 10;
    double verticalPadding = 10;
    return PreferredSize(
      preferredSize: Size(0, verticalSpacing * 6),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(children: <Widget>[
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  DropDownField(
                      //TODO:init values
                      hint: 'Select Class',
                      items: ['class1', 'class2', 'class3'],
                      onChange: (val) {}),
                  SizedBox(
                    height: 10,
                  ),
                  DropDownField(
                      //TODO:init values
                      hint: 'Select Section',
                      items: ['Section1', 'Section2', 'Section3'],
                      onChange: (val) {}),
                  SizedBox(
                    height: 10,
                  ),
                  DropDownField(
                      //TODO:init values
                      hint: 'Select Subject',
                      items: ['subject1', 'subject2', 'subject3'],
                      onChange: (val) {}),
                  SizedBox(
                    height: 10,
                  ),
                  DropDownField(
                      //TODO:init values
                      hint: 'Select Student',
                      items: ['Student1', 'Student2', 'Student3'],
                      onChange: (val) {}),
                ],
              ))
        ]),
      ),
    );
  }

// Secreen Logic
  void fetchActivitiesData() async {
    final data = await ApiHelper().listMarks();
    setState(() {
      marksData = data;
      _isLoading = false;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/model/alarm_model.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListAlerts extends StatefulWidget {
  @override
  _ListAlertsState createState() => _ListAlertsState();
}

class _ListAlertsState extends State<ListAlerts> {
  List<AlarmModel> alertData;
  bool _isLoading = true;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    fetchAlertsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Alerts'),
        backgroundColor: Colors.cyan,
        bottom: buildDropDwonSelectionField(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_alert');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: !_isLoading
          ? alertData != null
              ? Container(
                  child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    itemCount: 3,
                    separatorBuilder: (context, i) {
                      return Divider(height: 1, thickness: 1.5);
                    },
                    itemBuilder: (context, index) {
                      return alertTile(alertData[index], onTap: () {
                        Navigator.of(context).pushNamed('/update_alert');
                      });
                    },
                  ),
                )
              : Center(
                  child: Text('No Alerts Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ListTile alertTile(AlarmModel alert, {onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(alert.date.toString()),
      subtitle: Text(
        "Reason: ${alert.alarmReason}",
        style: TextStyle(color: Colors.cyan[300]),
      ),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  PreferredSize buildDropDwonSelectionField() {
    double verticalSpacing = 40;
    double horizontalPadding = 10;
    double verticalPadding = 10;
    return PreferredSize(
      preferredSize: Size(0, verticalSpacing * 5),
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
  void fetchAlertsData() async {
    final data = await ApiHelper().listAlarms();
    setState(() {
      alertData = data;
      _isLoading = false;
    });
  }
}

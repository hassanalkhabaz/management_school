import 'package:flutter/material.dart';
import 'package:management_school/model/activity_with_section_model.dart';

class ListActivityWithSection extends StatefulWidget {
  @override
  _ListActivityWithSectionState createState() =>
      _ListActivityWithSectionState();
}

class _ListActivityWithSectionState extends State<ListActivityWithSection> {
  List<ActivityWithSectionModel> data;
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('All Attendance'),
          backgroundColor: Colors.cyan,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.of(context).pop(),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_activity_to_section');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
      body: !_isLoading
          ? data != null
              ? Container(
                  child: ListView.separated(
                      padding: EdgeInsets.all(10),
                      itemCount: data.length,
                      separatorBuilder: (context, i) {
                        return Divider(
                          height: 1,
                          thickness: 1.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        return tile(
                            activityName: 'activity name', //fix name from api
                            sectionName: 'section name',
                            id: data[index].id // fix name from api
                            );
                      }))
              : Center(
                  child: Text('No Activities to Sections Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ListTile tile(
      {String activityName, String sectionName, int id, Function onTap}) {
    return ListTile(
      title: Text(activityName),
      subtitle: Text(sectionName),
      onTap: () {
        Navigator.of(context)
            .pushNamed("/update_activity_to_section", arguments: {'id': id});
      },
    );
  }
}

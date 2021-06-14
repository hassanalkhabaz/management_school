import 'package:flutter/material.dart';
import 'package:management_school/model/activity_model.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/dialog.dart';

class ListActivities extends StatefulWidget {
  @override
  _ListActivitiesState createState() => _ListActivitiesState();
}

class _ListActivitiesState extends State<ListActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Activities'),
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/activity_to_section');
              },
              color: Colors.indigo[300],
              icon: Icon(Icons.more_vert_sharp),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add_activity');
              },
              backgroundColor: Colors.indigo,
              child: Icon(Icons.add),
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: 3,
          separatorBuilder: (context, i) {
            return Divider(
              height: 10,
              thickness: 1.5,
            );
          },
          itemBuilder: (context, index) {
            return activityTile(
              fakeData,
              onTap: () {
                Navigator.of(context).pushNamed('/update_activity');
              },
              onLongPress: () async {
                await dialog(context, onPressed: () {});
              },
            );
          },
        ));
  }

/////
  var fakeData = ActivityModel(
      description: "description here",
      id: 1,
      endDate: DateTime.now(),
      startDate: DateTime.now());
  ////
  Widget activityTile(ActivityModel activity, {onTap, onLongPress}) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPress,
      title: Text("Id: ${activity.id}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Type: ${activity.typeOf}",
            style: TextStyle(color: Colors.indigo[300]),
          ),
          Text("Description: ${activity.description}"),
          Text("Begin date: ${activity.startDate}"),
          Text("End date: ${activity.endDate}"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListActivity extends StatefulWidget {
  @override
  _ListActivityState createState() => _ListActivityState();
}

class _ListActivityState extends State<ListActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Activities'),
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add_activity');
          },
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add),
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
              beginDate: 'date',
              endDate: 'date',
              description: 'date',
              type: 'date',
            );
          },
        ));
  }

  Widget activityTile({String beginDate, String endDate, String description, String type}) {
    return ListTile(
      title: Text("Begin date: $beginDate"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Type: $type"),
          Text("Description: $description"),
          Text("End date: $endDate"),
        ],
      ),
    );
  }
}

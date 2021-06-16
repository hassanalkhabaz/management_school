import 'package:flutter/material.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListHomeWorks extends StatefulWidget {
  @override
  _ListHomeWorksState createState() => _ListHomeWorksState();
}

class _ListHomeWorksState extends State<ListHomeWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Homeworks'),
          backgroundColor: Colors.cyan,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add_homework');
          },
          backgroundColor: Colors.cyan,
          child: Icon(Icons.add),
        ),
        drawer: MyDrawer(),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemCount: 3,
            separatorBuilder: (context, i) {
              return Divider(height: 20, thickness: 1.5);
            },
            itemBuilder: (context, index) {
              return homeworkTile(
                  description: 'description',
                  createdOn: "lala",
                  endDate: "lala",
                  onTap: () {
                    Navigator.of(context).pushNamed('/update_homework');
                  });
            }));
  }

  ListTile homeworkTile(
      {String description, String createdOn, String endDate, onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(createdOn),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text(
            "Description: $description",
            style: TextStyle(color: Colors.cyan[300]),
          ),
          Text(
            "End date: $endDate",
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.cyan[300]),
          ),
        ],
      ),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

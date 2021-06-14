import 'package:flutter/material.dart';
import 'package:management_school/model/subject_model.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListSubjects extends StatefulWidget {
  @override
  _ListSubjectsState createState() => _ListSubjectsState();
}

class _ListSubjectsState extends State<ListSubjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Subjects'),
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/subject_to_teacher');
              },
              color: Colors.indigo[300],
              icon: Icon(Icons.more_vert_sharp),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add_subject');
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
            return subjectTile(fakeData);
          },
        ));
  }

  /////
  var fakeData = SubjectModel(id: 1, name: "subjest name");
  ////
  Widget subjectTile(SubjectModel subject) {
    return ListTile(
      title: Text("Id: ${subject.id}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name: ${subject.name}"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/model/subject_model.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListSubjects extends StatefulWidget {
  @override
  _ListSubjectsState createState() => _ListSubjectsState();
}

class _ListSubjectsState extends State<ListSubjects> {
  List<SubjectModel> subjectsData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSubjectsData();
  }

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
      body: !_isLoading
          ? subjectsData != null
              ? Container(
                  child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemCount: subjectsData.length,
                  separatorBuilder: (context, i) {
                    return Divider(
                      height: 10,
                      thickness: 1.5,
                    );
                  },
                  itemBuilder: (context, index) {
                    return subjectTile(
                      subjectsData[index],
                      onTap: () {
                        Navigator.of(context).pushNamed('/update_subject');
                      },
                    );
                  },
                ))
              : Center(
                  child: Text('No Subjects Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ////
  Widget subjectTile(SubjectModel subject, {onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text("Id: ${subject.id}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name: ${subject.name}"),
        ],
      ),
    );
  }

  // Secreen Logic
  void fetchSubjectsData() async {
    final data = await ApiHelper().listSubjects();
    setState(() {
      subjectsData = data;
      _isLoading = false;
    });
  }
}

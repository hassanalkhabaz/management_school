import 'package:flutter/material.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/model/class_model.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListClasses extends StatefulWidget {
  @override
  _ListClassesState createState() => _ListClassesState();
}

class _ListClassesState extends State<ListClasses> {
  List<ClassModel> classesData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchClassesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Classses'),
          backgroundColor: Colors.cyan,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add_class');
          },
          backgroundColor: Colors.cyan,
          child: Icon(Icons.add),
        ),
        drawer: MyDrawer(),
        body: !_isLoading
            ? classesData != null
                ? Container(
                    child: ListView.separated(
                        padding: EdgeInsets.all(10),
                        itemCount: 3,
                        separatorBuilder: (context, i) {
                          return Divider(height: 1, thickness: 1.5);
                        },
                        itemBuilder: (context, index) {
                          return classTile(
                              name: classesData[index].name,
                              totalFees:
                                  classesData[index].totalFees.toString(),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/update_class');
                              });
                        }))
                : Center(
                    child: Text('No Classes Found'),
                  )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  ListTile classTile({String name, String totalFees, onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(name),
      subtitle: Text(
        totalFees,
        style: TextStyle(color: Colors.cyan[300]),
      ),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  
  // Secreen Logic
  void fetchClassesData() async {
    final data = await ApiHelper().listClasses();
    setState(() {
      classesData = data;
      _isLoading = false;
    });
  }
}

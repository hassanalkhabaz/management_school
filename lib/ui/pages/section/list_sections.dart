import 'package:flutter/material.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/model/section_model.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListSections extends StatefulWidget {
  @override
  _ListSectionsState createState() => _ListSectionsState();
}

class _ListSectionsState extends State<ListSections> {
  List<SectionModel> sectionsData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchActivitiesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Sections'),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_section');
        },
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: !_isLoading
          ? sectionsData != null
              ? Container(
                  child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    itemCount: sectionsData.length,
                    separatorBuilder: (context, i) {
                      return Divider(height: 1, thickness: 1.5);
                    },
                    itemBuilder: (context, index) {
                      return sectionTile(name: sectionsData[index].name);
                    },
                  ),
                )
              : Center(
                  child: Text('No Sections Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ListTile sectionTile({String name}) {
    return ListTile(
      title: Text(name),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }

// Secreen Logic
  void fetchActivitiesData() async {
    final data = await ApiHelper().listSections();
    setState(() {
      sectionsData = data;
      _isLoading = false;
    });
  }
}

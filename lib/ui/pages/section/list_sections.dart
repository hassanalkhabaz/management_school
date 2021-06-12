import 'package:flutter/material.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListSections extends StatefulWidget {
  @override
  _ListSectionsState createState() => _ListSectionsState();
}

class _ListSectionsState extends State<ListSections> {
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
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: 3,
        separatorBuilder: (context, i) {
          return Divider(height: 1, thickness: 1.5);
        },
        itemBuilder: (context, index) {
          return sectionTile(name: 'Section name');
        },
      ),
    );
  }

  ListTile sectionTile({String name}) {
    return ListTile(
      title: Text(name),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListClasses extends StatefulWidget {
  @override
  _ListClassesState createState() => _ListClassesState();
}

class _ListClassesState extends State<ListClasses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Classses'),
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add_class');
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
              return classTile(
                  name: 'Class name',
                  totalFees: 'fees',
                  onTap: () {
                    Navigator.of(context).pushNamed('/update_class');
                  });
            }));
  }

  ListTile classTile({String name, String totalFees, onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(name),
      subtitle: Text(
        totalFees,
        style: TextStyle(color: Colors.indigo[300]),
      ),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

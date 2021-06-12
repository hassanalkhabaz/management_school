import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Users'),
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add_user');
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
                height: 1,
                thickness: 1.5,
              );
            },
            itemBuilder: (context, index) {
              return userTile(name: 'User name', type: 'Type');
            }));
  }

  ListTile userTile({String name, String type, id, Function onTap}) {
    return ListTile(
      title: Text(name),
      subtitle: Text(
        type,
        style: TextStyle(color: Colors.indigo[300]),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context)
            .pushNamed("/user_settings", arguments: {'name': name, 'id': id});
      },
    );
  }
}

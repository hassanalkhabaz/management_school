import 'package:flutter/material.dart';
import 'package:management_school/pages/LogIn.dart';

class MyDrawer extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    // TODO: implement build

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('hassan'),
            accountEmail: (Text('hassan@gmail.com ')),
            currentAccountPicture: (CircleAvatar(
              child: Icon(Icons.person),
            )),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {Navigator.of(context).pushNamed('home');},
          ),
          ListTile(
            title: Text('Home Works'),
            leading: Icon(IconData(0xe9a8, fontFamily: 'MaterialIcons')),
            onTap: () {Navigator.of(context).pushNamed('Home Work');},
          ),
          ListTile(
            title: Text('Marks'),
            leading: (Icon(Icons.bookmarks)),
            onTap: () {Navigator.of(context).pushNamed('Marks');},
          ),
          ListTile(
            title: Text('Notifications'),
            leading: Icon(Icons.notification_important),
            onTap: () {},
          ),
          ListTile(
            title: Text('Programs'),
            leading: Icon(Icons.photo_rounded),
            onTap: () {},
          ),
          Divider(height: 25, thickness: 2),
          ListTile(
            title: Text('profile'),
            leading: Icon(Icons.person),
            onTap: () {Navigator.of(context).pushNamed('change_password');},
          ),
          ListTile(
            title: Text('logout'),
            leading: Icon(Icons.logout),
            onTap: () {Navigator.of(context).pushNamed('logout');},
          )
        ],
      ),
    );
  }
}

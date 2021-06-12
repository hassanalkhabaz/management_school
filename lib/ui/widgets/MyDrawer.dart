import 'package:flutter/material.dart';
import 'package:management_school/ui/pages/LogIn.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            onDetailsPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
            accountName: Text('hassan'),
            accountEmail: (Text('hassan@gmail.com ')),
            currentAccountPicture: (CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person),
            )),
            decoration: BoxDecoration(
              color: Colors.indigo[400],
            ),
          ),

          ///
          ///
          buildListTile(
              icon: Icon(Icons.home),
              title: 'Home',
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              }),
          buildListTile(
              icon: Icon(Icons.group),
              title: 'Users',
              onTap: () {
                Navigator.of(context).pushNamed('/list_user');
              }),

          buildListTile(
              icon: Icon(Icons.class_),
              title: 'Classes',
              onTap: () {
                Navigator.of(context).pushNamed('/add_class');
              }),
          buildListTile(
              icon: Icon(Icons.business_outlined),
              title: 'Sections',
              onTap: () {
                Navigator.of(context).pushNamed('/add_section');
              }),
          buildListTile(
              icon: Icon(Icons.subject),
              title: 'Subjects',
              onTap: () {
                Navigator.of(context).pushNamed('/add_subject');
              }),
          buildListTile(
              icon: Icon(Icons.contact_page),
              title: 'Activities',
              onTap: () {
                Navigator.of(context).pushNamed('/add_activity');
              }),
          buildListTile(
              icon: Icon(Icons.home_work),
              title: 'HomeWorks',
              onTap: () {
                Navigator.of(context).pushNamed('/add_homework');
              }),
          buildListTile(
              icon: Icon(Icons.rate_review),
              title: 'Marks',
              onTap: () {
                Navigator.of(context).pushNamed('/add_mark');
              }),
          buildListTile(
              icon: Icon(Icons.calendar_today),
              title: 'Programe',
              onTap: () {
                Navigator.of(context).pushNamed('/add_programe');
              }),
        ],
      ),
    );
  }

  ListTile buildListTile({title, icon, onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.grey[800]),
      ),
      leading: icon,
      onTap: onTap,
    );
  }
}

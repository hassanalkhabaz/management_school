import 'package:flutter/material.dart';

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
            
            decoration: BoxDecoration(
              color: Colors.cyan[400],
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
                Navigator.of(context).pushNamed('/list_users');
              }),

          buildListTile(
              icon: Icon(Icons.class_),
              title: 'Classes',
              onTap: () {
                Navigator.of(context).pushNamed('/list_classes');
              }),
          buildListTile(
              icon: Icon(Icons.business_outlined),
              title: 'Sections',
              onTap: () {
                Navigator.of(context).pushNamed('/list_sections');
              }),
          buildListTile(
              icon: Icon(Icons.subject),
              title: 'Subjects',
              onTap: () {
                Navigator.of(context).pushNamed('/list_subject');
              }),
          buildListTile(
              icon: Icon(Icons.check),
              title: 'Attendance',
              onTap: () {
                Navigator.of(context).pushNamed('/attendance');
              }),
          buildListTile(
              icon: Icon(Icons.warning_amber_rounded),
              title: 'Alerts',
              onTap: () {
                Navigator.of(context).pushNamed('/list_alert');
              }),
          buildListTile(
              icon: Icon(Icons.contact_page),
              title: 'Activities',
              onTap: () {
                Navigator.of(context).pushNamed('/list_activity');
              }),
          buildListTile(
              icon: Icon(Icons.home_work),
              title: 'HomeWorks',
              onTap: () {
                Navigator.of(context).pushNamed('/list_homework');
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
          buildListTile(
              icon: Icon(Icons.monetization_on_outlined),
              title: 'Payments',
              onTap: () {
                Navigator.of(context).pushNamed('/list_payment');
              }),
          Divider(height: 10, thickness: 1.5),
          buildListTile(
              icon: Icon(Icons.power_settings_new),
              title: 'Logout',
              onTap: () {
                Navigator.of(context).pushNamed('/login');
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

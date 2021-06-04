import 'package:flutter/material.dart';
import 'package:flu/ui/pages/LogIn.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            onDetailsPressed: (){Navigator.of(context).pushNamed('/profile');},
            accountName: Text('hassan'),
            accountEmail: (Text('hassan@gmail.com ')),
            currentAccountPicture: (CircleAvatar(
              backgroundColor: Colors.cyan[600],
              child: Icon(Icons.person),
            )),
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
              icon: Icon(Icons.school),
              title: 'Homeworks',
              onTap: () {
                Navigator.of(context).pushNamed('/homeworks');
              }),

          buildListTile(
              icon: Icon(Icons.warning_amber_rounded),
              title: 'Alerts',
              onTap: () {
                Navigator.of(context).pushNamed('/alerts');
              }),

          buildListTile(
              icon: Icon(Icons.attach_money_rounded),
              title: 'Payments',
              onTap: () {
                Navigator.of(context).pushNamed('/payments');
              }),

          buildListTile(
              icon: Icon(Icons.check),
              title: 'Attendance',
              onTap: () {
                Navigator.of(context).pushNamed('/attendance');
              }),
          buildListTile(
            title: 'Marks',
            icon: Icon(Icons.bookmarks),
            onTap: () {
              Navigator.of(context).pushNamed('/marks');
            },
          ),
          buildListTile(
            title: 'Notifications',
            icon: Icon(Icons.notification_important),
            onTap: () {
              Navigator.of(context).pushNamed('/notifications');
            },
          ),
          buildListTile(
            title: 'Programs',
            icon: Icon(Icons.photo_rounded),
            onTap: () {
              Navigator.of(context).pushNamed('/programs');
            },
          ),
          Divider(height: 25, thickness: 2),
          // buildListTile(
          //   title: 'profile',
          //   icon: Icon(Icons.person),
          //   onTap: () {},
          // ),
          buildListTile(
            title: 'logout',
            icon: Icon(Icons.logout),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
          )
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

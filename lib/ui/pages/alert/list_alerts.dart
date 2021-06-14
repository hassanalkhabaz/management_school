import 'package:flutter/material.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListAlerts extends StatefulWidget {
  @override
  _ListAlertsState createState() => _ListAlertsState();
}

class _ListAlertsState extends State<ListAlerts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Alerts'),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_alert');
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
          return alertTile(alertReason: 'reason', date: '12-06-2021');
        },
      ),
    );
  }

  ListTile alertTile({String alertReason, String date}) {
    return ListTile(
      title: Text(date),
      subtitle: Text(
        "Reason: $alertReason",
        style: TextStyle(color: Colors.indigo[300]),
      ),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

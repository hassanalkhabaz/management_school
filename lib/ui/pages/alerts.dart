import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  bool _isLoading = true;
  TextStyle textStyle;
  double horizontalPadding = 10;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textStyle = TextStyle(
      fontSize: 20,
      color: Colors.black54,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Alerts'),
        backgroundColor: Colors.cyan[400],
        bottom: buildBottomShape(),
      ),
      body: Container()
    );
  }

  PreferredSize buildBottomShape() {
    return PreferredSize(
      preferredSize: Size(0, 20),
      child: Container(
        height: 15,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
        ),
      ),
    );
  }

  Widget buildCardBody(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Reason of the Alert',
            style: textStyle,
          ),
          subtitle: Text(
            description,
            style: TextStyle(height: 2),
          ),
        ),
      ],
    );
  }


}

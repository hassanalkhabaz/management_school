import 'package:flu/api/api_helper.dart';
import 'package:flu/model/alert_model.dart';
import 'package:flu/ui/widgets/CardView.dart';
import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  bool _isLoading = true;
  List<AlertModel> alertList = [];
  TextStyle textStyle;
  double horizontalPadding = 10;

  @override
  void initState() {
    super.initState();
    fetchAlertsData();
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
      body: !_isLoading
          ? alertList != null
              ? Container(
                  child: ListView.builder(
                    itemCount: alertList.length,
                    itemBuilder: (context, index) {
                      return CardView(
                        cardHeader: Text(alertList[index].date.toString(),
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                        cardBody: buildCardBody(alertList[index].reason),
                      );
                    },
                  ),
                )
              : Center(
                  child: Text('No Alerts Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
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

// Secreen Logic
  void fetchAlertsData() async {
    final data = await ApiHelper().getAlerts(1);
    setState(() {
      alertList = data;
      _isLoading = false;
    });
  }
}

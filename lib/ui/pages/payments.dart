import 'package:flu/ui/widgets/CardView.dart';
import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  double horizontalPadding = 10;
  TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    textStyle = TextStyle(
      fontSize: 20,
      color: Colors.black54,
    );

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Payments'),
          backgroundColor: Colors.cyan[400],
          bottom: buildBottomShape(),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: payData.length,
                itemBuilder: (context, index) {
                  return CardView(
                    cardHeader: Text(
                      payData[index]['date'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    cardBody: buildCardBody(
                      payData[index]['paid'],
                      payData[index]['remain'],
                    ),
                  );
                })));
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

  Widget buildCardBody(String paid, String remain) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          title: Text('Paid Amount', style: textStyle),
          trailing: Text(
            paid,
            style: textStyle.copyWith(color: Colors.green),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          title: Text('Remaining amount', style: textStyle),
          trailing: Text(
            remain,
            style: textStyle.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }

  //TODO: temp data for testing
  List payData = [
    {'date': 'May 2,2021', 'paid': '1200 S.P', 'remain': '300 S.P'},
    {'date': 'May 2,2021', 'paid': '1200 S.P', 'remain': '300 S.P'},
    {'date': 'May 2,2021', 'paid': '1200 S.P', 'remain': '300 S.P'},
    {'date': 'May 2,2021', 'paid': '1200 S.P', 'remain': '300 S.P'},
    {'date': 'May 2,2021', 'paid': '1200 S.P', 'remain': '300 S.P'},
    {'date': 'May 2,2021', 'paid': '1200 S.P', 'remain': '300 S.P'},
    {'date': 'May 2,2021', 'paid': '1200 S.P', 'remain': '300 S.P'},
  ];
}

import 'package:flutter/material.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListPayments extends StatefulWidget {
  @override
  _ListPaymentsState createState() => _ListPaymentsState();
}

class _ListPaymentsState extends State<ListPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Payments'),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_payment');
        },
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: 3,
        separatorBuilder: (context, i) {
          return Divider(height: 20, thickness: 1.5);
        },
        itemBuilder: (context, index) {
          return paymentTile(
              paidFees: '200000', unPaidFees: '30000', paidDate: '12-06-2021');
        },
      ),
    );
  }

  ListTile paymentTile({String paidFees, String unPaidFees, String paidDate}) {
    return ListTile(
      title: Text(paidDate),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text(
            "Paid Fees: $paidFees",
            style: TextStyle(color: Colors.indigo[300]),
          ),
          Text(
            "Unpaid Fees: $unPaidFees",
            style: TextStyle(color: Colors.indigo[300]),
          ),
        ],
      ),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

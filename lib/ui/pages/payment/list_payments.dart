import 'package:flutter/material.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/model/payment_model.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListPayments extends StatefulWidget {
  @override
  _ListPaymentsState createState() => _ListPaymentsState();
}

class _ListPaymentsState extends State<ListPayments> {
  List<PaymentModel> paymentsData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPaymentsData();
  }

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
      body: !_isLoading
          ? paymentsData != null
              ? Container(
                  child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    itemCount: 3,
                    separatorBuilder: (context, i) {
                      return Divider(height: 20, thickness: 1.5);
                    },
                    itemBuilder: (context, index) {
                      return paymentTile(
                        paidFees: paymentsData[index].paidFees.toString(),
                        unPaidFees: paymentsData[index].unPaidFees.toString(),
                        paidDate: paymentsData[index].paidDate.toString(),
                        onTap: () {
                          Navigator.of(context).pushNamed('/update_payment');
                        },
                      );
                    },
                  ),
                )
              : Center(
                  child: Text('No Payments Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ListTile paymentTile(
      {String paidFees, String unPaidFees, String paidDate, onTap}) {
    return ListTile(
      onTap: onTap,
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

  Future<void> fetchPaymentsData() async {
    final data = await ApiHelper().listPayment();
    setState(() {
      paymentsData = data;
      _isLoading = false;
    });
  }
}

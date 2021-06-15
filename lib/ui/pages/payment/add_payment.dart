import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddPayment extends StatefulWidget {
  @override
  _AddPaymentState createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Add Payment'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                textField(
                  context,
                  label: "Paid",
                  name: "paid",
                  hint: "add a payment",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Section",
                  items: ['section1'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Student",
                  items: ['student'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                !_isLoading
                    ? CustomButton(
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createPayment(
                              userId: userId,
                              paidFees: _formKey.currentState.fields['paid'],
                            );
                          }
                        },
                        title: 'Add Payment')
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createPayment({userId, paidFees}) {
    _isLoading = true;
    ApiHelper().createPayment(userId: userId, paidFees: paidFees).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }
}

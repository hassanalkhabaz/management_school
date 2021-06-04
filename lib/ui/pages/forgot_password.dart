import 'package:flu/ui/widgets/InputField.dart';
import 'package:flutter/material.dart';
import 'package:flu/ui/widgets/MyDrawer.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('change your password'),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: InputField(isPassword: false,
                    lableText: "Enter your user name",
                    hintText: "user name ",
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(vertical: 70),
                decoration: BoxDecoration(
                  color: Colors.cyan[500],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                  child: InputField(isPassword: true,
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                    ),
                    hintText: "Enter your Old password",
                    lableText: "Old password",

                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.cyan[500],
                    borderRadius: BorderRadius.circular(20),
                  )),
              SizedBox(
                height: 60,
              ),
              Container(
                child: FlatButton(
                  child: Text('send'),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('change_password_after_valudation');
                  },
                  color: Colors.cyan,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

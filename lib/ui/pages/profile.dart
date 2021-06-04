import 'package:flu/ui/widgets/InputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flu/ui/widgets/MyDrawer.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('change your password'),
        ),
        drawer: MyDrawer(),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: InputField(lableText:  "new password",icon: Icon(Icons.vpn_key),isPassword: true,),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              margin: EdgeInsets.symmetric(vertical: 70),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(29),
              ),
            ),
            Container(
                child: InputField(lableText:  "confirm your password",icon: Icon(Icons.vpn_key),isPassword: true,),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(29),
                )),
            SizedBox(
              height: 60,
            ),
            Container(
              child: FlatButton(
                child: Text('save'),
                onPressed: () {},
                color: Colors.cyan,
              ),
            )
          ],
        ),
      )),
    );
  }
}

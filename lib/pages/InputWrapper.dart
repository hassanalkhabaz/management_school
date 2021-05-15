import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'InputField.dart';
import 'button.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  child: InputField(IsPassword: false,
                    icon: Icon(
                      Icons.person,
                  color: Colors.cyan,  ),
                    lableText: "User Name",
                  ),
                ),
                SizedBox(height: 15,),
                InputField(IsPassword: true,
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.cyan,
                  ),
                  lableText: "password",
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'forget password ?',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 40,
          ),
          Button(),
        ],
      ),
    );
  }
}

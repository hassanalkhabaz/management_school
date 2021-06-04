import 'package:flu/ui/widgets/DropDownField.dart';
import 'package:flutter/material.dart';
import 'package:flu/ui/widgets/MyDrawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Homeworks extends StatefulWidget {
  @override
  _HomeworksState createState() => _HomeworksState();
}

class _HomeworksState extends State<Homeworks> {
  final _formKey = GlobalKey<FormBuilderState>();
  double verticalSpacing = 40;
  double horizontalPadding = 10;
  double verticalPadding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('home works'),
        backgroundColor: Colors.cyan[400],
        bottom: buildDropDwonSelectionField(),
      ),
      body: Container(),
    );
  }

  PreferredSize buildDropDwonSelectionField() {
    return PreferredSize(
      preferredSize: Size(0, verticalSpacing * 1.5),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(children: <Widget>[
          FormBuilder(
            key: _formKey,
            child: Column(children: [
              DropDownField(
                //TODO:init values
                items: ['sd', 'sdf'],
                onChange: (fd) {},
              )
            ]),
          )
        ]),
      ),
    );
  }
}

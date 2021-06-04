import 'package:flu/ui/widgets/DropDownField.dart';
import 'package:flutter/material.dart';
import 'package:flu/ui/widgets/MyDrawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Marks extends StatefulWidget {
  @override
  _MarksState createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  final _formKey = GlobalKey<FormBuilderState>();
  double verticalSpacing = 40;
  double horizontalPadding = 10;
  double verticalPadding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('marks'),
        backgroundColor: Colors.cyan[400],
        bottom: buildDropDwonSelectionField(),
      ),
      body: Center(
        child: Text('Mark is 20'),
      ),
    );
  }

  PreferredSize buildDropDwonSelectionField() {
    return PreferredSize(
      preferredSize: Size(0, verticalSpacing * 3),
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
                items: ['arabic', 'math'],
                onChange: (fd) {},
              ),
              SizedBox(height: horizontalPadding),
              DropDownField(
                //TODO:init values
                items: ['mid', 'final'],
                onChange: (fd) {},
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

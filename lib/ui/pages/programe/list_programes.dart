import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/model/programe_model.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListPrograme extends StatefulWidget {
  @override
  _ListProgrameState createState() => _ListProgrameState();
}

class _ListProgrameState extends State<ListPrograme> {
  List<ProgrameModel> programeData;
  final _formKey = GlobalKey<FormBuilderState>();

  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Attendance'),
        backgroundColor: Colors.cyan,
        bottom: buildDropDwonSelectionField(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_programe');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: !_isLoading
          ? programeData != null
              ? Container(
                  child: ListView.separated(
                      padding: EdgeInsets.all(10),
                      itemCount: programeData.length,
                      separatorBuilder: (context, i) {
                        return Divider(
                          height: 1,
                          thickness: 1.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        return programeTile(
                          name: 'student name',
                        );
                      }))
              : Center(
                  child: Text('No Programes Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ListTile programeTile({String name, Function onTap}) {
    return ListTile(
      title: Text(name),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        Navigator.of(context).pushNamed("/update_programe");
      },
    );
  }

  PreferredSize buildDropDwonSelectionField() {
    double verticalSpacing = 40;
    double horizontalPadding = 10;
    double verticalPadding = 10;
    return PreferredSize(
      preferredSize: Size(0, verticalSpacing * (3.4)),
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
                hint: 'Select Class',
                items: ['student', 'teacher', 'manager'],
                onChange: (val) {
                  setState(() {});
                },
              ),
              SizedBox(
                height: 10,
              ),
              DropDownField(
                //TODO:init values
                hint: 'Select Section',
                items: ['section1', 'section2'],
                onChange: (val) {
                  setState(() {});
                },
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

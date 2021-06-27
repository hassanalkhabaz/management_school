import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/model/user_model.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List<UserModel> usersData;
  bool _isLoading = true;
  final _formKey = GlobalKey<FormBuilderState>();

  bool _show = false;

  @override
  void initState() {
    super.initState();
    fetchUSersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
        backgroundColor: Colors.cyan,
        bottom: buildDropDwonSelectionField(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_user');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: !_isLoading
          ? usersData != null
              ? Container(
                  child: ListView.separated(
                      padding: EdgeInsets.all(10),
                      itemCount: usersData.length,
                      separatorBuilder: (context, i) {
                        return Divider(
                          height: 1,
                          thickness: 1.5,
                        );
                      },
                      itemBuilder: (context, index) {
                        return userTile(
                            name: usersData[index].userName,
                            type: usersData[index].type);
                      }))
              : Center(
                  child: Text('No Users Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ListTile userTile({String name, String type, id, Function onTap}) {
    return ListTile(
      title: Text(name),
      subtitle: Text(
        type,
        style: TextStyle(color: Colors.cyan[300]),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context)
            .pushNamed("/user_settings", arguments: {'name': name, 'id': id});
      },
    );
  }

  PreferredSize buildDropDwonSelectionField() {
    double verticalSpacing = 40;
    double horizontalPadding = 10;
    double verticalPadding = 10;
    return PreferredSize(
      preferredSize: Size(0, verticalSpacing * (_show? 5 :1.5)),
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
                hint: 'Select Type',
                items: ['student', 'teacher', 'manager'],
                onChange: (val) {
                  setState(() {
                    if (val == 'teacher' || val == 'student')
                      _show = true;
                    else
                      _show = false;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              _show
                  ? Column(
                      children: [
                        DropDownField(
                            //TODO:init values
                            hint: 'Select Class',
                            items: ['class1', 'class2', 'class3'],
                            onChange: (val) {}),
                        SizedBox(
                          height: 10,
                        ),
                        DropDownField(
                            //TODO:init values
                            hint: 'Select Section',
                            items: ['Section1', 'Section2', 'Section3'],
                            onChange: (val) {})
                      ],
                    )
                  : Container(),
            ]),
          )
        ]),
      ),
    );
  }

  // Secreen Logic
  void fetchUSersData() async {
    final data = await ApiHelper().listUsers();
    setState(() {
      usersData = data;
      _isLoading = false;
    });
  }
}

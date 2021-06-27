import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/model/section_model.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';

class ListSections extends StatefulWidget {
  @override
  _ListSectionsState createState() => _ListSectionsState();
}

class _ListSectionsState extends State<ListSections> {
  List<SectionModel> sectionsData;
  bool _isLoading = true;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    fetchActivitiesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Sections'),
        backgroundColor: Colors.cyan,
        bottom: buildDropDwonSelectionField(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_section');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: !_isLoading
          ? sectionsData != null
              ? Container(
                  child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    itemCount: sectionsData.length,
                    separatorBuilder: (context, i) {
                      return Divider(height: 1, thickness: 1.5);
                    },
                    itemBuilder: (context, index) {
                      return sectionTile(
                          name: sectionsData[index].name,
                          onTap: () {
                            Navigator.of(context).pushNamed('/update_section');
                          });
                    },
                  ),
                )
              : Center(
                  child: Text('No Sections Found'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  ListTile sectionTile({String name, onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(name),
      // trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  PreferredSize buildDropDwonSelectionField() {
    double verticalSpacing = 40;
    double horizontalPadding = 10;
    double verticalPadding = 10;
    return PreferredSize(
      preferredSize: Size(0, verticalSpacing * (1.5)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(children: <Widget>[
          FormBuilder(
            key: _formKey,
            child: DropDownField(
              //TODO:init values
              hint: 'Select Class',
              items: ['class1', 'class2', 'class3'],
              onChange: (val) {
                setState(() {
                  // logic
                });
              },
            ),
          )
        ]),
      ),
    );
  }

// Secreen Logic
  void fetchActivitiesData() async {
    final data = await ApiHelper().listSections();
    setState(() {
      sectionsData = data;
      _isLoading = false;
    });
  }
}

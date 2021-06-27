import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/api/api_helper.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management_school/ui/widgets/custom_button.dart';
import 'package:management_school/ui/widgets/fields.dart';

class UpdatePrograme extends StatefulWidget {
  @override
  _UpdateProgrameState createState() => _UpdateProgrameState();
}

class _UpdateProgrameState extends State<UpdatePrograme> {
  final _formKey = GlobalKey<FormBuilderState>();
  File _image;
  bool _isLoading = false;
  final picker = ImagePicker();
  String secId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Programe'),
        backgroundColor: Colors.cyan,
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
                _image != null
                    ? Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: Icon(Icons.close, size: 20),
                          onTap: () {
                            setState(() {
                              _image = null;
                            });
                          },
                        ),
                      )
                    : Container(height: 20),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(.12),
                    radius: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: _image != null
                          ? Image.file(_image)
                          : Icon(
                              Icons.image,
                              color: Colors.cyan[100],
                              size: 50,
                            ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    size: 35,
                    color: Colors.cyan,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  label: "Programe name",
                  name: "programe_name",
                  hint: "add programe name",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  hint: "Class",
                  items: ['Class1', 'Class2', 'Class3'],
                  onChange: (val) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  onChange: (val) {
                    secId = val;
                  },
                  items: ['s1', 's2'],
                  hint: 'Section',
                ),
                SizedBox(height: 20),
                !_isLoading
                    ? CustomButton(
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createPrograme(
                              name:
                                  _formKey.currentState.fields['programe_name'],
                              image: _image,
                              secId: secId,
                            );
                          }
                        },
                        title: 'Update Programe')
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void createPrograme({name, image, secId}) {
    _isLoading = true;
    ApiHelper()
        .createProgramme(name: name, image: image, secId: secId)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }
}

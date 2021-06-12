import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:management_school/ui/widgets/DropDownField.dart';
import 'package:management_school/ui/widgets/MyDrawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management_school/ui/widgets/fields.dart';

class AddPrograme extends StatefulWidget {
  @override
  _AddProgrameState createState() => _AddProgrameState();
}

class _AddProgrameState extends State<AddPrograme> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Programe'),
        backgroundColor: Colors.indigo,
      ),
      drawer: MyDrawer(),
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
                              color: Colors.indigo[100],
                              size: 50,
                            ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    size: 35,
                    color: Colors.indigo,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
                SizedBox(height: 20),
                textField(
                  context,
                  isNote: true,
                  label: "Programe name",
                  name: "programe_name",
                  hint: "add programe name",
                  onChanged: (str) {},
                ),
                SizedBox(height: 20),
                DropDownField(
                  onChange: (val) {},
                  items: ['s1', 's2'],
                  hint: 'Section',
                ),
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
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Model/WidgetProperties.dart';

class TeacherSubmissions extends StatefulWidget {
  const TeacherSubmissions({Key? key}) : super(key: key);

  @override
  State<TeacherSubmissions> createState() => _TeacherSubmissionsState();
}

class _TeacherSubmissionsState extends State<TeacherSubmissions> {
  List<String> _students = ['Student1', 'Student 2', 'Student 3'];
  String _feedback = '';
  List <String> _files = [];

  void _addFile(String fileName) {
    setState(() {
      _files.add(fileName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: _students.map((String student) {
            return Card(
              color: Colors.grey[100],
              child: ExpansionTile(
                title: Text(
                  student,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.blueGrey[800],
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Homework',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                    trailing: Icon(Icons.attach_file),
                    onTap: (){
                      FilePicker.platform.pickFiles().then((result) {
                        if (result != null) {
                          String fileName = result.files.single.name;
                          _addFile(fileName);
                        }
                      });
                    },
                  ),
                  ListTile(
                    title: IconButton(
                      icon: Icon(FontAwesomeIcons.comments),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: TextFormField(
                                maxLines: null,
                                onChanged: (value) {
                                  setState(() {
                                    _feedback = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'Feedback',
                                  hintText: 'Type your feedback here...',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Save',style: TextStyle(color: PageColors.mainColor),),
                                  onPressed: () {

                                    Navigator.of(context).pop();

                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  _feedback.isNotEmpty
                      ? ListTile(
                    title: Text(
                      'Feedback: $_feedback',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey[400],
                      ),
                    ),
                  )
                      : Container(),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

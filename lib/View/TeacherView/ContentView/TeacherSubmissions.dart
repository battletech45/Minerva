import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';
import 'package:path_provider/path_provider.dart';

class TeacherSubmissions extends StatefulWidget {
  final String className;
  const TeacherSubmissions({Key? key, required this.className}) : super(key: key);

  @override
  State<TeacherSubmissions> createState() => _TeacherSubmissionsState();
}

class _TeacherSubmissionsState extends State<TeacherSubmissions> {
  List _students = [];

  Future<void> _downloadFile(String name, String className) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    print(appDocDir.toString());
    File downloadToFile = File('${appDocDir.path}/$name');
    try {
      await FirebaseStorage.instance.ref('$className/submissions/$name').writeToFile(downloadToFile);
      print('downloaded');
    } catch (e) {
      print(e);
    }
  }

  _getSubmissions() async {
    var val = await FirebaseFunctions().getClassData(widget.className);
    setState(() {
      _students = val.docs[0].get('submittedStudents');
    });
    print(_students);
  }

  @override
  void initState() {
    super.initState();
    _getSubmissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _students.length,
            itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[100],
                  child: ExpansionTile(
                    title: Text(
                      _students[index]['studentName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          _students[index]['homeworkName'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.blueGrey[700],
                          ),
                        ),
                        trailing: Icon(Icons.attach_file),
                        onTap: () async {
                          _downloadFile(_students[index]['fileName'], widget.className);
                        },
                      ),
                    ],
                  ),
                );
              }
            )
      ),
    );
  }
}

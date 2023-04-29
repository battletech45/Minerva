import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:path_provider/path_provider.dart';
import '../../../Model/WidgetProperties.dart';

class StudentMaterialPage extends StatefulWidget {
  @override
  State<StudentMaterialPage> createState() => _StudentMaterialPageState();
}

class _StudentMaterialPageState extends State<StudentMaterialPage> {
  
  bool isMaterialExist = false;
  List<String> materialURLs = [];
  List<String> materialName = [];

  _getURLs() async {
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var student = await FirebaseFunctions().getStudentData(email!);
    String? className = await FirebaseFunctions().findStudentsClass(student.docs[0].get('studentID'));
    var val = await FirebaseFunctions().getClassData(className!);
    List data = val.docs[0].get('Materials');
    data.forEach((element) {
      materialURLs.add(element['materialURL']);
      materialName.add(element['pickedFileName']);
    });
    if(materialURLs.isEmpty) {
      setState(() {
        isMaterialExist = false;
      });
    }
    else {
      setState(() {
        isMaterialExist = true;
      });
    }
  }

  Future<void> _downloadFile(String name) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    print(appDocDir.toString());
    File downloadToFile = File('${appDocDir.path}/$name');
    try {
      await FirebaseStorage.instance.ref('11-A/$name').writeToFile(downloadToFile);
      print('downloaded');
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getURLs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: isMaterialExist ? ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: materialURLs.length,
            itemBuilder: (context, index) {
              if (materialURLs[index].isNotEmpty) {
                return InkWell(
                  onTap: () {
                    _downloadFile(materialName[index]);
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: Container(
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.file, size: 30.0),
                          SizedBox(width: 20.0),
                          Expanded(child: Text(materialName[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return SizedBox(height: 0.0);
            }
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png', width: 300, height: 300),
            Text('There is no material for this course !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor))
          ],
        ),
      ),
    );
  }
}
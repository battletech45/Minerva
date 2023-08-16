import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Controller/FirebaseFunctions.dart';
import '../../../Controller/SharedFunctions.dart';
import '../../../Model/WidgetProperties.dart';

class StudentHomeWorkViewPage extends StatefulWidget {
  @override
  _StudentHomeWorkViewPageState createState() => _StudentHomeWorkViewPageState();
}

class _StudentHomeWorkViewPageState extends State<StudentHomeWorkViewPage > {

  final List<HomeworkItem> homeworkItems = [];
  int _selectedIndex = -1;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  bool isHomeWorkExist = false;
  bool isSelected = false;
  bool isLoading = false;
  bool isLoaded = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
      isSelected = true;
    });
  }

  Future uploadFile() async {
    setState(() {
      isLoading = true;
    });
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var student = await FirebaseFunctions().getStudentData(email!);
    String? className = await FirebaseFunctions().findStudentsClass(student.docs[0].get('studentID'));
    final path = '$className/submissions/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

    setState(() {
      uploadTask = null;
      isLoading = false;
      isLoaded = true;
    });
  }

  _getHomeworks() async {
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var student = await FirebaseFunctions().getStudentData(email!);
    String? className = await FirebaseFunctions().findStudentsClass(student.docs[0].get('studentID'));
    var val = await FirebaseFunctions().getClassData(className!);
    List data = val.docs[0].get('Materials');
    data.forEach((element) {
      homeworkItems.add(HomeworkItem(name: element['assignmentTitle'], definition: element['assignmentContent'], isSubmitable: element['submitOpen'], fileName: element['pickedFileName']));
    });
    if(homeworkItems.isEmpty) {
      setState(() {
        isHomeWorkExist = false;
      });
    }
    else {
      setState(() {
        isHomeWorkExist = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getHomeworks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isHomeWorkExist ? ListView.builder(
        itemCount: homeworkItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: ListTile(
              tileColor: PageColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(homeworkItems[index].name, 
              style: TextStyle(
                fontWeight: FontWeight.w400, 
                fontSize: 25.0, 
              ),),
              onTap: () {
                _onItemTapped(index);
              },
            ),
          );
        },
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/logo.png', width: 300, height: 300),
          Text('There is no material for this course !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor))
        ],
      ),
      floatingActionButton: _selectedIndex != -1 ? FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = -1;
          });
        },
        child: Icon(Icons.clear),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomSheet: _selectedIndex != -1 ? Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: PageColors.mainColor, width: 3),
          )
        ),
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(homeworkItems[_selectedIndex].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  homeworkItems[_selectedIndex].definition,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Visibility(
                visible: homeworkItems[_selectedIndex].fileName!.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Text('Homework Material: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor)),
                    SizedBox(width: 15.0),
                    //Icon(FontAwesomeIcons.arrowTurnDown)
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Visibility(
                visible: homeworkItems[_selectedIndex].fileName!.isNotEmpty,
                child: Container(
                  width: 300,
                    child: Text(homeworkItems[_selectedIndex].fileName!,textAlign: TextAlign.center,style: TextStyle(fontSize: 17),)
                ),
              ),
             SizedBox(height: 30.0),
              if(isSelected)
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Container(
                    height: 65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.file, size: 30.0),
                        SizedBox(width: 20.0),
                        Expanded(child: Text(pickedFile!.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                      ],
                    ),
                  ),
                ),
              Visibility(
                visible: homeworkItems[_selectedIndex].isSubmitable,
                child: MaterialButton(
                  height: 45,
                  minWidth: 45,
                  onPressed: () async {
                    await selectFile();
                    await uploadFile();
                    var name = await SharedFunctions.getUserNameSharedPreference();
                    var email = await SharedFunctions.getUserEmailSharedPreference();
                    var student = await FirebaseFunctions().getStudentData(email!);
                    String? className = await FirebaseFunctions().findStudentsClass(student.docs[0].get('studentID'));
                    Map<String, dynamic> data = {
                      'studentName': name,
                      'fileName': pickedFile!.name,
                      'homeworkName': homeworkItems[_selectedIndex].name
                    };
                    await FirebaseFunctions().addStudentToSubmittedList(className!, data);
                    print('finish');
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text(isSelected ? isLoading ? 'Uploading' : isLoaded ? 'Uploaded' : 'Upload File' : "Choose File",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),),
                  color: PageColors.thirdColor,),
              )
            ],
          ),
        ),
      ) : null,
    );
  }
}

class HomeworkItem {
  final String name;
  final String definition;
  final String? fileName;
  final bool isSubmitable;

  HomeworkItem({required this.name, required this.definition, this.fileName, required this.isSubmitable});
}

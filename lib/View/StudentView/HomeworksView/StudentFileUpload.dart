import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Model/CustomWidgets.dart';
import '../Model/WidgetProperties.dart';

class StudentUploadHomework extends StatefulWidget {
  const StudentUploadHomework({super.key});

  @override
  State<StudentUploadHomework> createState() => _StudentUploadHomeworkState();
}

class _StudentUploadHomeworkState extends State<StudentUploadHomework> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  bool isSelected = false;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'sampleFile/${pickedFile!.name}';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("Student Upload Homework",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedFileList(pickedFile: pickedFile),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: PageColors.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(50, 50)),
                child: Text(
                  'Select File',
                  style: TextStyle(fontSize: 17),
                ),
                onPressed:() async{ _showMyDialog('Are you sure to select a file?');},
              ),
              SizedBox(
                width: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: PageColors.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(50, 50)),
                child: Text(
                  'Upload File',
                  style: TextStyle(fontSize: 17),
                ),
                onPressed  :() async{_showMyDialog('Are you sure to upload this file?');}, //} //uploadFile,
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
        drawer: customDrawer());
  }

  Future _showMyDialog(String dialogContent) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        icon: Icon(FontAwesomeIcons.triangleExclamation,size: 30,color: Colors.red,),
        title: const Text('Warning',style:TextStyle(fontSize: 22)),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text(dialogContent,style:TextStyle(fontSize: 20)),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes',style:TextStyle(fontSize: 20),),
            onPressed: () {
             selectFile();
            },
          ),
          SizedBox(width: 120),
          TextButton(
            child: const Text('No',style:TextStyle(fontSize: 20),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}



// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import '../Model/WidgetProperties.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path ='sampleFile/${pickedFile!.name}';
    final file=File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask =ref.putFile(file);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:PageColors.mainColor,
        centerTitle: true,
        title: Text('File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pickedFile != null)
              Container(
                height: 300,
                color: Colors.blue[100],
                child: Center(
                  child: Text(pickedFile!.name),
                ),
              ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 40,
              width: 110,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(100, 136, 174, 1)),
                child: Text('Select File'),
                onPressed: selectFile,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 110,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(100, 136, 174, 1)),
                child: Text('Upload File'),
                onPressed: uploadFile,
              ),
            ),
          ],
        ),
      ),
      drawer: customDrawer(),
    );
  }

}


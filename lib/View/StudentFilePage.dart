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
    setState(() {
      uploadTask =ref.putFile(file);

    });


    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

    setState(() {
      uploadTask =null;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:PageColors.mainColor,
        centerTitle: true,
        title: Text('File',
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(width: 10),
                  if (pickedFile != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PageColors.mainColor,
                      ),
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(pickedFile!.path!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  SizedBox(width: 10),
                  if (pickedFile != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PageColors.mainColor,
                      ),
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(pickedFile!.path!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  SizedBox(width: 10),
                  if (pickedFile != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PageColors.mainColor,
                      ),
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(pickedFile!.path!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  SizedBox(width: 10),
                  /*
                  if (pickedFile != null)
                    Container(
                      height: 190,
                      child: Image.file(
                        File(pickedFile!.path!),
                        fit: BoxFit.cover,
                      ),
                    ),*/
                ],
              ),
            ),
            SizedBox(width: 10),

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
            SizedBox(
              height: 32,
            ),
            buildProgress(),

          ],
        ),
      ),
      drawer: customDrawer(),
    );

  }
  Widget buildProgress ()=> StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text('${100 * progress.roundToDouble()} %',
                    style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          );
        }
        else {
          return SizedBox(height: 50,);

        }
      }


  );

}


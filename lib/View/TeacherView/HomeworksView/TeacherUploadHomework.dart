import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import '../../../Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadHomework extends StatefulWidget {
  final String className;

  const UploadHomework({super.key, required this.className});

  @override
  State<UploadHomework> createState() => _UploadHomeworkState();
}

class _UploadHomeworkState extends State<UploadHomework> {

  bool isChecked = false;
  bool isDocumentExist = false;
  bool isLoading = false;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String url = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
      isDocumentExist = true;
    });
  }

  Future uploadFile() async {
    setState(() {
      isLoading = true;
    });
    final path = '${widget.className}/${pickedFile!.name}';
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
      url = urlDownload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Please Enter Homework Here',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: PageColors.mainColor)
                ),
                hintText: 'Enter homework title ...',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: contentController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: PageColors.mainColor)
                ),
                hintText: 'Enter homework content ...',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    }),
                Text('Check here to create submission for this assignment...',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: selectFile,
                  child: Text(
                    'Select File',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PageColors.mainColor,
                     padding: EdgeInsets.symmetric(vertical:10,horizontal: 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                ElevatedButton(
                  onPressed: uploadFile,
                  child: Text(
                    isLoading ? 'Uploading...' : 'Upload File',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PageColors.mainColor,
                     padding: EdgeInsets.symmetric(vertical:10,horizontal: 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ],
            ),
            isDocumentExist
                ? selectedFileList(pickedFile: pickedFile)
                : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15.0),
                      Image.asset('assets/logo.png', width: 125, height: 125),
                      Text('No Such File...', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
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
                'Send Assignment',
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {
                Map<String, dynamic> assignment = {
                  'materialURL': url,
                  'assignmentTitle': titleController.text,
                  'assignmentContent': contentController.text,
                  'submitOpen': isChecked,
                  'pickedFileName': isDocumentExist ? pickedFile!.name : ''
                };
                FirebaseFunctions().createClassMaterial(widget.className, assignment);
                setState(() {
                  titleController.clear();
                  contentController.clear();
                  isChecked = false;
                  pickedFile = null;
                  url = '';
                  isDocumentExist = false;
                });
              },
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
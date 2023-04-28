import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadHomework extends StatefulWidget {

  @override
  State<UploadHomework> createState() => _UploadHomeworkState();
}

class _UploadHomeworkState extends State<UploadHomework> {

  bool isChecked = false;
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
              onChanged: (value) {},
              validator: (value) {},
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: PageColors.mainColor)
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
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });}),
                Text('Check here to create submission for this assignment...', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Send',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                  primary: PageColors.thirdColor,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            selectedFileList(pickedFile: pickedFile),
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
                'Select File',
                style: TextStyle(fontSize: 17),
              ),
              onPressed: selectFile,
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
              onPressed: uploadFile,
            ),
            SizedBox(height: 32),
            buildProgress(),
          ],
        ),
      ),
    );
  }

  //Bu buildProgress çalışmıyo sonra bakalım
  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
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
                  child: Text(
                    '${100 * progress.roundToDouble()} %',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            height: 10,
          );
        }
      });
}

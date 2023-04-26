import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadHomework extends StatefulWidget {
  const UploadHomework({super.key});

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
            Padding(padding: EdgeInsets.only(top: 18)),
            Text(
              'Please Enter Homework Here',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Padding(padding: EdgeInsets.symmetric(horizontal: 18)),

            TextFormField(
              onChanged: (value) {},
              validator: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter homework content ...',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                suffixIcon: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Checkbox(value: isChecked,
                      onChanged: (bool? value) {
                    setState(() {
                      isChecked =value ?? false;
                    });
                      },
                    activeColor: Colors.green[300],
                      ),
                ),

              ),
            ),
            SizedBox(
              height: 10,
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

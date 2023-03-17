import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import '../Model/WidgetProperties.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadHomework extends StatefulWidget {
  const UploadHomework({super.key});

  @override
  State<UploadHomework> createState() => _UploadHomeworkState();
}

class _UploadHomeworkState extends State<UploadHomework> {
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
    final path = 'sampleFile/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

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

  List<String> classes = [
    "11-A",
    "11-B",
    "11-C",
    "11-D",
    "12-A",
    "12-B",
    "12-C",
    "12-D",
  ];
  String dropdownvalue = '11-A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("HOME",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                ListTile(
                  title: Text("qweqwe"),
                )
              ],
            ),
            */
        
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PageColors.secondaryColor,
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: PageColors.secondaryColor,
                      value: dropdownvalue,
                      items: classes.map((String myClass) {
                        return DropdownMenuItem(
                          value: myClass,
                          child: Center(
                              child: Text(
                            myClass,
                            style: TextStyle(fontSize: 20),
                          )),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      }),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PageColors.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(50, 45)),
                  child: Text(
                    'Select File',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: selectFile,
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PageColors.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(50, 45)),
                  child: Text(
                    'Upload File',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: uploadFile,
                ),
                SizedBox(height: 32),

                buildProgress(),
              ],
            ),
          ],
        ),
        drawer: customDrawer());
  }
  //Bu buildProgress çalışmıyo sonra bakalım
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


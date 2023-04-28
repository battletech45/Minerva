import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import '../Control/FirebaseFunctions.dart';
import '../Control/SharedFunctions.dart';
import '../Model/CustomWidgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool isLoading = false;
  bool isStudent = true;
  Map<String, List<Question>?> dummyMap = {};
  List<dynamic> dummyList = [];
  List<Image> dummyImages = [];
  Stream<QuerySnapshot>? contents;
  String link = '';
  Image? data;
  int imageCount = 0;


  _checkUserIsStudent() async {
    bool? isData = await SharedFunctions.getUserStudentSharedPreference();
    setState(() {
      isStudent = isData!;
    });
  }
  _updateCounter() async {
    if(imageCount < dummyImages.length - 1) {
      setState(() {
        imageCount = imageCount + 1;
      });
    }
  }
  _getImage() async {
    setState(() {
      isLoading = true;
    });
    List<String> dummyUrls = await FirebaseFunctions().getAllImageURLs();
    dummyUrls.forEach((element) {
      setState(() {
        data = Image.network(
          element,
          fit: BoxFit.fill,
        );
        dummyImages.add(data!);
      });
    });
    setState(() {
      isLoading = false;
    });
  }
  
  _getAllContent() async {
    var val = await FirebaseFunctions().getAllContents();
    setState(() {
      contents = val;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _getAllContent();
    _checkUserIsStudent();
    _getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("HOME", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StreamBuilder<QuerySnapshot>(
            stream: contents,
            builder: (context, snapshot) {
              return snapshot.hasData ? ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  if(snapshot.data!.docs[index].get('contentType') == 'Text') {
                    return customContentFeed(
                        userName: snapshot.data!.docs[index].get('sender'),
                        content: snapshot.data!.docs[index].get('paragraph')
                    );
                  }
                  if(snapshot.data!.docs[index].get('contentType') == 'Survey') {
                    dummyList.clear();
                    dummyList = snapshot.data!.docs[index].get('surveyOptions');
                    dummyMap.clear();
                      for(int i = 0; i < dummyList.length; i++) {
                        dummyMap[dummyList[i]] = null;
                      }
                    return customContentFeed(
                        userName: snapshot.data!.docs[index].get('sender'),
                        content: Survey(
                          initialData: [
                            Question(
                              question: snapshot.data!.docs[index].get('surveyTitle'),
                              answerChoices: dummyMap,
                            )
                          ],
                        )
                    );
                  }
                  if(snapshot.data!.docs[index].get('contentType') == 'Image') {
                    return isLoading ? CircularProgressIndicator() : customContentFeed(userName: snapshot.data!.docs[index].get('sender'), content: dummyImages[imageCount], function: () => _updateCounter());
                  }
                },
              ) : CircularProgressIndicator();
            }
          ),
        ),
        drawer: customDrawer(),
        floatingActionButton: Visibility(
          visible: !isStudent,
          child: Transform.scale(
            scale: 1.2,
            child: FloatingActionButton(
                backgroundColor: PageColors.mainColor,
                onPressed: () {
                  customPostCreteAlert(context);
                },
                child: Icon(FontAwesomeIcons.paperPlane, size: 25.0)
            ),
          ),
        ),
    );
  }
}

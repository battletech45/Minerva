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
  bool click = false;
  bool isLoading = false;
  bool isStudent = true;
  Map<String, List<Question>?> dummyMap = {};
  List<dynamic> dummyList = [];
  QuerySnapshot? contents;
  String userName = "";
  String email = "";
  String link = '';
  Image? data;


  _getUserData() async {
    bool? isData = await SharedFunctions.getUserStudentSharedPreference();
    var val = await SharedFunctions.getUserEmailSharedPreference();
    setState(() {
      isStudent = isData!;
      email = val!;
    });
    var user = await FirebaseFunctions().getStudentData(email);
    print(isData!);
    setState(() {
      userName = user.docs[0].get('studentName');
    });
  }
  _getImage() async {
    setState(() {
      isLoading = true;
    });
    final ref = await FirebaseStorage.instance.ref('sampleFile').child('samplePicture.png');
    link = await ref.getDownloadURL();
    setState(() {
      data = Image.network(
      link,
      fit: BoxFit.fill,
       );
      isLoading = false;
    });
  }
  
  _getAllContent() async {
    setState(() {
      isLoading = true;
    });
    var val = await FirebaseFunctions().getAllContents();
    setState(() {
      contents = val;
      isLoading = false;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _getAllContent();
    _getUserData();
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
        body: !isLoading ? ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: contents!.size,
          itemBuilder: (context, index) {
            if(contents!.docs[index].get('contentType') == 'Text') {
              return customContentFeed(
                  userName: contents!.docs[index].get('sender'),
                  content: contents!.docs[index].get('paragraph')
              );
            }
            if(contents!.docs[index].get('contentType') == 'Survey') {
              dummyList.clear();
              dummyList = contents!.docs[index].get('surveyOptions');
              dummyMap.clear();
                for(int i = 0; i < dummyList.length; i++) {
                  dummyMap[dummyList[i]] = null;
                }
              return customContentFeed(
                  userName: contents!.docs[index].get('sender'),
                  content: Survey(
                    initialData: [
                      Question(
                        question: contents!.docs[index].get('surveyTitle'),
                        answerChoices: dummyMap,
                      )
                    ],
                  )
              );
            }
            if(contents!.docs[index].get('contentType') == 'Image') {}
          },
        ) : AnimatedSplashScreen(splash: 'assets/logo.png',splashIconSize: 200.0, disableNavigation: true, nextScreen: HomePage(), splashTransition: SplashTransition.fadeTransition),
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

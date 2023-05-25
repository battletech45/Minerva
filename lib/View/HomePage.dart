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
  QuerySnapshot? contents;
  List<Widget> allContents = [];
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
  _getImage(String url) async {
    setState(() {
      isLoading = true;
    });
      setState(() {
        data = Image.network(
          url,
          fit: BoxFit.fill,
        );
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
  _createAllContent() async {
    setState(() {
      isLoading = true;
    });
    await _getAllContent();
    bool available = await contents!.docs.isNotEmpty;
    if(available) {
      contents!.docs.forEach((element) {
        if(element.get('contentType') == 'Survey') {
          dummyList.clear();
          dummyList = element.get('surveyOptions');
          dummyMap.clear();
          for(int i = 0; i < dummyList.length; i++) {
            dummyMap[dummyList[i]] = null;
          }
          setState(() {
            allContents.add(
                customContentFeed(
                  userName: element.get('sender'),
                  content: Survey(
                    initialData: [
                      Question(
                        question: element.get('surveyTitle'),
                        answerChoices: dummyMap,
                      )
                    ],
                  ),
                  contentID: element.get('contentID'),
                  likeCounter: () => {},
                )
            );
          });
        }
        if(element.get('contentType') == 'Text') {
          setState(() {
            allContents.add(
                customContentFeed(
                  userName: element.get('sender'),
                  content: element.get('paragraph'),
                  contentID: element.get('contentID'),
                  likeCounter: () => {},
                )
            );
          });
        }
        if(element.get('contentType') == 'Image') {
          _getImage(element.get('imageURL'));
          setState(() {
            allContents.add(
                customContentFeed(
                  userName: element.get('sender'),
                  content: data,
                  function: () => _updateCounter(),
                  contentID: element.get('contentID'),
                  likeCounter: () => {},
                )
            );
          });
        }
      });
    }
    setState(() {
      isLoading = false;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _checkUserIsStudent();
    _createAllContent();
  }

  @override
  Widget build(BuildContext context) {
    //initState suresinde tum postlari yarat ve bir liste icine al sonra goster
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
          child: allContents.isNotEmpty ? ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: allContents.length,
            itemBuilder: (context, index) {
              return allContents[index];
            },
          ) : CircularProgressIndicator(),
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

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';
import 'package:minerva/Controller/SharedFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import '../Model/WidgetProperties.dart';
import 'ChatPage.dart';

class ChatsListPage extends StatefulWidget {
  @override
  State<ChatsListPage> createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {
  Stream<QuerySnapshot>? allChatsSnapshot;
  FirebaseAuth auth = FirebaseAuth.instance;
  String userName = '';
  String chatID = '';
  String userID = '';
  bool isStudent = false;
  bool isLoading = false;

  _getChats() async {
    setState(() {
      isLoading = true;
    });
    isStudent = (await SharedFunctions.getUserStudentSharedPreference())!;
    if(isStudent) {
      _getStudentID();
      var val = await FirebaseFunctions().getAllTeachers();
      setState(() {
        allChatsSnapshot = val;
      });
    }
    else {
      _getTeacherID();
      var val = await FirebaseFunctions().getAllStudents();
      setState(() {
        allChatsSnapshot = val;
      });
    }
    var name = await SharedFunctions.getUserNameSharedPreference();
    setState(() {
      userName = name!;
      isLoading = false;
    });
  }

  _getStudentID() async {
    var mail = await SharedFunctions.getUserEmailSharedPreference();
    var data = await FirebaseFunctions().getStudentData(mail.toString());
    setState(() {
      userID = data.docs[0].get('studentID');
    });
  }
  _getTeacherID() async {
    var mail = await SharedFunctions.getUserEmailSharedPreference();
    var data = await FirebaseFunctions().getTeacherData(mail.toString());
    setState(() {
      userID = data.docs[0].get('teacherID');
    });
  }
  
  _findChat(String userID, targetID) async {
    var val = await FirebaseFunctions().getAllChats();
    List<dynamic> IDs = [];
    String foundID = '';
    bool isCreated = false;
    if(val.docs.isNotEmpty) {
      val.docs.forEach((element) {
        print('here');
        IDs = element.get('members');
        if(IDs.contains(userID) && IDs.contains(targetID)) {
          setState(() {
            isCreated = true;
            foundID = element.id;
          });
        }
      });
      print(isCreated);
      if(isCreated) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ChatPage(chatID: foundID, userName: userName)));
      }
      else {
        var val = await FirebaseFunctions().createChat(userID, targetID);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ChatPage(chatID: val, userName: userName)));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getChats();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text("CHATS", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: isLoading ? AnimatedSplashScreen(splash: 'assets/logo.png',splashIconSize: 200.0, disableNavigation: true, nextScreen: ChatsListPage(), splashTransition: SplashTransition.fadeTransition)
      :
      StreamBuilder<QuerySnapshot>(
        stream: allChatsSnapshot,
        builder: (context, snapshot) {
          return snapshot.hasData ? ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.all(9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: PageColors.mainColor)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person,size: 40,)),
                    title: Padding(
                      padding: const EdgeInsets.only(top:8.0, left:6),
                      child: Text(snapshot.data!.docs[index].get(isStudent ? 'teacherName' : 'studentName'),style:
                       TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                       ),),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top:5,left:6),
                      child: Text('Click to start conversation !',style: TextStyle(
                        fontSize: 16,
                      ),),
                    ),
                    onTap: () {
                      _findChat(userID, snapshot.data!.docs[index].get(isStudent ? 'teacherID' : 'studentID'));
                    },
                  ),
                );
              }
          ) : CircularProgressIndicator();
        }
      ),
      drawer: customDrawer(),
    );
  }
}
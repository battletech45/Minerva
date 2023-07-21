import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minerva/Control/Notifications.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:minerva/View/StudentView/ProfileView/ProfilePage.dart';
import 'package:minerva/View/TeacherView/ProfileView/ProfileTeacher.dart';
import 'package:minerva/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'View/WelcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLoggedIn = false;
  bool isStudent = false;

  _checkUserStatus() async {
    var savedLoggedIn = await SharedFunctions.getUserLoggedInSharedPreference();
    var userStudent = await SharedFunctions.getUserStudentSharedPreference();
    if(savedLoggedIn != null && userStudent != null) {
      setState(() {
        isLoggedIn = savedLoggedIn;
        isStudent = userStudent;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isStudent ? NotificationsScreen() : ProfileTeacherPage()
    ) :
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}



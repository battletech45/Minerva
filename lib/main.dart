import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minerva/Controller/Notifications.dart';
import 'package:minerva/Controller/SharedFunctions.dart';
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

  String notificationTitle = 'No Title';
  String notificationBody = 'No Body';

  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
    final _firebaseMessaging = FCM();
    _firebaseMessaging.setNotifications();
    NotificationHelper.initialize();

    _firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    _firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isStudent ? ProfilePage() : ProfileTeacherPage()
    ) :
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}



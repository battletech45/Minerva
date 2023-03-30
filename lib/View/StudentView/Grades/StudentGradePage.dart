import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';


class StudentGradePage extends StatefulWidget {
  const StudentGradePage({Key? key}) : super(key: key);

  @override
  State<StudentGradePage> createState() => _StudentGradePage();
}

class _StudentGradePage extends State<StudentGradePage> {

  bool expansionIcon = false;
  bool isLoading = false;
  String studentID = '';
  Map<String, dynamic> courses = {};

  _getCourses() async {
    setState(() {
      isLoading = true;
    });
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var val = await FirebaseFunctions().getStudentData(email!);
    setState(() {
      print(val.docs[0].get('studentID'));
      studentID = val.docs[0].get('studentID');
    });
    var map = await FirebaseFunctions().getStudentCourses(studentID);
    setState(() {
      courses = map;
      isLoading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    _getCourses();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Grades'),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
      ),
      body: isLoading ? AnimatedSplashScreen(splash: 'assets/logo.png',splashIconSize: 200.0, disableNavigation: true, nextScreen: StudentGradePage(), splashTransition: SplashTransition.fadeTransition)
      :
      ListView.builder(
        physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: courses.length,
          itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(height: 5.0),
              customExpansionPanel(courseName: courses.keys.elementAt(index), examPoint: courses[courses.keys.elementAt(index)]['exam'], projectPoint: courses[courses.keys.elementAt(index)]['project'], quizPoint: courses[courses.keys.elementAt(index)]['quiz']),
              SizedBox(height: 5.0),
            ],
          );
          }
      ),
        drawer: customDrawer(),
    );
  }
}

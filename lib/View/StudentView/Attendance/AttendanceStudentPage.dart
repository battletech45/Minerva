import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class AttendanceStudentPage extends StatefulWidget {
  @override
  State<AttendanceStudentPage> createState() => _AttendanceStudentPageState();
}

class _AttendanceStudentPageState extends State<AttendanceStudentPage> {

  String studentID = '';
  bool isLoading = false;
  Map<String, dynamic> courseAttendance = {};

  _getCourses() async {
    setState(() {
      isLoading = true;
    });
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var val = await FirebaseFunctions().getStudentData(email!);
    setState(() {
      studentID = val.docs[0].get('studentID');
    });
    var map = await FirebaseFunctions().getStudentCourses(studentID);
    setState(() {
      courseAttendance = map;
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
       elevation: 0.0,
       automaticallyImplyLeading: true,
       backgroundColor: PageColors.mainColor,
       centerTitle: true,
       title: Text("ATTENDANCE", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
     ),
      body: isLoading ? AnimatedSplashScreen(splash: 'assets/logo.png',splashIconSize: 200.0, disableNavigation: true, nextScreen: AttendanceStudentPage(), splashTransition: SplashTransition.fadeTransition)
      :
      ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: courseAttendance.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(height: 15.0),
              customAttendanceCard(teacherName: 'teacherName', courseName: courseAttendance.keys.elementAt(index), attendance: courseAttendance[courseAttendance.keys.elementAt(index)]['attendance'] + ' ')
            ],
          );
        },
      ),
      drawer: customDrawer()
   );
  }
}
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
  String studentID = '';
  Map<String, dynamic> courses = {};

  _getCourses() async {
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var val = await FirebaseFunctions().getStudentData(email!);
    setState(() {
      print(val.docs[0].get('studentID'));
      studentID = val.docs[0].get('studentID');
    });
    var map = await FirebaseFunctions().getStudentCourses(studentID);
    setState(() {
      courses = map;
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
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: courses.length,
          itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              customExpansionPanel(courseName: courses.keys.elementAt(index), examPoint: courses[courses.keys.elementAt(index)]['exam'], projectPoint: courses[courses.keys.elementAt(index)]['project'], quizPoint: courses[courses.keys.elementAt(index)]['quiz']),
              SizedBox(height: 10.0),
            ],
          );
          }
      ),
        drawer: customDrawer(),
    );
  }
}

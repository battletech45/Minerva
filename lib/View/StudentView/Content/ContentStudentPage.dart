import 'package:flutter/material.dart';
import 'package:minerva/Controller/ClassesService.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';

class ContentStudent extends StatefulWidget {
  @override
  State<ContentStudent> createState() => _ContentStudentState();
}

class _ContentStudentState extends State<ContentStudent> {
  List<dynamic> courses = [];

  _getCourses() async {
    var val = await ClassesService().getClassData('11-A');
    setState(() {
      courses = val.docs[0].get('courses');
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
          title: Text("CONTENTS",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              padding: EdgeInsets.all(15),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return customCourseGrid(courseName: courses[index]);
              },
            ),
          ],
        ),
        drawer: customDrawer());
  }
}

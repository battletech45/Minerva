import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/View/StudentHomeWorkViewPage.dart';
import 'package:minerva/View/StudentView/Content/StudentCourseContentPage.dart';
import 'package:minerva/View/TeacherView/AttendanceView/EditAttendance.dart';
import 'package:minerva/View/StudentFilePage.dart';
import 'package:minerva/View/StudentView/HomeworksView/StudentFileUpload.dart';
import 'package:minerva/View/TeacherView/GradesView/TeacherGradePage.dart';
import '../../../Model/WidgetProperties.dart';

class ContentStudent extends StatefulWidget {
  @override
  State<ContentStudent> createState() => _ContentStudentState();
}

class _ContentStudentState extends State<ContentStudent> {
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
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(15),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Card(
              elevation: 6,
              shape: CustomBorders.mainBorder,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                title: Text("MATH",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'MATH')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                title: Text("BIOLOGY",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'BIOLOGY')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                title: Text("PHYSICS",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'PHYSICS')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                title: Text("TURKISH",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'TURKISH')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                title: Text("ENGLISH",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'ENGLISH')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                title: Text("GERMAN",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'GERMAN')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                title: Text("CHEMISTRY",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'CHEMISTRY')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                //leading: Icon(Icons.class_),
                title: Text("LITERATURE",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'LITERATURE')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                //leading: Icon(Icons.class_),
                title: Text("HISTORY",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'HISTORY')));
                },
              ),
            ),
            Card(
              shape: CustomBorders.mainBorder,
              elevation: 6,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ListTile(
                //leading: Icon(Icons.class_),
                title: Text("GEOGRAPHY",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CourseContent(courseName: 'GEOGRAPHY')));
                },
              ),
            ),
          ],
        ),
        drawer: customDrawer());
  }
}
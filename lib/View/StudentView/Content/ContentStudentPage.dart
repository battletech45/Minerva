import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/View/StudentView/Content/StudentWeeklySchedule.dart';
import '../../../Model/WidgetProperties.dart';

class ContentStudent extends StatefulWidget {
  @override
  State<ContentStudent> createState() => _ContentStudentState();
}

class _ContentStudentState extends State<ContentStudent> {
  List<dynamic> courses = [];

  _getCourses() async {
    var val = await FirebaseFunctions().getClassData('11-A');
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
            GestureDetector(
              onTap: () =>   Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentWeeklySchedule())),
              child: Card(
                elevation: 6,
                shape: CustomBorders.mainBorder,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40.0 ,),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25.0),
                      Text("Weekly Schedule",
                          textAlign: TextAlign.center,
                          style:
                             TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      SizedBox(height: 20.0),
                      Icon(FontAwesomeIcons.calendar,
                          color: PageColors.thirdColor, size: 50.0),
                           SizedBox(height: 20.0),   
                    ],
                  ),
                ),
              ),
            ),
           
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

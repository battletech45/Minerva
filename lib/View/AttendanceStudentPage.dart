import 'package:flutter/material.dart';
import 'package:minerva/Model/ColorPlates.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class AttendanceStudentPage extends StatefulWidget {
  @override
  State<AttendanceStudentPage> createState() => _AttendanceStudentPageState();
}

class _AttendanceStudentPageState extends State<AttendanceStudentPage> {
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
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 30.0),
            customAttendanceCard('Teacher Tom'),
            customAttendanceCard('Teacher Tom'),
            customAttendanceCard('Teacher Tom'),
            customAttendanceCard('Teacher Tom'),
            customAttendanceCard('Teacher Tom'),
            customAttendanceCard('Teacher Tom'),
            customAttendanceCard('Teacher Tom'),
            customAttendanceCard('Teacher Tom'),
            customAttendanceCard('Teacher Tom'),
          ],
        ),
      ),
      drawer: customDrawer()
   );
  }
}
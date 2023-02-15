import 'package:flutter/material.dart';
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
       toolbarHeight: 150.0,
       elevation: 0.0,
       automaticallyImplyLeading: true,
       backgroundColor: Colors.deepOrange[300],
       actions: <Widget>[
         Image.asset('assets/logo.png', alignment: Alignment.centerRight, height: 150, width: 150),
       ],
     ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.deepOrange[300],
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Text('Attendance', textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
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
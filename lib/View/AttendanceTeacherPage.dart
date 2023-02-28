import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class AttendanceTeacherPage extends StatefulWidget {
  @override
  State<AttendanceTeacherPage> createState() => _AttendanceTeacherPageState();
}

class _AttendanceTeacherPageState extends State<AttendanceTeacherPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       elevation: 0.0,
       automaticallyImplyLeading: true,
       backgroundColor: PageColors.mainColor,
       title: Text("ATTENDANCE", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
       centerTitle: true,
     ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MaterialButton(onPressed: () {}, child: Text('EDIT'), color: PageColors.thirdColor),
                SizedBox(width: 30.0)
              ],
            ),
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
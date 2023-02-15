import 'package:flutter/material.dart';
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
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MaterialButton(onPressed: () {}, child: Text('EDIT'), color: Colors.red),
                SizedBox(width: 30.0)
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom', textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Course Name', style: TextStyle(backgroundColor: Colors.deepOrange[500])),
                      Text('Attendance', style: TextStyle(backgroundColor: Colors.deepOrange[500]))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('01/03/2023', style: TextStyle(backgroundColor: Colors.grey)),
                      Text('2 Hours', style: TextStyle(backgroundColor: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom', textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Course Name', style: TextStyle(backgroundColor: Colors.deepOrange[500])),
                      Text('Attendance', style: TextStyle(backgroundColor: Colors.deepOrange[500]))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('01/03/2023', style: TextStyle(backgroundColor: Colors.grey)),
                      Text('2 Hours', style: TextStyle(backgroundColor: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom', textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Course Name', style: TextStyle(backgroundColor: Colors.deepOrange[500])),
                      Text('Attendance', style: TextStyle(backgroundColor: Colors.deepOrange[500]))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('01/03/2023', style: TextStyle(backgroundColor: Colors.grey)),
                      Text('2 Hours', style: TextStyle(backgroundColor: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom', textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Course Name', style: TextStyle(backgroundColor: Colors.deepOrange[500])),
                      Text('Attendance', style: TextStyle(backgroundColor: Colors.deepOrange[500]))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('01/03/2023', style: TextStyle(backgroundColor: Colors.grey)),
                      Text('2 Hours', style: TextStyle(backgroundColor: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom', textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Course Name', style: TextStyle(backgroundColor: Colors.deepOrange[500])),
                      Text('Attendance', style: TextStyle(backgroundColor: Colors.deepOrange[500]))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('01/03/2023', style: TextStyle(backgroundColor: Colors.grey)),
                      Text('2 Hours', style: TextStyle(backgroundColor: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              color: Colors.deepOrange[400],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Teacher Tom', textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Course Name', style: TextStyle(backgroundColor: Colors.deepOrange[500])),
                      Text('Attendance', style: TextStyle(backgroundColor: Colors.deepOrange[500]))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('01/03/2023', style: TextStyle(backgroundColor: Colors.grey)),
                      Text('2 Hours', style: TextStyle(backgroundColor: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: customDrawer()
   );
  }
}
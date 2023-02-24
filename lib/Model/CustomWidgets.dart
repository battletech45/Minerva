import 'package:flutter/material.dart';
import 'package:minerva/Model/ColorPlates.dart';
import 'package:minerva/View/AnnouncementStudentPage.dart';
import 'package:minerva/View/AnnouncementTeacherPage.dart';
import 'package:minerva/View/AttendanceStudentPage.dart';
import 'package:minerva/View/ChatPage.dart';
import 'package:minerva/View/HomePage.dart';
import 'package:minerva/View/ProfilePage.dart';
import 'package:minerva/View/StudentGradePage.dart';

import '../View/AttendanceTeacherPage.dart';
import '../View/ContentStudentPage.dart';

class customDrawer extends StatefulWidget {
  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0),
            child: Container(
              color: PageColors.thirdColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person, size: 50.0),
                  Text('Metin Baybars Arslan', style: TextStyle(color: Colors.black,fontSize: 20))
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('HOME',style: TextStyle(fontSize: 24),textAlign: TextAlign.center,),
            onTap: (){
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
            },

          ),
          ListTile(
            title: Text('PROFILE',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfilePage()));
            },
          ),
          ListTile(
            title: Text('GRADES',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> StudentGradePage()));
            },
          ),
          ListTile(
            title: Text('ATTENDANCE',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> AttendanceTeacherPage()));
            },
          ),
          ListTile(
            title: Text('CHAT',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ChatPage()));
            },
          ),
          ListTile(
            title: Text('ANNOUNCEMENTS',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> AnnouncementTeacherPage()));
            },
          ),
          ListTile(
            title: Text('CONTENT',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ContentStudent()));
            },
          ),
        ],
      ),
    );
  }
}

class customAttendanceCard extends StatelessWidget {

  String teacherName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PageColors.secondaryColor,
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(teacherName, textAlign: TextAlign.center),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Course Name', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              Text('Attendance', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('01/03/2023'),
              Text('2 Hours')
            ],
          ),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }

  customAttendanceCard(this.teacherName);
}
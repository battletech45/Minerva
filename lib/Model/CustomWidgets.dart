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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: PageColors.thirdColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 43,
                    backgroundColor: PageColors.secondaryColor,
                    child: Icon(Icons.person, size: 50.0),
                  ),
                  title: Text('Metin Baybars Arslan',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  subtitle: Text('School Number',
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.house, size: 30, color: Colors.black54),
            title: Text('HOME',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person_2, size: 30, color: Colors.black54),
            title: Text('PROFILE',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.grade_sharp, size: 30, color: Colors.black54),
            title: Text('GRADES',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => StudentGradePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.fact_check_outlined,
                size: 30, color: Colors.black54),
            title: Text('ATTENDANCE',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AttendanceTeacherPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat, size: 30, color: Colors.black54),
            title: Text('CHAT',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ChatPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.announcement, size: 30, color: Colors.black54),
            title: Text('ANNOUNCEMENTS',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AnnouncementTeacherPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.content_copy, size: 30, color: Colors.black54),
            title: Text('CONTENT',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ContentStudent()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, size: 20, color: Colors.black54),
            title: Text('SIGN OUT',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.justify),
            onTap: () {},
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
              Text('Course Name',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Text('Attendance',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Text('01/03/2023'), Text('2 Hours')],
          ),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }

  customAttendanceCard(this.teacherName);
}

import 'package:flutter/material.dart';
import 'package:minerva/View/AttendanceStudentPage.dart';
import 'package:minerva/View/ChatPage.dart';
import 'package:minerva/View/HomePage.dart';
import 'package:minerva/View/ProfilePage.dart';

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
      backgroundColor: Colors.green,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.person, size: 50.0),
                Text('Metin Baybars Arslan', style: TextStyle(color: Colors.white,fontSize: 20))
              ],
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
            onTap: (){},
          ),
          ListTile(
            title: Text('ATTENDANCE',style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            onTap: (){
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> AttendanceStudentPage()));
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
            onTap: (){},
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

class customAttendanceCard extends StatefulWidget {

  String teacherName;

  @override
  State<customAttendanceCard> createState() => _customAttendanceCardState();

  customAttendanceCard(this.teacherName);
}

class _customAttendanceCardState extends State<customAttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      color: Colors.deepOrange[400],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(widget.teacherName, textAlign: TextAlign.center),
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
    );
  }
}
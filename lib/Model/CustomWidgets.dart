import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/View/AnnouncementStudentPage.dart';
import 'package:minerva/View/AnnouncementTeacherPage.dart';
import 'package:minerva/View/AttendanceStudentPage.dart';
import 'package:minerva/View/ChatPage.dart';
import 'package:minerva/View/HomePage.dart';
import 'package:minerva/View/ProfilePage.dart';
import 'package:minerva/View/RegisterPage.dart';
import 'package:minerva/View/StudentGradePage.dart';
import 'package:minerva/View/TeacherGradePage.dart';
import 'package:minerva/View/WelcomePage.dart';
import '../View/AttendanceTeacherPage.dart';
import '../View/ContentStudentPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class customDrawer extends StatefulWidget {
  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  FirebaseAuth auth = FirebaseAuth.instance;
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
            title: Text('Home',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person_2, size: 30, color: Colors.black54),
            title: Text('Profile',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.grade_sharp, size: 30, color: Colors.black54),
            title: Text('Grades',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => StudentGradePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.fact_check_outlined,
                size: 30, color: Colors.black54),
            title: Text('Attendance',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AttendanceTeacherPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat, size: 30, color: Colors.black54),
            title: Text('Chat',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ChatPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.announcement, size: 30, color: Colors.black54),
            title: Text('Announcement',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AnnouncementTeacherPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.content_copy, size: 30, color: Colors.black54),
            title: Text('Content',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ContentStudent()));
            },
          ),
          SizedBox(height:15),
          Divider(color: PageColors.secondaryColor,),
          ListTile(
            leading: Icon(Icons.logout, size: 30, color: Colors.black54),
            title: Text('Sign Out',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              signout();

            },
          ),
        ],
      ),
    );
  }
  Future signout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()));

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

class customContentFeed extends StatefulWidget {
  final String userName;

  const customContentFeed({Key? key, required this.userName}) : super(key: key);
  @override
  State<customContentFeed> createState() => _customContentFeedState();
}

class _customContentFeedState extends State<customContentFeed> {

  bool click = false;
  @override
  Widget build(BuildContext context) {
    String name = widget.userName;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: CircleAvatar(
                radius: 25,
              ),
            ),
            SizedBox(width: 5),
            Text("$name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
                color: PageColors.secondaryColor,
                borderRadius: BorderRadius.circular(8)
            ),
          ),
        ),
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child:IconButton(
                    icon: click ? Icon(FontAwesomeIcons.solidHeart,size: 38,color: Colors.red,) : Icon(FontAwesomeIcons.heart,size: 38),
                    onPressed: () {
                      setState(() {
                        click =! click;
                      });
                    })
            ),
          ],
        ),
      ],
    );
  }
}

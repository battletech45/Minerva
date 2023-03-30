import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/View/StudentView/Announcement/AnnouncementStudentPage.dart';
import 'package:minerva/View/StudentView/Attendance/AttendanceStudentPage.dart';
import 'package:minerva/View/ChatPage.dart';
import 'package:minerva/View/TeacherView/ContentView/ContentTeacherPage.dart';
import 'package:minerva/View/HomePage.dart';
import 'package:minerva/View/StudentView/ProfileView/ProfilePage.dart';
import 'package:minerva/View/TeacherView/ProfileView/ProfileTeacher.dart';
import 'package:minerva/View/RegisterPage.dart';
import 'package:minerva/View/StudentView/Grades/StudentGradePage.dart';
import 'package:minerva/View/TeacherView/GradesView/TeacherGradePage.dart';
import 'package:minerva/View/WelcomePage.dart';
import '../View/TeacherView/AnnouncementView/AnnouncementTeacherPage.dart';
import '../View/TeacherView/AttendanceView/AttendanceTeacherPage.dart';
import '../View/ChatsListPage.dart';
import '../View/StudentView/Content/ContentStudentPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class customDrawer extends StatefulWidget {
  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  String userName = '';
  String userNumber = '';
  bool isStudent = false;

  getUserInfos() async {
    var name = await SharedFunctions.getUserNameSharedPreference();
    var check = await SharedFunctions.getUserStudentSharedPreference();
    var mail = await SharedFunctions.getUserEmailSharedPreference();
    setState(() {
      userName = name!;
      isStudent = check!;
    });
    if(isStudent) {
      var student = await FirebaseFunctions().getStudentData(mail!);
      setState(() {
        userNumber = student.docs[0].get('studentNumber');
      });
    }
    else {
      var teacher = await FirebaseFunctions().getTeacherData(mail!);
      setState(() {
        userNumber = teacher.docs[0].get('teacherNumber');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserInfos();
  }

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
                    radius: 45,
                    backgroundColor: PageColors.secondaryColor,
                    child: Icon(Icons.person, size: 55.0),
                  ),
                  title: Text('$userName',
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                  subtitle: Text('$userNumber',
                      style: TextStyle(color: Colors.black,fontSize: 18)),
                ),
              ],
            ),
          ),
          ListTile(
            leading:
                Icon(FontAwesomeIcons.house, size: 25, color: Colors.black54),
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
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      isStudent ? ProfilePage() : ProfileTeacherPage()));
            },
          ),
          ListTile(
            leading:
                Icon(FontAwesomeIcons.star, size: 30, color: Colors.black54),
            title: Text('Grades',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      isStudent ? StudentGradePage() : TeacherGradePage(studentID: 'skIaAFi6EbtaTEKSMymx')));
            },
          ),
          ListTile(
            leading: Icon(Icons.fact_check_outlined,
                size: 30, color: Colors.black54),
            title: Text('Attendance',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => isStudent
                      ? AttendanceStudentPage()
                      : AttendanceTeacherPage()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidMessage,
                size: 30, color: Colors.black54),
            title: Text('Chat',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ChatsListPage()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidNewspaper,
                size: 30, color: Colors.black54),
            title: Text('Announcement',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => isStudent
                      ? AnnouncementStudentPage()
                      : AnnouncementTeacherPage()));
            },
          ),
          ListTile(
            leading:
                Icon(FontAwesomeIcons.book, size: 30, color: Colors.black54),
            title: Text('Content',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      isStudent ? ContentStudent() : ContentTeacherPage()));
            },
          ),
          SizedBox(height: 15),
          Divider(
            color: PageColors.secondaryColor,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.arrowRightFromBracket,
                size: 30, color: Colors.black54),
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

  Future signout() async {
    await FirebaseAuth.instance.signOut();
    await SharedFunctions.saveUserStudentSharedPreference(false);
    await SharedFunctions.saveUserEmailSharedPreference('');
    await SharedFunctions.saveUserLoggedInSharedPreference(false);
    await SharedFunctions.saveUserNameSharedPreference('');
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
  }
}

class customAttendanceCard extends StatefulWidget {
  final String teacherName;
  final String courseName;
  final String attendance;

  @override
  State<customAttendanceCard> createState() => _customAttendanceCardState();

  const customAttendanceCard({Key? key, required this.teacherName, required this.courseName, required this.attendance}) : super(key: key);
}

class _customAttendanceCardState extends State<customAttendanceCard> {
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
            title: Text(widget.teacherName, textAlign: TextAlign.center),
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
            children: <Widget>[Text(widget.courseName), Text(widget.attendance + ' Hours')],
          ),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }
}

class customContentFeed extends StatefulWidget {
  final String userName;

  const customContentFeed({Key? key, required this.userName}) : super(key: key);
  @override
  State<customContentFeed> createState() => _customContentFeedState();
}

class _customContentFeedState extends State<customContentFeed> {
  bool click = false;
  int likeCounter=0;
  @override
  Widget build(BuildContext context) {
    String name = widget.userName;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CircleAvatar(
                radius: 25,
              ),
            ),
            SizedBox(width: 5),
            Text(
              "$name",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
                color: PageColors.secondaryColor,
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        Row(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Row(
                  children: [
                    IconButton(
                    icon: click
                        ? Icon(
                            FontAwesomeIcons.solidHeart,
                            size: 38,
                            color: Colors.red,
                          )
                        : Icon(FontAwesomeIcons.heart, size: 38),
                    onPressed: () {
                      setState(() {
                        click = !click;
                        if(click==true){
                          likeCounter++;
                        }
                        else{
                          likeCounter--;
                        }
                      });
                    }),
                     SizedBox(width: 10,),
                     Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("$likeCounter",style: TextStyle(fontSize: 30),)),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}

class customExpansionPanel extends StatefulWidget {
  final String courseName;
  final String examPoint;
  final String projectPoint;
  final String quizPoint;

  const customExpansionPanel(
      {Key? key,
      required this.courseName,
      required this.examPoint,
      required this.projectPoint,
      required this.quizPoint})
      : super(key: key);
  @override
  State<customExpansionPanel> createState() => _customExpansionPanelState();
}

class _customExpansionPanelState extends State<customExpansionPanel> {
  bool expansionIcon = false;
  @override
  Widget build(BuildContext context) {
    String course = widget.courseName;
    String exam = widget.examPoint;
    String project = widget.projectPoint;
    String quiz = widget.quizPoint;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black54,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: ExpansionTile(
        title: Text("$course"),
        trailing: Icon(
            expansionIcon ? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown,
            color: Colors.pink),
        children: <Widget>[
          ListTile(
            leading: Text("Exam: "),
            trailing: Text('$exam'),
          ),
          ListTile(
            leading: Text("Project: "),
            trailing: Text("$project"),
          ),
          ListTile(
            leading: Text("Quiz: "),
            trailing: Text("$quiz"),
          )
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            expansionIcon = expanded;
          });
        },
      ),
    );
  }
}
//Sınıf Listesi Checkbox design
class customCheckBoxListTile extends StatefulWidget {
  final List<String> classes;
  final int index;

  const customCheckBoxListTile(
      {Key? key, required this.classes, required this.index})
      : super(key: key);
  @override
  State<customCheckBoxListTile> createState() => _customCheckBoxListTileState();
}

class _customCheckBoxListTileState extends State<customCheckBoxListTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.classes[widget.index],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 0.5)),
      value: isSelected,
      selected: !isSelected,
      onChanged: (val) {
        setState(() {
          isSelected = val!;
        });
      },
    );
  }
}

//Seçilen dosyaları ListView içinde bize gösteren component
class selectedFileList extends StatelessWidget {
  const selectedFileList({
    super.key,
    required this.pickedFile,
  });

  final PlatformFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(width: 10),
          if (pickedFile != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PageColors.mainColor,
              ),
              width: 200,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(pickedFile!.path!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(width: 10),
          if (pickedFile != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PageColors.mainColor,
              ),
              width: 200,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(pickedFile!.path!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(width: 10),
          if (pickedFile != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PageColors.mainColor,
              ),
              width: 200,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(pickedFile!.path!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
//Upload sayfalarında kullanılabilir sınıf sayısı kadar checkbox oluşturan sistem
class classListChekboxBuilder extends StatelessWidget {
  const classListChekboxBuilder({
    super.key,
    required this.classes,
  });

  final List<String> classes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: classes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: PageColors.secondaryColor,
              ),
              child: customCheckBoxListTile(
                  classes: classes, index: index));
        },
      ),
    );
  }
}

//Manuel yoklama için kullanılan öğrencinin kaç saat yok yazılacağnı seçtiğimiz checkboxlar
class customEditCheckBoxListTile extends StatefulWidget {
  final String hours;

  const customEditCheckBoxListTile(
      {Key? key, required this.hours})
      : super(key: key);
  @override
  State<customEditCheckBoxListTile> createState() =>
      _customEditCheckBoxListTileState();
}

class _customEditCheckBoxListTileState extends State<customEditCheckBoxListTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final String hours=widget.hours;
    return CheckboxListTile(
      title: Text("$hours",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 0.5)),
      value: isSelected,
      selected: !isSelected,
      onChanged: (val) {
        setState(() {
          isSelected = val!;
        });
      },
    );
  }
}

class customEditExpansionPanel extends StatefulWidget {
  final String name;

  const customEditExpansionPanel({super.key, required this.name});
  @override
  State<customEditExpansionPanel> createState() => _customEditExpansionPanelState();
}

class _customEditExpansionPanelState extends State<customEditExpansionPanel> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    String name = widget.name;
    return ExpansionTile(
        title: Text(name, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0.5)
        ),
      trailing: Icon(isSelected ? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown, color: Colors.pink),
      children: <Widget>[
        customEditCheckBoxListTile(hours: "One Hour  "),
        customEditCheckBoxListTile(hours: "Two Hour  "),
        customEditCheckBoxListTile(hours: "Three Hour"),
      ],
      onExpansionChanged: (bool val) {
          setState(() {
            isSelected = val;
          });
      },
    );
  }
}

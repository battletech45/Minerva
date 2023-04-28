import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/View/LoginPage.dart';
import 'package:minerva/View/RegisterPage.dart';
import 'package:minerva/View/StudentView/Announcement/AnnouncementStudentPage.dart';
import 'package:minerva/View/StudentView/Attendance/AttendanceStudentPage.dart';
import 'package:minerva/View/TeacherView/AttendanceView/EditAttendance.dart';
import 'package:minerva/View/TeacherView/ContentView/ContentTeacherPage.dart';
import 'package:minerva/View/HomePage.dart';
import 'package:minerva/View/StudentView/ProfileView/ProfilePage.dart';
import 'package:minerva/View/TeacherView/GradesView/TeacherGradeStudentList.dart';
import 'package:minerva/View/TeacherView/ProfileView/ProfileTeacher.dart';
import 'package:minerva/View/StudentView/Grades/StudentGradePage.dart';
import 'package:minerva/View/WelcomePage.dart';
import '../View/ResetPassword.dart';
import '../View/StudentView/Content/StudentCourseContentPage.dart';
import '../View/TeacherView/AnnouncementView/AnnouncementTeacherPage.dart';
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
  String userID = '';
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
        physics: NeverScrollableScrollPhysics(),
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
                      isStudent ? StudentGradePage() : TeacherGradeStudentList() /* TeacherGradePage(studentID: 'skIaAFi6EbtaTEKSMymx')*/));
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
                      : EditAttendance()));
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
          Divider(
            thickness: 2.0,
            color: PageColors.secondaryColor,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.key,
                size: 30, color: Colors.black54),
            title: Text('Reset Password',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.justify),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResetPassword()));
            },
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
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(Icons.person,
              size: 35,
              ),
              title: Text(widget.teacherName, textAlign: TextAlign.center, style: TextStyle( fontSize: 20,)),
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Course Name',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      )),
              Text('Attendance',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, 
                      fontWeight: FontWeight.bold,
                        fontSize: 16,))
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(widget.courseName,
              style: TextStyle( fontSize: 16,),
              ),
               Text(widget.attendance + ' Hours',
            style: TextStyle( fontSize: 16,))
            ],
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}

class customContentFeed extends StatefulWidget {
  final String userName;
  final dynamic content;
  Function? function;

  customContentFeed({Key? key, required this.userName, required this.content, this.function}) : super(key: key);
  @override
  State<customContentFeed> createState() => _customContentFeedState();
}

class _customContentFeedState extends State<customContentFeed> {

  bool click = false;
  int likeCounter = 0;

  _defineContentsType(dynamic content) {
    if(content is String) {
      //Stringi doncebilecek sekilde bir widget yapisi kurulabilir
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Card(
          elevation: 2,
          shadowColor: PageColors.mainColor,
          shape: CustomBorders.mainBorder,
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    content.toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if(content is Widget) {
      if(content is Image) {
        widget.function!();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              color: PageColors.secondaryColor,
              borderRadius: BorderRadius.circular(8),),
            child: widget.content,
          ),
        );
      }
      else {
        return Container(
          height: 300,
          width: 400,
          color: PageColors.thirdColor,
          alignment: Alignment.bottomCenter,
          child: content
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.userName;
    // yukaridaki fonksiyon burada return ile cagiralacak ve icleri contenti dondurebilecek sekilde olacak
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
        _defineContentsType(widget.content),
        /*
        
        */
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
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.black54,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: ExpansionTile(
        title: Text("$course",
            style: TextStyle(fontSize: 21),),
        trailing: Icon(
            expansionIcon ? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown,
            color: Colors.pink),
        children: <Widget>[
          ListTile(
            leading: Text("Exam: ",
            style: TextStyle(fontSize: 18),
            ),
            trailing: Text('$exam',
            style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: Text("Project: ",
            style: TextStyle(fontSize: 18),),
            trailing: Text("$project",
            style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: Text("Quiz: ",
            style: TextStyle(fontSize: 18),),
            trailing: Text("$quiz",
            style: TextStyle(fontSize: 18),),
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
  final Function function;
  String? selectedClass;

  customCheckBoxListTile(
      {Key? key, required this.classes, required this.index, required this.function})
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
          widget.selectedClass = widget.classes[widget.index];
          isSelected = val!;
        });
        widget.function(widget.selectedClass);
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.file, size: 50.0),
                Text(pickedFile!.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ],
            ),
        ],
      ),
    );
  }
}
//Upload sayfalarında kullanılabilir sınıf sayısı kadar checkbox oluşturan sistem
class customClassListCheckboxBuilder extends StatefulWidget {
  final Function function;
  final List<String> classes;

  const customClassListCheckboxBuilder({super.key, required this.function, required this.classes});
  @override
  State<customClassListCheckboxBuilder> createState() => _customClassListCheckboxBuilderState();
}

class _customClassListCheckboxBuilderState extends State<customClassListCheckboxBuilder> {
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
        itemCount: widget.classes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: PageColors.secondaryColor,
              ),
              child: customCheckBoxListTile(classes: widget.classes, index: index, function: widget.function));
        },
      ),
    );
  }
}

//Manuel yoklama için kullanılan öğrencinin kaç saat yok yazılacağnı seçtiğimiz checkboxlar
class customEditCheckBoxListTile extends StatefulWidget {
  final String hours;
  final Function onPressed;
  final Function onChange;
  bool selected = false;

  customEditCheckBoxListTile({Key? key, required this.hours, required this.onPressed,required this.selected, required this.onChange}) : super(key: key);
  @override
  State<customEditCheckBoxListTile> createState() => _customEditCheckBoxListTileState();
}

class _customEditCheckBoxListTileState extends State<customEditCheckBoxListTile> {
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
      value: widget.selected,
      selected: !widget.selected,
      onChanged: (val) {
        widget.onPressed(hours);
        setState(() {
          widget.selected = val!;
        });
        widget.onChange();
      },
    );
  }
}

class customEditExpansionPanel extends StatefulWidget {
  final String name;
  final Function function;

  const customEditExpansionPanel({super.key, required this.name, required this.function});
  @override
  State<customEditExpansionPanel> createState() => _customEditExpansionPanelState();
}

class _customEditExpansionPanelState extends State<customEditExpansionPanel> {
  bool isSelected = false;
  List<bool> selections = [false, false, false];

  _deselectOthers(int index) {
    print('here');
      selections = List.filled(selections.length, false, growable: true);
      setState(() {
        selections[index] = true;
      });
      print(selections);
  }
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(widget.name, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0.5)
        ),
      trailing: Icon(isSelected ? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown, color: Colors.pink),
      children: <Widget>[
        customEditCheckBoxListTile(hours: "One Hour  ", onPressed: widget.function, selected: selections[0], onChange: () => _deselectOthers(0)),
        customEditCheckBoxListTile(hours: "Two Hour  ", onPressed: widget.function, selected: selections[1], onChange: () =>_deselectOthers(1)),
        customEditCheckBoxListTile(hours: "Three Hour", onPressed: widget.function, selected: selections[2], onChange: () => _deselectOthers(2)),
      ],
      onExpansionChanged: (bool val) {
          setState(() {
            isSelected = val;
          });
      },
    );
  }
}

class customAnnouncementCard extends StatefulWidget {
  final String teacherName;
  final String announcementContent;

  const customAnnouncementCard({Key? key, required this.teacherName, required this.announcementContent}) : super(key: key);

  @override
  State<customAnnouncementCard> createState() => _customAnnouncementCardState();
}

class _customAnnouncementCardState extends State<customAnnouncementCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:6.0),
      child: Card(
        color: PageColors.secondaryColor,
        elevation: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical:5.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 5.0),
                child: ListTile(
                  leading: Icon(Icons.person,size: 35,),
                  title: Text(widget.teacherName,style: TextStyle(fontSize: 20),),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text(widget.announcementContent, style: TextStyle(fontSize: 17)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class customCourseGrid extends StatefulWidget {
  final String courseName;

  const customCourseGrid({super.key, required this.courseName});
  @override
  State<customCourseGrid> createState() => _customCourseGridState();
}

class _customCourseGridState extends State<customCourseGrid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseContent(courseName: widget.courseName)));
        },
      child: Card(
        elevation: 6,
        shape: CustomBorders.mainBorder,
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25.0),
            Text(widget.courseName,
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 20.0),
            Icon(FontAwesomeIcons.bookOpen, color: PageColors.thirdColor, size: 50.0)
          ],
        ),
      ),
    );
  }
}

class customAlert extends StatefulWidget {
  @override
  State<customAlert> createState() => _customAlertState();
}

class _customAlertState extends State<customAlert> {

  int currentIndex = 0;
  int surveyOptionCount = 2;
  TextEditingController surveyTitleController = TextEditingController();
  TextEditingController paragraphController = TextEditingController();
  List<String> controllerValues = [];
  PlatformFile? pickedFile;
  String link = '';
  UploadTask? uploadTask;
  List<TextEditingController> controllers = List.generate(2, (index) => TextEditingController());

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'contents/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');
    setState(() {
      link = urlDownload;
      uploadTask = null;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget cancelButton = MaterialButton(
      child: Text("Cancel"),
      elevation: 5.0,
      color: PageColors.thirdColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget createButton = MaterialButton(
      child: Text("Create"),
      elevation: 5.0,
      color: PageColors.thirdColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      onPressed: () async {
        if(currentIndex == 0) {
          var val = await SharedFunctions.getUserNameSharedPreference();
          Map<String, dynamic> survey = {
            'sender': val,
            'contentType': 'Survey',
            'surveyTitle': surveyTitleController.text,
            'surveyOptions': []
          };
          for(int i = 0; i < controllers.length; i++) {
            controllerValues.add(controllers[i].text);
          }
          survey.update('surveyOptions', (value) => FieldValue.arrayUnion(controllerValues));
          FirebaseFunctions().sendContent(survey);
          Navigator.of(context).pop();
        }
        if(currentIndex == 1) {
          print('this is link' + link);
          var val = await SharedFunctions.getUserNameSharedPreference();
          Map<String, dynamic> Image = {
            'sender': val,
            'contentType': 'Image',
            'imageURL': link
          };
          FirebaseFunctions().sendContent(Image);
          Navigator.of(context).pop();
        }
        if(currentIndex == 2) {
          var val = await SharedFunctions.getUserNameSharedPreference();
          Map<String, dynamic> paragraph = {
            'sender': val,
            'contentType': 'Text',
            'paragraph': paragraphController.text,
          };
          FirebaseFunctions().sendContent(paragraph);
          Navigator.of(context).pop();
        }
      },
    );

    List<Widget> body = <Widget>[
      //Start of Survey Container
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            TextFormField(
              controller: surveyTitleController,
              decoration: InputDecoration(
                  label: Text('Please Write Your Title Here ...'),
                  filled: true
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: surveyOptionCount,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: controllers[index],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: PageColors.mainColor)
                        ),
                        label: Text('Please Write Your Option Here...'),
                        filled: true
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(height: 10.0)
                  ],
                );
              },
            ),
            SizedBox(height: 30.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  surveyOptionCount++;
                  controllers.add(TextEditingController());
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(FontAwesomeIcons.plus),
                  SizedBox(width: 20.0),
                  Text('Add new option...')
                ],
              ),
            )
          ],
        ),
      ),
      // End of Survey Container
      //Start of Image Container
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            GestureDetector(
              onTap: () async {
                await selectFile();
                await uploadFile();
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    color: PageColors.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                child: Icon(FontAwesomeIcons.plus),
              ),
            ),
            SizedBox(height: 20.0),
            Text('To Select Your Image Press Here ...', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
      // End of Image Container
      //Start of Text Container
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            TextFormField(
              controller: paragraphController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: PageColors.mainColor)
                  ),
                  label: Text('Please Write Your Paragraph Here ...'),
                  filled: true
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            )
          ],
        ),
      )
    ];

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Text("New Post", style: TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        cancelButton,
        SizedBox(width: 20.0),
        createButton,
      ],
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.70,
        width: MediaQuery.of(context).size.width * 0.90,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NavigationBar(
                selectedIndex: currentIndex,
                backgroundColor: Colors.white,
                onDestinationSelected: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                destinations: <Widget>[
                  Transform.scale(scale: 1.4, child: NavigationDestination(icon: Icon(FontAwesomeIcons.book), label: 'Survey')),
                  Transform.scale(scale: 1.4,child: NavigationDestination(icon: Icon(FontAwesomeIcons.photoFilm), label: 'Image')),
                  Transform.scale(scale: 1.4,child: NavigationDestination(icon: Icon(FontAwesomeIcons.textSlash), label: 'text')),
                ],
              ),
              body[currentIndex]
            ],
          ),
        ),
      ),
    );
  }
}

void customPostCreteAlert(BuildContext context) {
  customAlert alert = customAlert();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
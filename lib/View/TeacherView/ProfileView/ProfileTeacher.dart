import 'package:flutter/material.dart';
import 'package:minerva/Controller/SharedFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';


class ProfileTeacherPage extends StatefulWidget {
  @override
  State<ProfileTeacherPage> createState() => _ProfileTeacherPageState();
}

class _ProfileTeacherPageState extends State<ProfileTeacherPage> {

  String email = '';
  String userName = '';
  String tc = '';
  String schoolNumber = '';
  bool isLoading = false;

  _getUserData() async {
    setState(() {
      isLoading = true;
    });
    var val = await SharedFunctions.getUserEmailSharedPreference();
    setState(() {
      email = val!;
    });
    print(email);
    var user = await FirebaseFunctions().getTeacherData(email);
    setState(() {
      userName = user.docs[0].get('teacherName');
      tc = user.docs[0].get('tc');
      schoolNumber = user.docs[0].get('teacherNumber');
    });
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("PROFILE", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          backgroundColor: PageColors.mainColor,
        ),
        body: isLoading ?
        AnimatedSplashScreen(splash: 'assets/logo.png',splashIconSize: 200.0, disableNavigation: true, nextScreen: ProfileTeacherPage(), splashTransition: SplashTransition.fadeTransition)
            :
        Container(
          alignment: Alignment.center,
          child: Column(
              children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundColor: Colors.black, radius: 55, child: Icon(Icons.person, size: 50.0)),
              ],
            ),
            SizedBox(height: 10.0),
            Text("$userName", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("11-A", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                SizedBox(width: 15.0),
                Text("$schoolNumber", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(
              height: 23,
            ),
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      child: Container(
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.person_2),
                                SizedBox(width: 20.0),
                                Text("Name Surname", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Text("$userName", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                        margin:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.numbers_rounded),
                                  SizedBox(width: 20.0),
                                  Text("Teacher Number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                ],
                              ),
                              Text("$schoolNumber", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        )),
                    Card(
                        margin:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.cabin_rounded),
                                  SizedBox(width: 20.0),
                                  Text("Department", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Text("English", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )),
                    Card(
                        margin:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.school_rounded),
                                  SizedBox(width: 20.0),
                                  Text("School", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Text(
                                "Yunus Emre Anadolu Lisesi",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )),
                    Card(
                        margin:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.email_rounded),
                                  SizedBox(width: 20.0),
                                  Text("Email",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Text(
                                "$email",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                    ),

                  ]),
            ),
          ]),
        ),
        drawer: customDrawer());
  }
}

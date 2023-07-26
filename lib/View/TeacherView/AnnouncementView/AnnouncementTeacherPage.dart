import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/View/TeacherView/AnnouncementView/AnnouncementCreateTeacherPage.dart';

class AnnouncementTeacherPage extends StatefulWidget {
  @override
  State<AnnouncementTeacherPage> createState() => _AnnouncementTeacherPageState();
}

class _AnnouncementTeacherPageState extends State<AnnouncementTeacherPage> {

  bool isLoading = false;
  List<dynamic>? announcements;

  _getAnnouncements() async {
    setState(() {
      isLoading = true;
    });
    var val = await FirebaseFunctions().getClassData('11-A');
    setState(() {
      isLoading = false;
      announcements = val.docs[0].get('announcements');
    });
  }

  @override
  void initState() {
    super.initState();
    _getAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text("ANNOUNCEMENTS", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: isLoading ? AnimatedSplashScreen(splash: 'assets/logo.png',splashIconSize: 200.0, disableNavigation: true, nextScreen: AnnouncementTeacherPage(), splashTransition: SplashTransition.fadeTransition)
          :
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: announcements!.length,
              itemBuilder: (context, index) {
                return customAnnouncementCard(teacherName: announcements![index]['sender'], announcementContent: announcements![index]['content']);
                },
            )
          ],
        ),
      ),
      drawer: customDrawer(),
      floatingActionButton: Transform.scale(
        scale: 1.2,
        child: FloatingActionButton(
          backgroundColor: PageColors.mainColor,
            onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AnnouncementCreateTeacherPage()));
        },
            child: Icon(FontAwesomeIcons.comment, size: 30.0)
        ),
      ),
    );
  }
}
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Controller/ClassesService.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class AnnouncementStudentPage extends StatefulWidget {
  @override
  State<AnnouncementStudentPage> createState() => _AnnouncementStudentPageState();
}

class _AnnouncementStudentPageState extends State<AnnouncementStudentPage> {

  bool isLoading = false;
  List<dynamic>? announcements;

  _getAnnouncements() async {
    setState(() {
      isLoading = true;
    });
    var val = await ClassesService().getClassData('11-A');
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
      body: isLoading ? AnimatedSplashScreen(splash: 'assets/logo.png',splashIconSize: 200.0, disableNavigation: true, nextScreen: AnnouncementStudentPage(), splashTransition: SplashTransition.fadeTransition)
      :
      ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: announcements!.length,
          itemBuilder: (context, index) {
            return customAnnouncementCard(teacherName: announcements![index]['sender'], announcementContent: announcements![index]['content']);
          }
      ),
      drawer: customDrawer()
    );
  }
}

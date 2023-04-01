import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class AnnouncementStudentPage extends StatefulWidget {
  @override
  State<AnnouncementStudentPage> createState() => _AnnouncementStudentPageState();
}
// merhabalar
class _AnnouncementStudentPageState extends State<AnnouncementStudentPage> {
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
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 30.0),
            customAnnouncementCard(teacherName: 'Teacher Melis', announcementContent: 'fkljlerjglkregjelkşjglegjegrjlgkrgjerlgjrlge'),
            customAnnouncementCard(teacherName: 'Teacher Melis', announcementContent: 'fkljlerjglkregjelkşjglegjegrjlgkrgjerlgjrlge'),
            customAnnouncementCard(teacherName: 'Teacher Melis', announcementContent: 'fkljlerjglkregjelkşjglegjegrjlgkrgjerlgjrlge'),
            customAnnouncementCard(teacherName: 'Teacher Melis', announcementContent: 'fkljlerjglkregjelkşjglegjegrjlgkrgjerlgjrlge'),
            customAnnouncementCard(teacherName: 'Teacher Melis', announcementContent: 'fkljlerjglkregjelkşjglegjegrjlgkrgjerlgjrlge'),
            customAnnouncementCard(teacherName: 'Teacher Melis', announcementContent: 'fkljlerjglkregjelkşjglegjegrjlgkrgjerlgjrlge'),
            customAnnouncementCard(teacherName: 'Teacher Melis', announcementContent: 'fkljlerjglkregjelkşjglegjegrjlgkrgjerlgjrlge'),
            customAnnouncementCard(teacherName: 'Teacher Melis', announcementContent: 'fkljlerjglkregjelkşjglegjegrjlgkrgjerlgjrlge'),
          ],
        ),
      ),
      drawer: customDrawer()
    );
  }
}
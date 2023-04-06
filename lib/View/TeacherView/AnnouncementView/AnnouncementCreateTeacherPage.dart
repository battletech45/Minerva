import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';

import '../../../Model/WidgetProperties.dart';

class AnnouncementCreateTeacherPage extends StatefulWidget {
  @override
  State<AnnouncementCreateTeacherPage> createState() => _AnnouncementCreateTeacherPageState();
}

class _AnnouncementCreateTeacherPageState extends State<AnnouncementCreateTeacherPage> {

  List<String> classes = [];

  _getClasses() async {
    var val = await FirebaseFunctions().getAllClasses();
    var size = val.size;
    for(int i = 0; i<size; i++) {
      print(val.docs[i].get('className'));
      classes.add(val.docs[i].get('className'));
      print(classes.length);
    }
  }

  @override
  void initState() {
    super.initState();
    _getClasses();
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
      drawer: customDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          classListChekboxBuilder(classes: classes)
        ],
      ),
    );
  }
}
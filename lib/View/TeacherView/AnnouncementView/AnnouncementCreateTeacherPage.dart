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
  List<String> selectedClasses = [];

  _getClasses() async {
    var val = await FirebaseFunctions().getAllClasses();
    var size = val.size;
    for(int i = 0; i<size; i++) {
      setState(() {
        classes.add(val.docs[i].get('className'));
      });
    }
  }
   _toggleClassesCheck(List<String> selectedClasses, String className) {
    print('here');
    if(selectedClasses.contains(className)) {
        selectedClasses.remove(className);
    }
    else {
        selectedClasses.add(className);
    }
    if(selectedClasses.isNotEmpty) {
      print(selectedClasses[0]);
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.0),
          Text('Please select target class', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor)),
          SizedBox(height: 20.0),
          customClassListCheckboxBuilder(function: () => _toggleClassesCheck(selectedClasses, '11-A'), classes: classes)
        ],
      ),
    );
  }
}
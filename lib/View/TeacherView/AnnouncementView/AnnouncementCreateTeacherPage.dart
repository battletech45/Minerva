import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';

class AnnouncementCreateTeacherPage extends StatefulWidget {
  @override
  State<AnnouncementCreateTeacherPage> createState() => _AnnouncementCreateTeacherPageState();
}

class _AnnouncementCreateTeacherPageState extends State<AnnouncementCreateTeacherPage> {

  TextEditingController _controller = new TextEditingController();
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
      selectedClasses.forEach((element) {print(element);});
    }
  }

  _sendNewAnnouncement(List<String> selectedClasses) async {
    var userName = await SharedFunctions.getUserNameSharedPreference();
    Map<String, dynamic> announcement = {
      'sender': userName,
      'content': _controller.text
    };
    var announcementList = [announcement];
    selectedClasses.forEach((element) {
      FirebaseFunctions().sendNewAnnouncement(element, announcementList);
    });
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30.0),
            Text('Please select target class(es)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor)),
            SizedBox(height: 20.0),
            customClassListCheckboxBuilder(function: (String val) => _toggleClassesCheck(selectedClasses, val), classes: classes),
            TextFormField(
              controller: _controller,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.arrow_right, size: 40.0),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color.fromRGBO(28, 88, 140, 1))),
                labelText: 'Enter your announcement here...',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: PageColors.mainColor),
              onPressed: () {
                _sendNewAnnouncement(selectedClasses);
              },
              child: Text('Submit', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
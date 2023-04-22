import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/View/TeacherView/ContentView/TeacherClassContentPage.dart';
import 'package:minerva/View/TeacherView/HomeworksView/TeacherUploadHomework.dart';
import '../../../Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';

class ContentTeacherPage extends StatefulWidget {
  const ContentTeacherPage({super.key});

  @override
  State<ContentTeacherPage> createState() => _ContentTeacherPageState();
}

class _ContentTeacherPageState extends State<ContentTeacherPage> {
  List<String> classes = <String>[];

  _getClasses() async {
    var val = await FirebaseFunctions().getAllClasses();
    for(int i = 0; i < val.size; i++) {
      setState(() {
        classes.add(val.docs[i].get('className'));
      });
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
          title: Text("CONTENTS",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            GestureDetector(
              // onTap: () =>   Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentWeeklySchedule())),
              child: Card(
                elevation: 6,
                shape: CustomBorders.mainBorder,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25.0),
                      Text("Weekly Schedule",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
                      ),
                      SizedBox(height: 20.0),
                      Icon(FontAwesomeIcons.calendar, color: PageColors.thirdColor, size: 50.0),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                padding: EdgeInsets.all(15),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeacherClassContentPage()));
                    },
                      child: Card(
                        elevation: 6,
                        shape: CustomBorders.mainBorder,
                        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 25.0),
                            Text(classes[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)
                            ),
                            SizedBox(height: 20.0),
                            Icon(FontAwesomeIcons.school, color: PageColors.thirdColor, size: 50.0)
                          ],
                        ),
                      ),
                    );
                },
              ),
            ),
          ],
        ),
        drawer: customDrawer());
  }
}

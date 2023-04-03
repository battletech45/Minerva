import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/View/StudentView/Content/ContentStudentPage.dart';
import 'package:minerva/View/StudentView/Content/StudentWeeklySchedule.dart';
import 'package:minerva/View/StudentView/HomeworksView/StudentFileUpload.dart';
import '../../../Model/WidgetProperties.dart';

class CourseContent extends StatefulWidget {
  final String courseName;

  const CourseContent({Key? key, required this.courseName}) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  DateTime _focusedDay = DateTime.now();
  int _selectedIndex=0;
static const List<Widget> _widgetOptions = <Widget>[
  Text(
      'Index 0: Back',
     
    ),
    Text(
      'Index 1: Business',
     
    ),
    Text(
      'Index 2: School',
     
    ),
    StudentWeeklySchedule(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text(widget.courseName,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
       body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
       bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: PageColors.mainColor,
       items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.listCheck),
            label: 'Assessments',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.noteSticky),
            label: 'Materials',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendar),
            label: 'Schedule',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
    ),
      drawer: customDrawer(),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

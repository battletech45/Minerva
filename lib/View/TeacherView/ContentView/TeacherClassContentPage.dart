import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/View/TeacherView/ContentView/TeacherSubmissions.dart';
import 'package:minerva/View/TeacherView/ContentView/UploadMaterial.dart';
import 'package:minerva/View/TeacherView/HomeworksView/TeacherUploadHomework.dart';

import '../../../Model/WidgetProperties.dart';

class TeacherClassContentPage extends StatefulWidget {
  final String className;
  const TeacherClassContentPage({Key? key, required this.className}) : super(key: key);

  @override
  State<TeacherClassContentPage> createState() =>
      _TeacherClassContentPageState();
}

class _TeacherClassContentPageState extends State<TeacherClassContentPage> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    Text('exit'),
    UploadMaterial(),
    UploadHomework(),
    TeacherSubmissions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text(widget.className,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: PageColors.mainColor, width: 3))),
        child: BottomNavigationBar(
          unselectedItemColor: PageColors.mainColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Column(
                children: <Widget>[
                  Icon(FontAwesomeIcons.arrowLeft),
                  Text('Back', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Column(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.filePdf),
                    Text(
                      'Upload Material',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Column(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.upload),
                    Text(
                      'Upload Assesment',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Column(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.file),
                    Text(
                      'Submissions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                label: ''),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
      drawer: customDrawer(),
    );
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      print('exit');
      Navigator.pop(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}

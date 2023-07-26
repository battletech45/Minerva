import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/View/StudentView/HomeworksView/StudentHomeWorkViewPage.dart';
import 'package:minerva/View/StudentView/Content/StudentMaterialPage.dart';
import '../../../Control/SharedFunctions.dart';
import '../../../Model/WidgetProperties.dart';

class CourseContent extends StatefulWidget {
  final String courseName;

  const CourseContent({Key? key, required this.courseName}) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {

  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    Text('exit'),
    StudentHomeWorkViewPage(),
  ];

  _setMaterial() async {
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var student = await FirebaseFunctions().getStudentData(email!);
    String? className = await FirebaseFunctions().findStudentsClass(student.docs[0].get('studentID'));
    StudentMaterialPage materialPage = StudentMaterialPage(className: className!);
    setState(() {
      _widgetOptions.insert(2, materialPage);
    });
  }

  @override
  void initState() {
    super.initState();
    _setMaterial();
  }

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
       bottomNavigationBar: Container(
         decoration: BoxDecoration(
           border: Border(top: BorderSide(color: PageColors.mainColor, width: 3))
         ),
         child: BottomNavigationBar(
          unselectedItemColor: PageColors.mainColor,
         items:  <BottomNavigationBarItem>[
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
                  Icon(FontAwesomeIcons.listCheck),
                  Text('Assesments', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: <Widget>[
                  Icon(FontAwesomeIcons.noteSticky),
                  Text('Materials', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
                label: ''
            ),
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
    if(index == 0) {
      print('exit');
      Navigator.pop(context);
    }
    else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
